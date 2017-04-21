FROM wnameless/oracle-xe-11g
ENV ORACLE_ALLOW_REMOTE true
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH $ORACLE_HOME/bin:$PATH
ADD tmp/petstoredb* /tmp/
ADD tmp/testdb* /tmp/
ADD tmp/entrypoint.sh /tmp/
EXPOSE 1521:1521
ENTRYPOINT ["/bin/sh", "/tmp/entrypoint.sh"]