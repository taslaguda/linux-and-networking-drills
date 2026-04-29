# Recovery Log – Week 2

## Incident 1 – Wrong Port
Symptom: curl failed immediately with no response.
Check ran: curl -s --max-time 5 http://localhost:8999
What I found: Exit code 7 - connection refused.
What it meant: Nothing is listening on port 8999. I was testing
the wrong port entirely.
What I changed: Switched to the correct port 8016.
Recovery confirmed: curl returned 200 on port 8016.

## Incident 2 – Service Not Responding
Symptom: curl timed out even though port 8016 appeared in ss.
Check ran: curl -s --max-time 5 http://localhost:8016
What I found: Exit code 28 - timeout. Port was listed as LISTEN
but the netcat process was suspended and not serving requests.
What I changed: Ran sudo pkill -f "nc -l" to clear suspended
processes, then restarted the script fresh.
Recovery confirmed: curl returned Week 2 simple service is running
on port 8016 after restart.
