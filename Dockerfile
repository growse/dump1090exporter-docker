FROM python:3.8.4-slim-buster

LABEL MAINTAINER="Andrew Rowson <docker@growse.com>"

WORKDIR /opt/
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install virtualenv
RUN python3 -m virtualenv $VIRTUAL_ENV
COPY requirements.txt .
RUN pip3 install -r requirements.txt

FROM python:3.8.4-slim-buster
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY --from=0 /opt/venv /opt/venv
EXPOSE 9105
ENTRYPOINT ["dump1090exporter"]
