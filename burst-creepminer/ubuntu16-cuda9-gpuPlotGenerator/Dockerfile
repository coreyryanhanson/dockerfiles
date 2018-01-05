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
