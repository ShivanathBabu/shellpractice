#!/bin/bash
To_Team=$1
ALERT_TYPE=$2
IP_Address=$3
MSG=$4
FINAL_MSG=$(printf '%s\n' "$MSG" | sed -e 's/[]\/$*.^[]/\\&/g')
To_ADDRESS=$5
SUBJECT=$6
if [ -z "$To_ADDRESS" ]; then
  echo "ERROR: No recipient email provided"
  exit 1
fi
FINAL_BODY=$(sed -e "s/To_Team/$To_Team/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_Address/$IP_Address/g" -e "s/MSG/$FINAL_msg/g" template.html)
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"