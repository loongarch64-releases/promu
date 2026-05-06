FROM lcr.loongnix.cn/library/debian:unstable

RUN apt update && apt install -y git \
    golang \
    make \
    libseccomp-dev \
    wget

RUN wget https://cloud.loongnix.cn/releases/loongarch64/prometheus/promu/v0.14.0/promu-0.14.0.linux-loong64.tar.gz && \
    tar xf promu-0.14.0.linux-loong64.tar.gz && \
    cp promu-0.14.0.linux-loong64/promu /usr/bin/promu
    

ENV PROMU_VERSION=''

CMD ["sh", "-c","/workspace/process_version.sh $PROMU_VERSION"]
