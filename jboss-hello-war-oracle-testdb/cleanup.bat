@echo off
call stopservices.bat
pushd petstoreapi && (
	call mvn clean
	popd
)
del /q jboss\jboss_home\standalone\deployments\petstoreapi.war > NUL 2>&1