cd hello && (
	call mvnw clean install
	md ..\tomcat\usr\local\tomcat\webapps\ > NUL 2>&1
	copy /y target\hello.war ..\tomcat\usr\local\tomcat\webapps\
	cd ..
)
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up --build -d
