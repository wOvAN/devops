#!/bin/sh

set -e
#################################################################################

BOT_TOKEN='******'
CHAT_ID='*******'
URL='https://api.telegram.org/bot'${BOT_TOKEN}
MSG_URL=$URL'/sendMessage?chat_id='

send_message (){
    curl --data-urlencode "text=$2" "${MSG_URL}$1&"
}

content="Test Message"

send_message ${CHAT_ID} "${content}"

#################################################################################
