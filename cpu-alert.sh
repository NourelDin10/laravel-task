#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
THRESHOLD=50

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "CPU usage is above 50%: $CPU_USAGE%" | mail -s "CPU Alert on Server" noureldinessa99@gmail.com
fi

