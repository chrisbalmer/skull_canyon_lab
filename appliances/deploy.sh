#!/bin/bash

ovftool \
    --name=$1 \
    --diskMode=thin \
    --datastore=$ESXI_DS \
    --network=$ESXI_PG \
    --annotation=$ESXI_ANNOTATION \
    --noSSLVerify \
    ./$1.ova \
    vi://$ESXI_USER:$ESXI_PASS@$ESXI_HOST