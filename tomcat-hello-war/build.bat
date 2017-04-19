cd hello
call mvnw clean install
copy /y target\hello.war ..\tomcat\usr\local\tomcat\webapps\
cd ..
docker-compose up --force-recreate -d