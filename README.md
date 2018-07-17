# perl-mysql

[https://www.facebook.com/PerlThailand/](https://www.facebook.com/PerlThailand/)

Run the following commands one by one:

docker-compose up -d

docker-compose run --rm mysql bash -c "mysql -hmysql -uperl_thailand -pperl_thailand < /sql/create.sql"

docker-compose run --rm mysql bash -c "mysql -hmysql -uperl_thailand -pperl_thailand < /sql/insert.sql"

docker-compose run --rm perl perl /pl/v1.pl

docker-compose run --rm perl perl /pl/v2.pl

docker-compose run --rm perl perl /pl/v3.pl

docker-compose run --rm perl perl /pl/v4.pl

docker-compose run --rm mysql bash -c "mysql -hmysql -uperl_thailand -pperl_thailand < /sql/drop-index.sql"

docker-compose run --rm perl perl /pl/v4.pl

docker-compose run --rm mysql bash -c "mysql -hmysql -uperl_thailand -pperl_thailand < /sql/drop.sql"

docker-compose down

docker image rm -f perl-mysql_perl mysql:5.7 perl:5.28