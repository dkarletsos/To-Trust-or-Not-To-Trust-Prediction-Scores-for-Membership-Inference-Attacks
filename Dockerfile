# get the cuda 10.1 ubuntu docker image
FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel
FROM python:3.6.15-slim-buster@sha256:5dd134d6d97c67dd02e4642ab24ecbb9d23059ea018a8b5185784d29dce2f37a

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# set the working directory and copy everything to the docker file
WORKDIR ./confidences
COPY ./requirements.txt ./

RUN apt-get update && apt-get install -y gnupg
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update && apt-get -y upgrade && apt-get -y install git nano build-essential cmake libboost-all-dev libgtk-3-dev git-lfs
RUN pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html
