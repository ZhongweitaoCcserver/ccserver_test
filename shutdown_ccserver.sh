#! /bin/bash
(
echo 'SHUTDOWN' 
sleep 1
) | telnet 127.0.0.1 9997

