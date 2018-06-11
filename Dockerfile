# cant build on docker cloud without exausing memory or ++-5: internal compiler error
# had to max out all docker resources to successfully build locally
FROM ubuntu:16.04

RUN apt-get update && apt-get -y install gcc g++ wget git make cpio && \
  wget -q -O - http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11544/l_mkl_2017.3.196.tgz | tar -xzf - && \
  cd l_mkl_2017.3.196 && \
  sed -i 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg && \
  ./install.sh -s silent.cfg && \
  cd / && \
  git clone https://github.com/Microsoft/EdgeML.git && \
  cd EdgeML && \
  make -Bj
ENV MKL_PATH=/opt/intel/mkl/lib/intel64_lin
ENV EDGEML_ROOT=/EdgeML
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MKL_PATH:$EDGEML_ROOT
