Test-Command() {
     local __resultvar=$1;shift
     if [ $# -lt 2 ];then
	     echo "Invalid command $@"
	     return -1
     fi
     cmd_out=$($@ 2>&1)
     cmd_res=$?
     if [ $? -ne 0 ];then
	     echo "$1 package does not exist on this machine"
     fi
    eval $__resultvar="'$cmd_out'"
    return $cmd_res
}

RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
LIGHT_RED='\033[1;31m'

CMD_WRAPPER(){
	COLOR=$1;CMD_NAME=$2;shift 2;
	Test-Command res $@
	if [ $? -eq 0 ];then
		echo -e "'$CMD_NAME' \t: $COLOR $res $RESET"
	else
		echo -e "'$CMD_NAME' \t: $COLOR NOT PRESENT $RESET"
	fi
}
echo  '=== Programming Language CLI ==='
CMD_WRAPPER $GREEN PHP php -v
CMD_WRAPPER $RED Python python --version
CMD_WRAPPER $BLUE Ruby ruby -v
CMD_WRAPPER $YELLOW Go go version
echo  '---------------------------------------------------'
echo 
echo  '=== Package Manager ==='
CMD_WRAPPER $RED Dotnet dotnet --version
CMD_WRAPPER $RED composer composer -V
CMD_WRAPPER $RED npm npm -v
CMD_WRAPPER $RED gulp gulp -v
CMD_WRAPPER $RED yarn yarn -v
CMD_WRAPPER $RED pip pip --version
CMD_WRAPPER $RED gem gem --version
echo 
echo  '---------------------------------------------------'
echo 
echo  '=== Framework ==='
CMD_WRAPPER $LIGHT_RED Laravel laravel -V

read -n 1 -s -r -p "Press any key to continue"
