#!/bin/bash
To_Team=$1
ALERT_TYPE=$2
IP_Address=$3
MSG=$4
Final_msg=$(print f '%s\n' "$MSG" | sed -e 's/[]\/s*^[]/\\&g')
To_ADDRESS=$5
SUBJECT=$6
FINAL_BODY=$(sed -e "s/TO_Team/$TO_Team/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_Address/$IP_Address/g" -e "s/MSG/$FINAL_msg/g" template.html)
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"