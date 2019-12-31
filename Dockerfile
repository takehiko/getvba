FROM python:3.8-alpine
LABEL maintainer="Takehiko Murakawa <takehiko@wakayama-u.ac.jp>"

USER root
WORKDIR /root
RUN apk add --no-cache alpine-sdk libffi-dev openssl-dev \
    && wget http://iij.dl.osdn.jp/nkf/70406/nkf-2.1.5.tar.gz \
    && tar xvzf nkf-2.1.5.tar.gz \
    && cd nkf-2.1.5 \
    && make \
    && cp nkf /usr/bin \
    && cd && rm -Rf nkf-2.1.5.tar.gz nkf-2.1.5 \
    && pip install -U oletools \
    && apk del alpine-sdk libffi-dev openssl-dev

WORKDIR /usr/local/vba
ADD vba /usr/local/vba/

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/python3", "server.py"]
