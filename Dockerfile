#FROM ubuntu:latest 
FROM python:3.8
LABEL description="geopandas"

COPY requirements.txt /root
WORKDIR /root

RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*
RUN sudo apt update -y 
#RUN apt install -y python3-pip
RUN DEBIAN_FRONTEND="noninteractive" apt install libspatialindex-dev -y
RUN pip3 install -r requirements.txt

EXPOSE 8888/tcp
ENV SHELL /bin/bash
ENTRYPOINT ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
