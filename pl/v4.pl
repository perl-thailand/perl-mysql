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
my $n = 0;
while (my $row = $sth->fetchrow_hashref()) {
	my $sth2 = $dbh->prepare('SELECT bill_id,bill_sale_detail_id FROM tb_bill_sale_detail WHERE bill_id='.$row->{bill_sale_id});
	$sth2->execute();
	while (my $row2 = $sth2->fetchrow_hashref()) {
		# print join ('-', values %$row2), "\n";
		$n++;
	}
	$sth2->finish();
}

$sth->finish();
$dbh->disconnect();
print($n." records\n");

# End

my $end = time();
printf("%.3f s\n", $end - $start);