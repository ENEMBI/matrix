#!/bin/bash
USERS=$(cat users.json | jq ".")
WORKERS=2
echo "Users Array - $USERS"
result=$(echo "$USERS" | jq -c --arg workers "$WORKERS" '[.[]] | group_by( (. as $item | .[0:$workers] | [ $item ]))')
echo "$result"
