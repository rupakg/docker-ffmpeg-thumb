FROM jrottenberg/ffmpeg
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

RUN apt-get update && \
    apt-get install python-dev python-pip -y && \
    apt-get clean

RUN  pip install awscli=='1.16.30'

WORKDIR /tmp/workdir

COPY copy_thumbs.sh /tmp/workdir
#windows
RUN sed -i 's/\r$//' copy_thumbs.sh  && chmod +x copy_thumbs.sh

ENTRYPOINT ffmpeg -i ${INPUT_VIDEO_FILE_URL} -ss ${POSITION_TIME_DURATION} -vframes 1 -vcodec png -an -y ${OUTPUT_THUMBS_FILE_NAME} && ./copy_thumbs.sh
