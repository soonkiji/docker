FROM sdoxsee/jboss-eap
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4
ADD hello/target/hello.war $JBOSS_HOME/standalone/deployments/
WORKDIR $JBOSS_HOME/standalone
CMD ["/opt/jboss/jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
