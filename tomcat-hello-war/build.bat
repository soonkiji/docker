cd hello
call mvnw clean install
copy /y target\hello.war ..\tomcat\usr\local\tomcat\webapps\
cd ..
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up --build -d
