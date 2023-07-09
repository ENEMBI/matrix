#!/bin/bash
USERS_ARRAY=$(cat users.json)
WORKERS_AMOUNT=2
USERS_AMOUNT=2
echo "Users Array - $USERS_ARRAY"
USERS_OBJECTS=$(echo "$USERS_ARRAY" | jq -c --arg users "$USERS" "[:\$users]")
echo "$USERS_OBJECTS"
# result=$(echo "$USERS_ARRAY" | jq -c --arg workers "$WORKERS" --arg users "$USERS" --argjson total "$(($USERS*$WORKERS))" '[.[0:$total] | group_by( . as $item | (range(0; length; ($total/$workers|floor)) | .[] | . as $i | $item[$i:$i+$workers]))]')
# echo "$result"
