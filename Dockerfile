FROM osrf/ros:humble-desktop

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Paquetes fundamentales
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake git wget curl pkg-config python3-pip && \
    rm -rf /var/lib/apt/lists/*

# GUI y video
RUN apt-get update && apt-get install -y --no-install-recommends \
    libusb-1.0-0-dev libgl1-mesa-glx libgl1-mesa-dev libglu1-mesa-dev libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev v4l-utils && \
    rm -rf /var/lib/apt/lists/*

# Codecs e imagen
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev libopenexr-dev && \
    rm -rf /var/lib/apt/lists/*

# Librerías de rendimiento
RUN apt-get update && apt-get install -y --no-install-recommends \
    libtbb-dev libeigen3-dev libatlas-base-dev && \
    rm -rf /var/lib/apt/lists/*

# GRUPO CONFLICTIVO — puedes comentar esta línea si vuelve a fallar
RUN apt-get update && apt-get install -y --no-install-recommends \
    libglew-dev libglfw3-dev libgtk2.0-dev && \
    rm -rf /var/lib/apt/lists/*

# Protocol Buffers y herramientas ROS
RUN apt-get update && apt-get install -y --no-install-recommends \
    libprotobuf-dev protobuf-compiler libprotoc-dev \
    python3-colcon-common-extensions python3-rosdep && \
    rm -rf /var/lib/apt/lists/*

# Workspace
RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws

CMD ["bash"]
