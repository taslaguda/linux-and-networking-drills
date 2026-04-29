# Server Baseline - Handover Notes

## Machine
- Hostname: ip-172-31-18-193
- OS: Ubuntu 24.04.4 LTS
- Kernel: 6.17.0-1007-aws
- Environment: Shared AWS server

## Account
- Username: tasmin
- UID/GID: 1021
- Home Directory: /home/tasmin
- Access: Standard user with sudo privileges

## Working Area
- Submission folder: /week01-submissions/tasmin-linux-baseline/
- Personal workspace: /home/tasmin/workspace/

## Directory Structure
- evidence/ contains all proof files
- scripts/ contains health-check.sh
- notes/ contains this file and README.md

## Health Check Script
- Location: scripts/health-check.sh
- Reports: timestamp, hostname, uptime, memory, disk, SSH, cron
- Warns if memory or disk exceeds 80%
- Output: evidence/health-check-output.txt

## Assumptions and Limitations
- Cron was set every minute for testing, remove after submission
- Evidence files are root-owned, sudo tee used to write them
- Baseline reflects host state on 13 April 2026
