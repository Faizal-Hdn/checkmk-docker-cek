#!/bin/bash

TH_RUNNING='$RUNNING'
TH_EXITED='$EXITED'

RUNNING=$(docker ps -q | wc -l)
EXITED=$(docker ps -a | grep "Exited" | wc -l)

WARN_RUNNING=expr $TH_RUNNING + 1
CRIT_RUNNING=expr $TH_RUNNING + 3

WARN_EXITED=expr $TH_EXITED + 1
CRIT_EXITED=expr $TH_EXITED + 3

echo "P \"Docker Containers Ops\" running=$RUNNING;$WARN_RUNNING;$CRIT_RUNNING|exited=$EXITED;$WARN_EXITED;$CRIT_EXITED Containers Running: $RUNNING, Exited: $EXITED"
