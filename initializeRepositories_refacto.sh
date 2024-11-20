#!/usr/bin/env bash

# VARIABLES
REPO_LIST_FILE="Repositories.lst"
LOG_FILE_PREFIX="refreshGIT_logs/_refreshGIT_Log_"
LOG_FILE="${LOG_FILE_PREFIX}$(date +%Y%m%d_%H%M).log"

# FUNCTIONS
function update_repo() {
    local repo_dir="$1"
    echo -e "\n$repo_dir"
    pushd "$repo_dir" >/dev/null || return
    git pull
    sleep 2
    popd >/dev/null || return
    echo "$repo_dir" >> "$LOG_FILE"
}

# MAIN
echo -e > "$LOG_FILE"
while read -r repo_dir; do
    update_repo "$repo_dir"
done < "$REPO_LIST_FILE"
