#! /usr/bin/env bash

### FUNCTIONS

### Wrong datas so quit
quittos() {
    echo "" && echo -e "\e[91m Quit !" && echo ""
    exit
    #    break
}

### Verifying if exist directories and files
verifyDirectory() {
    for z in ${!dirArray[@]}; do
        # echo -e "element $z is ${dirArray[$z]}"
        if [ -d "${dirArray[z]}" ]; then
            echo -e " ${dirArray[z]} -- ok"
        else
            echo -e "" && echo -e "\e[91m ERROR : The directory '${dirArray[z]}' does not exist -->> Quit !"
            echo -e " ERROR : The directory '${dirArray[z]}' does not exist" >>$loggerFile
            mkdir -p "${dirArray[z]}"
            quittos
        fi
    done
}

verifyFile() {
    for y in ${!filesArray[@]}; do
        # echo -e "element $y is ${filesArray[$y]}"
        if [ -f "${filesArray[y]}" ]; then
            echo -e " ${filesArray[y]} -- ok"
        else
            echo -e "" && echo -e "\e[91m ERROR : The file '${filesArray[y]}' does not exist -->> Quit !"
            echo -e " ERROR : The file '${filesArray[y]}' does not exist" >>$loggerFile
            quittos
        fi
    done
}

### BEGIN MAIN ###

### VARIABLES ###

source="sources/repo_list.lst"
workdir="workspace"
user=`whoami`
timeRightNow=`date +%Y%m%d`
loggerFile="refreshGIT_logs/_refreshGIT_Log_$timeRightNow.log"
> $loggerFile

dirArray=("refreshGIT_logs" "sources")
filesArray=("$source" "$loggerFile")

echo -e "\n Verify the directories :" && verifyDirectory
echo -e "\n Verify the files :" && verifyFile
echo -e "\n"
echo -e "\n #A - OKAY for directories and files\n" >>$loggerFile

while read line  
do   
   echo -e "$line\n"
   cd && cd "$workdir/$line/"
   git pull
   cd && cd "$workdir/"
   sleep 1s
   echo -e "$line" >> "/home/$user/$workdir/refreshGIT/$loggerFile"
done < $source

### END MAIN ###