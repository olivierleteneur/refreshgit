#!/usr/bin/env ksh

# VARIABLES
REPO_LIST_FILE="repositories.lst"
LOG_FILE_PREFIX="refreshGIT_logs/_refreshGIT_Log_"
LOG_FILE="${LOG_FILE_PREFIX}$(date +%Y%m%d_%H%M).log"

# FUNCTIONS
function update_repo() {
    local repo_dir="$1"
    echo -e "\n$repo_dir"
    cd "$repo_dir" || return
    git pull
    sleep 2
    cd - >/dev/null || return
    echo "$repo_dir" >> "$LOG_FILE"
}

# MAIN
echo -e > "$LOG_FILE"
while read -r repo_dir; do
    update_repo "$repo_dir"
done < "$REPO_LIST_FILE"
