# get the cuda 10.1 ubuntu docker image
FROM python:3.5-stretch@sha256:8d51bf14b7140f76cb606215799a8847bf167f4e3754695bf56f7f564ba041f4
FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV http_proxy=http://debian.map.fastlydns.net:80
ENV https_proxy=https://security.debian.org:80

# set the working directory and copy everything to the docker file
WORKDIR ./confidences
COPY ./requirements.txt ./

#RUN rm /etc/apt/sources.list.d/cuda.list
RUN apt-get update && apt-get -y upgrade && apt-get -y install git nano build-essential cmake libboost-all-dev libgtk-3-dev software-properties-common git-lfs
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html
