# Week 2 Submission - tasmin

## What This Contains
This folder is a networking troubleshooting runbook completed on a
shared AWS server. It covers running a local HTTP service, proving
healthy state, creating controlled failures, recovering the service,
and investigating public endpoint behaviour.

## My Assigned Port
Port 8016. Tasmin is position 17 in /home, counting real student
folders only from port 8000. See evidence/port-selection.txt.

## Where The Script Is
scripts/start-simple-service.sh
Run with: sudo bash scripts/start-simple-service.sh
Enter 8016 when prompted.

## Where The Evidence Is
- evidence/port-selection.txt       port assignment proof
- evidence/local-healthy-checks.txt service confirmed working
- evidence/local-failure-checks.txt two controlled failures recorded
- evidence/public-endpoint-checks.txt four public endpoints tested

## Where The Notes Are
- notes/troubleshooting-runbook.md  step by step runbook
- notes/recovery-log.md             incident log with recovery steps
