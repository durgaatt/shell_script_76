#!/bin/bash

echo "Script name: $0"
echo "Number of arguments: $#"
echo "Arguments as a single string (\$*): $*"
echo "Arguments as separate words (\$@): $@"
echo "First argument (\$1): $1"
echo "Exit status of last command (\$?): $?"
echo "PID of this script (\$$): $$"
sleep 5 &
echo "PID of last background process (\$!): $!"
echo "Current shell options (\$-): $-"