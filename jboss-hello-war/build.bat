cd hello
call mvnw clean install
cd ..
docker-compose up --force-recreate -d