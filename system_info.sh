#!/bin/bash

# Output file
OUTPUT="/tmp/system_report.txt"

# Create or clear the output file
> "$OUTPUT"

echo "System Information Report - $(date)" >> "$OUTPUT"
echo "-------------------------------------" >> "$OUTPUT"

# Hostname
echo -e "\nHostname:" >> "$OUTPUT"
hostname >> "$OUTPUT"

# Operating System
echo -e "\nOperating System:" >> "$OUTPUT"
lsb_release -a 2>/dev/null | grep Description | cut -f2- >> "$OUTPUT"

# Uptime
echo -e "\nSystem Uptime:" >> "$OUTPUT"
uptime -p >> "$OUTPUT"

# Kernel Version
echo -e "\nKernel Version:" >> "$OUTPUT"
uname -r >> "$OUTPUT"

# CPU Info
echo -e "\nCPU Info:" >> "$OUTPUT"
lscpu | grep 'Model name\|CPU(s):\|Architecture' >> "$OUTPUT"

# Memory Info
echo -e "\nMemory Info:" >> "$OUTPUT"
free -h >> "$OUTPUT"

# IP and MAC Info
echo -e "\nNetwork Interfaces:" >> "$OUTPUT"
ip -brief address >> "$OUTPUT"

# Filesystem Usage
echo -e "\nFilesystem Usage:" >> "$OUTPUT"
df -hT >> "$OUTPUT"

# Log Errors
echo -e "\nLast 5 'error' lines from syslog:" >> "$OUTPUT"
grep -i error /var/log/syslog | tail -5 >> "$OUTPUT"

# End of Report
echo -e "\nReport complete. Saved to $OUTPUT"
