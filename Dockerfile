FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

RUN apt-get update && apt-get install -y \
		build-essential \
		cmake \
		curl \
		git
RUN apt-get update && apt-get install -y \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		libjpeg-dev \
		liblcms2-dev \
		libopenblas-dev \
		liblapack-dev \
		libopenjpeg5 \
		libpng12-dev

RUN apt-get update && apt-get install -y \
		pkg-config \
		python-dev \
		software-properties-common \
		unzip \
		vim \
		wget \
		zlib1g-dev \
		libjpeg-dev
RUN apt-get update && apt-get install -y \
		libpng-dev \
		libtiff5-dev \
		libjasper-dev \
		libopenexr-dev \
		libgdal-dev \
		libdc1394-22-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev
RUN apt-get update && apt-get install -y \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		libx264-dev \
		yasm \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libv4l-dev \
		libxine2-dev \
		libtbb-dev \
		libeigen3-dev
RUN apt-get update && apt-get install -y \
		python3-requests\
		default-jdk &&\
     rm -rf /var/lib/apt/lists/*

# Install pip
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install --upgrade pip

# Install useful Python packages using apt-get to avoid version incompatibilities with Tensorflow binary
# especially numpy, scipy, skimage and sklearn (see https://github.com/tensorflow/tensorflow/issues/2034)
RUN apt-get update && apt-get install -y \
		python3-skimage \
		python3-scipy \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*


# Install pytorch
RUN pip3 install http://download.pytorch.org/whl/cu90/torch-0.3.1-cp35-cp35m-linux_x86_64.whl
RUN pip3 install torchvision


RUN pip3 install opencv-python


# Install Flask
RUN pip3 install Flask

# Install pydrive
RUN pip install --upgrade google-api-python-client
