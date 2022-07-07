#! /bin/sh

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

curl --location --request POST "http://localhost:$KONG_GW_ADMIN_HTTP_PORT/consumers/" \
--form "username=$KONGA_CONSUMER_NAME" \
--form "custom_id=$KONGA_KONG_CONSUMER_ID"

RES=$(curl --location --request POST "http://localhost:$KONG_GW_ADMIN_HTTP_PORT/consumers/$KONGA_CONSUMER_NAME/key-auth")
API_KEY=$(echo $RES | grep -Eo '"key":.*?[^\\]",' | awk -F':' '{print $2}')

echo "Konga API Key: $API_KEY"
