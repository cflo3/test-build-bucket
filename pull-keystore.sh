#!/usr/bin/env bash
set -ex

TOP_DIR=$PWD
BUCKET=lo3energy-build
KEYSTORE_FILE=release.keystore
export MAPP_RELEASE_KEYSTORE=${TOP_DIR}/${KEYSTORE_FILE}
KEYSTORE=s3://${BUCKET}/${KEYSTORE_FILE}

# copy file
aws s3 cp --region us-west-2 ${KEYSTORE} ${MAPP_RELEASE_KEYSTORE}