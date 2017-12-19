FROM jrottenberg/ffmpeg
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

WORKDIR /tmp/workdir

ENTRYPOINT ffmpeg -ss ${POSITION_TIME_DURATION} -i ${INPUT_VIDEO_FILE_URL} -vframes 1 -vcodec png -an -y ${OUTPUT_VIDEO_FILE_NAME}
