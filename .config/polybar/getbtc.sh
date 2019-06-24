#!/bin/sh

curl "https://api.coindesk.com/v1/bpi/currentprice/USD" 2>/dev/null | jq '.bpi.USD.rate' | tr -d '"'
