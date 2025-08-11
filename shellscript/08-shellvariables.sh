#!/bin/bash
echo "all variables passed to the script: $@"
echo "Number of variables: $#"
echo "script name $0 "
echo "PID $$"
sleep 10 &
echo "PID at background: $!"
echo "current directory $pwd"
echo "user running with script $user"
