# Troubleshooting Runbook – Week 2

## Step 1 – Identifying My Assigned Port
Ran: ls -al /home
Counted real student folders only, ignoring . .. deploy and support-user.
Tasmin was position 17, which maps to port 8016.
Evidence: evidence/port-selection.txt

## Step 2 – Starting The Local Service
Ran: sudo bash scripts/start-simple-service.sh
Entered 8016 when prompted.
The script uses netcat to serve one HTTP response then stops.
To test again, restart the script.

## Step 3 – Proving Healthy State
Check 1 - Is something listening?
Ran: ss -tlnp | grep 8016
Saw: LISTEN 0.0.0.0:8016
This proves the port is bound and waiting for connections.

Check 2 - Does it respond to HTTP?
Ran: curl -s --max-time 5 http://localhost:8016
Saw: Week 2 simple service is running on port 8016
This proves the service returned a meaningful HTTP response.
Evidence: evidence/local-healthy-checks.txt

## Step 4 – Wrong Port Failure
Ran: curl -s --max-time 5 http://localhost:8999
Exit code 7 - connection refused.
Nothing is listening on 8999. This port is outside the assigned
range entirely. Exit code 7 always means nothing is there.
Evidence: evidence/local-failure-checks.txt

## Step 5 – Service Not Running Failure
Ran: curl -s --max-time 5 http://localhost:8016 after service stopped.
Exit code 28 - timeout.
The port showed in ss but the process was suspended and not serving.
Recovery: sudo pkill -f "nc -l" then restart the script.
Evidence: evidence/local-failure-checks.txt

## Step 6 – Public Endpoint Scenarios
Healthy HTTPS - https://example.com
Result 200. TLS handshake succeeded. This is what healthy looks like.

Plain HTTP - http://neverssl.com
Result 200. No TLS. Connection works but traffic is unencrypted.

Redirect - https://httpbin.org/redirect/1
Result 302. Server is pointing elsewhere. Not a failure but not final.

TLS Failure - https://expired.badssl.com
Result 000, exit code 60. Certificate expired. curl refused to connect.
Exit code 60 always means a certificate problem.
Evidence: evidence/public-endpoint-checks.txt
