# run the original command
sh /usr/sbin/startup.sh
echo `basename $0` OK /usr/sbin/startup.sh

# run my commands
n=1
echo `basename $0` $n. $ORACLE_HOME/bin/tnsping XE
until $ORACLE_HOME/bin/tnsping XE
do
	sleep 5
	n=`expr $n + 1`
	echo `basename $0` $n. $ORACLE_HOME/bin/tnsping XE
done
echo `basename $0` OK connected

$ORACLE_HOME/bin/sqlplus -S system/oracle@xe @/tmp/testdb-db.sql
echo `basename $0` OK /tmp/testdb-db.sql
$ORACLE_HOME/bin/sqlplus -S testuser/testpass@xe @/tmp/testdb-ddl.sql
echo `basename $0` OK /tmp/testdb-ddl.sql
$ORACLE_HOME/bin/sqlplus -S testuser/testpass@xe @/tmp/testdb-dml.sql
echo `basename $0` OK /tmp/testdb-dml.sql

$ORACLE_HOME/bin/sqlplus -S system/oracle@xe @/tmp/petstoredb-db.sql
echo `basename $0` OK /tmp/petstoredb-db.sql
$ORACLE_HOME/bin/sqlplus -S petstoreuser/petstorepass@xe @/tmp/petstoredb-ddl.sql
echo `basename $0` OK /tmp/petstoredb-ddl.sql
$ORACLE_HOME/bin/sqlplus -S petstoreuser/petstorepass@xe @/tmp/petstoredb-dml.sql
echo `basename $0` OK /tmp/petstoredb-dml.sql
echo `basename $0` OK db setup is done.
while true; do sleep 100; done