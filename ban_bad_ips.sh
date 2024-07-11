#!/bin/bash

# Paths to your Nginx log files
NGINX_LOG_FILES=(
    "/var/log/nginx/access.log"
    "/var/log/nginx/access.log.1"
    "/var/log/nginx/access.log.2"
    "/var/log/nginx/access.log.3"
)

# Initialize an empty array to hold unique IPs
declare -A UNIQUE_IPS

# Function to extract IPs from a log file
extract_ips() {
    local LOG_FILE=$1
    awk '$9 == 400 {print $1}' $LOG_FILE | sort | uniq
}

# Iterate over each log file
for LOG_FILE in "${NGINX_LOG_FILES[@]}"; do
    if [[ -f "$LOG_FILE" ]]; then
        IPS=$(extract_ips "$LOG_FILE")
        for IP in $IPS; do
            UNIQUE_IPS["$IP"]=1
        done
    else
        echo "Log file $LOG_FILE not found!"
    fi
done

# Ban the unique IPs using CrowdSec CLI
for IP in "${!UNIQUE_IPS[@]}"; do
    echo "Banning IP: $IP"
    cscli decisions add -t manual -i $IP -r "HTTP 400 errors"
done

echo "Banning completed."
