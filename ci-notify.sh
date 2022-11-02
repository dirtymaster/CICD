#!/bin/bash

if [[ ${2} == "1" ]] && [[ $CI_JOB_STATUS == "success" ]]; then
    exit;
fi

STATUS="$(echo "$CI_JOB_STATUS")"

TELEGRAM_BOT_TOKEN="5549654110:AAEa5BfPwLtaHiuWvY6dL307hTWwdGxtZ3Y"
TELEGRAM_USER_ID="1969848732"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$(echo ${1}) status: $STATUS"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
