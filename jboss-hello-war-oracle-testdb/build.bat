cd petstoreapi
call mvnw clean install
mkdir ..\jboss\jboss_home\standalone\deployments\
copy /y target\petstoreapi.war ..\jboss\jboss_home\standalone\deployments\
cd ..
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up --build -d
