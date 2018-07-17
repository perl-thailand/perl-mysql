use strict;
use warnings;
use Time::HiRes qw(usleep time sleep);
use DBI;

my $start = time();

# Start

my $dbh = DBI->connect("DBI:mysql:perl_thailand:mysql", "perl_thailand", "perl_thailand") 
	or die "Can't connect to database: $DBI::errstr\n";
my $sth = $dbh->prepare('SELECT bill_sale_id, bill_sale_detail_id FROM tb_bill_sale JOIN tb_bill_sale_detail ON tb_bill_sale.bill_sale_id=tb_bill_sale_detail.bill_id');
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