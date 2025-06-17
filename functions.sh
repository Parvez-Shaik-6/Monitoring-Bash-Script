#!/usr/bin/env bash


# Email Alert Function
send_alert(){
  RESOURCE=$1
  USAGE=$2
  THRESHOLD=$3
  {
    echo "Subject: $RESOURCE USAGE Alert"
    echo "To: $EMAIL"
    echo "From: $EMAIL"
    echo "Alert: $RESOURCE usage has exceeded the threshold $THRESHOLD .Current usage $USAGE%"
  } | msmtp "$EMAIL"
}



#Cpu Monitoring Function

monitor_cpu(){
  CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}')
  CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
  echo "$(date '+%F %T') - Memory Usage: $CPU_USAGE%" >> "$LOG_FILE"


  if (( $(echo "$CPU_USAGE > $CPU_USAGE_LIMIT" | bc -l) ));then
   send_alert "CPU" "$CPU_USAGE" "$CPU_USAGE_LIMIT"
  fi
}



# Memory Monitoring Function

monitor_memory(){
  MEMORY_USAGE=$(free | awk '/^Mem:/ {printf "%.2f", $3/$2 * 100}')
  echo "$(date '+%F %T') - Memory Usage: $MEMORY_USAGE%" >> "$LOG_FILE"


  if (( $(echo "$MEMORY_USAGE > $MEMORY_USAGE_LIMIT" | bc -l) ));then
   send_alert "MEMORY" "$MEMORY_USAGE" "$MEMORY_USAGE_LIMIT"
  fi
}


#MOnitor Disk Usage function

monitor_disk(){

 DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: $DISK_USAGE%" >> "$LOG_FILE"

if (( $(echo "$DISK_USAGE > $DISK_USAGE_LIMIT" | bc -l) ));then
 send_alert "DISK" "$DISK_USAGE" "$DISK_USAGE_LIMIT"
fi
}