#!/bin/bash

echo "===== System Information Report ====="
echo

# 1. System Hostname
echo "Hostname: $(hostname)"
echo

# 2. Operating System
echo "Operating System:"
lsb_release -a 2>/dev/null
echo

# 3. Uptime (How long the system has been online)
echo "Uptime:"
uptime -p
echo

# 4. Linux Kernel Version
echo "Kernel Version:"
uname -r
echo

# 5. General CPU Information
echo "CPU Information:"
lscpu | grep -E 'Model name|Socket|Thread|Core|CPU\(s\)'
echo

# 6. Memory (Available and Free in human-readable format)
echo "Memory Info:"
free -h
echo

# 7. IP and MAC Information for all network interfaces
echo "Network Interfaces:"
ip -brief address
echo

# 8. Filesystem Utilization (Human-readable with types)
echo "Filesystem Utilization:"
df -hT
echo

# 9. Last five lines of logs containing 'error' (case-insensitive)
echo "Last 5 'error' log entries (case-insensitive):"
journalctl -p 3 -n 5 2>/dev/null || grep -i "error" /var/log/syslog | tail -n 5
echo

echo "===== End of Report ====="
