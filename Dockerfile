FROM            efocht/ve-base-dev:veos2.11.1
MAINTAINER      efocht

# Install llvm-lit (shim for lit.main)
ADD             llvm-lit /usr/bin/llvm-lit

# Install ninja v1.10.2
RUN             . /opt/rh/gcc-toolset-10/enable ; \
                mkdir build_ninja ; \
                cd build_ninja ; \
                wget -nc https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.zip ; \
                unzip v1.10.2.zip ; \
                cd ninja-1.10.2 ; \
                cmake .; \
                make ; \
                cp ninja /usr/bin/ninja ; \
                rm -rf build_ninja

# Install llvm-lit (shim for lit.main)
ADD             llvm-lit /usr/bin/llvm-lit
# RUN             cp /opt/buildbot-config/tools/llvm-lit /usr/bin/llvm-lit ; \
RUN             chmod +x /usr/bin/llvm-lit

# Install llvm-lit (llvm 13)
# RUN             . /opt/rh/gcc-toolset-10/enable ; \
#                 git clone http://github.com/llvm/llvm-project.git -b release/13.x /tmp/llvm-project ; \
#                 mkdir build_llvm ; \
#                 cd build_llvm ; \
#                 cmake -G Ninja \
#                        -DCMAKE_BUILD_TYPE=Release \
#                        -DLLVM_TARGETS_TO_BUILD=X86 \
#                        /tmp/llvm-project/llvm ; \
#                 ninja ; \
#                 cp bin/llvm-lit /usr/bin/llvm-lit ; \
#                 rm -rf /tmp/llvm-project build_llvm

# Install buildbot and rpm-build, create writable directory for rpm target builds
RUN             pip3.9 install buildbot[bundle] lit psutil; \
                yum -y install rpm-build ; \
                mkdir /usr/local/ve; chmod 1777 /usr/local/ve

# Install lnt
RUN             git clone https://github.com/sx-aurora-dev/llvm-lnt.git -b hpce/develop /tmp/lnt
RUN             . /opt/rh/gcc-toolset-10/enable ; \
                python3.9 /tmp/lnt/setup.py install

ADD             docker_run_worker.sh /opt/docker_run_worker.sh
# Switch to new 'worker' user
RUN             groupadd -r buildbot && useradd -m -g buildbot worker
USER            worker
ENTRYPOINT      ["/opt/docker_run_worker.sh"]
# CMD             ["/bin/bash"]
