FROM python:3.8.2-alpine3.11

LABEL MAINTAINER="Andrew Rowson <docker@growse.com>"

WORKDIR /root/
COPY requirements.txt /root/

RUN pip3 install -r /root/requirements.txt

EXPOSE 9105
ENTRYPOINT ["dump1090exporter"]
