use strict;
use warnings;
use Time::HiRes qw(usleep time sleep);
use DBI;

my $start = time();

# Start

my $dbh = DBI->connect("DBI:mysql:perl_thailand:mysql", "perl_thailand", "perl_thailand") 
	or die "Can't connect to database: $DBI::errstr\n";
my $sth = $dbh->prepare('SELECT bill_sale_id FROM tb_bill_sale');
$sth->execute();
my @bill_sale_id_list = ();
while (my $row = $sth->fetchrow_hashref()) {
	push @bill_sale_id_list, $row->{bill_sale_id};
}
$sth->finish();
# print join (',', values @bill_sale_id_list), "\n";
$sth = $dbh->prepare('SELECT bill_id,bill_sale_detail_id FROM tb_bill_sale_detail WHERE bill_id IN('.join(',',@bill_sale_id_list).(')'));
$sth->execute();
my $n = 0;
while (my $row = $sth->fetchrow_hashref()) {
	# print join ('-', values %$row), "\n";
	$n++;
}
$sth->finish();
$dbh->disconnect();
print($n." records\n");

# End

my $end = time();
printf("%.3f s\n", $end - $start);