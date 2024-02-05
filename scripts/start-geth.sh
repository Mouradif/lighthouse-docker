#!/bin/sh
#
# Starts a local fast-synced geth node.

geth --syncmode snap --http --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net,debug,txpool" --datadir.ancient=/root/ancient-data --authrpc.addr "0.0.0.0" --authrpc.port "8551" --authrpc.vhosts "*" --authrpc.jwtsecret "/root/jwttoken/jwtsecret.hex" --ws --ws.addr "0.0.0.0" --ws.api "eth,net,debug,txpool" --ws.origins "*"
