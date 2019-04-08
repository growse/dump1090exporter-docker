FROM python:3.7.3-alpine3.9

LABEL MAINTAINER="Andrew Rowson <docker@growse.com>"

WORKDIR /root/
COPY requirements.txt /root/

RUN pip3 install -r /root/requirements.txt

EXPOSE 9105
ENTRYPOINT ["dump1090exporter"]
