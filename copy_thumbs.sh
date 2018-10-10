#!/bin/bash

echo "Copying ${OUTPUT_THUMBS_FILE_NAME} to S3 at ${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} ..."
aws s3 cp ./${OUTPUT_THUMBS_FILE_NAME} s3://${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} --region ${AWS_REGION} --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
