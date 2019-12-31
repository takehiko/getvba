FROM python:3.8
LABEL maintainer="Takehiko Murakawa <takehiko@wakayama-u.ac.jp>"

RUN apt-get update && apt-get install -y --no-install-recommends \
	nkf \
        && rm -rf /var/lib/apt/lists/*
RUN pip install -U oletools

USER root
ADD vba /usr/local/vba/
WORKDIR /usr/local/vba

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/python3", "server.py"]
