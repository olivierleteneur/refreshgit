#! /usr/bin/env ksh

### VARIABLES ###
source="Repositories.lst"
# timeRightNow=`date +%m%d%Y_%H%M`
timeRightNow=$(date +%Y%m%d_%H%M)
log="refreshGIT_logs/_refreshGIT_Log_$timeRightNow.log"

### MAIN ###
echo -e > "$log"
while read -r line  
do   
   echo -e "\n $line"
   cd $line
#   git pull https://tools.publicis.sapient.com/bitbucket/scm/nipa/"$line".git
#   git config pull.rebase false
   git pull
   sleep 2
   cd ~/Repositories
   echo -e "$line" >> "$log"
done < $source
### END MAIN ###