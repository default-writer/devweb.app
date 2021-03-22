$pwd = Get-Location
& docker run --rm -e SONAR_HOST_URL -e SONAR_LOGIN --env-file .env -v ${pwd}:/usr/src sonarsource/sonar-scanner-cli

