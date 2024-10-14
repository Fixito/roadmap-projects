#!/bin/bash

echo "===== Server Performance Stats ====="

# CPU usage
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}'

# Memory usage
echo "Total Memory Usage:"
free -m | awk 'NR==2{printf "Memory Used: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2}'

# Disk usage
echo "Total Disk Usage:"
df -h | awk '$NF=="/"{printf "Disk Used: %d/%dGB (%s)\n", $3, $2, $5}'

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

# Stretch goal: Additional stats
echo "OS Version:"
lsb_release -a

echo "Uptime:"
uptime -p

echo "Load Average:"
uptime | awk '{print "Load Average: " $8, $9, $10}'

echo "Logged in Users:"
who

# End of script
echo "===================================="

echo "Press any key to exit..."
read -n 1