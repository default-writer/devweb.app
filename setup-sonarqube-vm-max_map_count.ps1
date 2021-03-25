& docker-machine rm default -y
& docker-machine --native-ssh create --driver hyperv --hyperv-virtual-switch docker-machine-switch default
& docker-machine start default
& docker-machine --native-ssh ssh default sysctl -w vm.max_map_count=262144
& wsl -d docker-desktop -e "echo 262144 > /proc/sys/vm/max_map_count"
& wsl -d docker-desktop -- sysctl -w vm.max_map_count=262144
& wsl -d docker-desktop -- sysctl vm.max_map_count
& docker-compose -f .\sonarqube.yml down
& docker-compose -f .\sonarqube.yml up -d