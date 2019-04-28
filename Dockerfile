ARG CUDA_VER="10.0"
ARG UBUNTU_VER="18.04"
FROM nvidia/cuda:${CUDA_VER}-cudnn7-runtime-ubuntu${UBUNTU_VER}
ARG PY_VER="3.7"

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y wget python${PY_VER} && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python${PY_VER} get-pip.py && \
    rm get-pip.py

RUN python${PY_VER} -m pip install \
    https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp37-cp37m-linux_x86_64.whl \
    torchvision
