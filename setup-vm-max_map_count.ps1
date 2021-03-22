& wsl -d docker-desktop -e "sysctl -w vm.max_map_count=262144"
& wsl -d docker-desktop -- sysctl -w vm.max_map_count
& docker-machine --native-ssh create --driver hyperv --hyperv-virtual-switch docker-machine-switch default
& docker-machine rm default -y
& docker-machine --native-ssh ssh default ls -la
& docker-compose -f .\sonarqube.yml up -d
