cd hello
call mvnw clean install
copy /y target\hello.war ..\jboss\jboss_home\standalone\deployments\
cd ..
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up --build -d
