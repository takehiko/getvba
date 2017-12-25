FROM python:3.5

RUN apt-get update && apt-get install -y --no-install-recommends \
	nkf \
        && rm -rf /var/lib/apt/lists/*
RUN pip3 install -U oletools

USER root
ADD vba /usr/local/vba/
WORKDIR /usr/local/vba

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/python3", "server.py"]
