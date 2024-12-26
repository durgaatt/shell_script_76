#!/bin/bash

uid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FILE="output.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
validate() {
    if [ $1 -eq 0 ]; then
        echo -e "$G $2 Package installed successfully $N"
        echo "$DATE $2 Package installed successfully" >> "$LOG_FILE"
    else
        echo -e "$R $2 Package installation failed/already installed $N"
        echo "$DATE $2 Package installation failed/already installed" >> "$LOG_FILE"
    fi
}

if [ $uid -ne 0 ]; then
    echo -e "$R Please run the script as root user. Current UID: $uid $N"
    exit 1
else
    echo -e "$G You are running this script as root user. UID: $uid $N"
    echo "$DATE Running script as root. UID: $uid" >> "$LOG_FILE"
fi

if [ $# -eq 0 ]; then
    echo -e "$R No packages specified. Usage: $0 package1 package2 ... $N"
    echo "$DATE No packages specified." >> "$LOG_FILE"
    exit 1
fi

echo "$DATE Starting package installation..." >> "$LOG_FILE"

for pkg in "$@"; do
    echo -e "$Y Installing $pkg $N"
    echo "$DATE Installing $pkg..." >> "$LOG_FILE"
    yum install -y "$pkg" >>"$LOG_FILE" 2>&1
    validate $? "$pkg"
done

echo "$DATE Script completed." >> "$LOG_FILE"