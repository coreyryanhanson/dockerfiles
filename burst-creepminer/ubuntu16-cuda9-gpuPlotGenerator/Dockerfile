FROM coreyhanson/burst-creepminer:cuda9-src as compile
LABEL maintainer "Corey Ryan Hanson"

#Builds creepMiner.
RUN cd creepMiner && \
    cmake CMakeLists.txt && \
    make

#Builds gpuPlotGenerator.
RUN cd gpuPlotGenerator && \
cmake CMakeLists.txt && \
make

#Begins stage 2 of image.
FROM nvidia/cuda:9.0-runtime-ubuntu16.04

#Installs OpenCL support
RUN apt-get update && apt-get install -y --no-install-recommends \
        ocl-icd-libopencl1 \
        clinfo && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

#Downloads missing dependencies.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        sudo \
        openssl && \
    rm -rf /var/lib/apt/lists/*

#Creates unprivileged user.
ARG docker_root_pass=edmund
ARG docker_unprivileged_user=creepminer
ARG docker_unprivileged_pass=booboo
COPY /create-user.sh /
RUN chmod +x create-user.sh
RUN /create-user.sh && \
    rm /create-user.sh

#Copies components.
COPY --from=compile /creepMiner/poco-1.7.8p3-all/lib/Linux/x86_64/* /usr/local/lib/
COPY --from=compile /creepMiner/bin home/$docker_unprivileged_user/creepMiner
COPY --from=compile /gpuPlotGenerator /home/$docker_unprivileged_user/gpuPlotGenerator
RUN chown -R $docker_unprivileged_user /home

USER $docker_unprivileged_user
WORKDIR /home/$docker_unprivileged_user
