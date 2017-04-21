FROM sdoxsee/jboss-eap
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4

# jboss config
ADD jboss_home/standalone/configuration/standalone-custom.xml $JBOSS_HOME/standalone/configuration/

# jboss modules
RUN mkdir -p $JBOSS_HOME/modules/system/layers/base/com/oracle/ojdbc6/main
ADD jboss_home/modules/system/layers/base/com/oracle/ojdbc6/main/module.xml $JBOSS_HOME/modules/system/layers/base/com/oracle/ojdbc6/main/
ADD jboss_home/modules/system/layers/base/com/oracle/ojdbc6/main/ojdbc6.jar $JBOSS_HOME/modules/system/layers/base/com/oracle/ojdbc6/main/
# ADD jboss_home/modules/system/layers/base/com/oracle/ojdbc6/main/ojdbc6.jar.index $JBOSS_HOME/modules/system/layers/base/com/oracle/ojdbc6/main/

# web applications
ADD jboss_home/standalone/deployments/petstoreapi.war $JBOSS_HOME/standalone/deployments/

WORKDIR $JBOSS_HOME/standalone
CMD ["/opt/jboss/jboss-eap-6.4/bin/standalone.sh", "-c", "standalone-custom.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
