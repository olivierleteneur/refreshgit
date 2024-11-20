#! /usr/bin/env ksh

### VARIABLES ###
source=repositories.lst
# timeRightNow=`date +%m%d%Y_%H%M`
timeRightNow=$(date +%Y%m%d_%H%M)
log="refreshGIT_logs/_initializeRepositories_Log_$timeRightNow.log"

### MAIN ###
echo -e > "$log"
while read -r line  
do   
   echo -e "\n https://tools.publicis.sapient.com/bitbucket/scm/nipa/$line.git"
   git clone https://tools.publicis.sapient.com/bitbucket/scm/nipa/"$line".git
   sleep 2
   echo -e "$line" >> "$log"
done < $source
### END MAIN ###