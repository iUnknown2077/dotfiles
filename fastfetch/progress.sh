#!/usr/bin/env bash

time1="11/14/2025 01:00AM"
let current=$(date +%s)
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression/ 86400))
echo -e "$days_done days done"
