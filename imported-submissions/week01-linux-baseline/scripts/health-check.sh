#!/bin/bash
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

echo "==================================="
echo " HOST HEALTH CHECK"
echo "Timestamp : $(date)"
echo "Hostname  : $(hostname)"
echo "==================================="

echo "--- Uptime ---"
uptime

echo "--- Memory ---"
free -h
MEMORY_USED=$(free | awk "/Mem:/ {printf \"%.0f\", \$3/\$2 * 100}")
echo "Memory used: ${MEMORY_USED}%"
[ "$MEMORY_USED" -gt "$MEMORY_THRESHOLD" ] && echo "WARNING: Memory above ${MEMORY_THRESHOLD}%"

echo "--- Disk ---"
df -h /
DISK_USED=$(df / | awk "NR==2 {print \$5}" | tr -d "%")
[ "$DISK_USED" -gt "$DISK_THRESHOLD" ] && echo "WARNING: Disk above ${DISK_THRESHOLD}%"

echo "--- Services ---"
echo "SSH  : $(systemctl is-active ssh)"
echo "Cron : $(systemctl is-active cron)"
echo "==================================="
