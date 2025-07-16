time1="7/15/2025 12:00AM"
let current=$(date +%s)
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression/ 86400))
echo $days_done days done
