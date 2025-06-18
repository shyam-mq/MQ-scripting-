#!/bin/bash

# Hardcoded queue manager name
QMGR="QMGR1"
QM_PATH="/var/mqm/qmgrs/QMGR1/qm.ini"

dspmq

echo "Stopping queue manager on this node..."
endmqm QMGR1

echo "Waiting for failover..."
sleep 10  # Adjust this delay if needed

echo "Updating qm.ini with new log parameters..."
sed -i 's/^[[:space:]]*LogPrimaryFiles=.*/LogPrimaryFiles=10/' "$QM_PATH"
sed -i 's/^[[:space:]]*LogSecondaryFiles=.*/LogSecondaryFiles=5/' "$QM_PATH"
sed -i 's/^[[:space:]]*LogFilePages=.*/LogFilePages=8192/' "$QM_PATH"

echo "Starting queue manager on this node..."
strmqm QMGR1

echo "Verifying queue manager status..."
dspmq -x

echo "Update completed on this node."

