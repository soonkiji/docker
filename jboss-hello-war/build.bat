cd hello
call mvnw clean install
copy /y target\hello.war ..\jboss\jboss_home\standalone\deployments\
cd ..
docker-compose up --force-recreate -d