#!/usr/bin/env bash

BUILDMASTER=localhost
BOTPW=pass
BOTNAME=ve-worker
WORKDIR=workdir

chown -R worker:worker /opt/worker
chmod u+rwx -R /opt/worker

su - worker <<EOF
export ftp_proxy="ftp://${host_proxy}"
export http_proxy="http://${host_proxy}"
export https_proxy="http://${host_proxy}"

# Docker volume
cd /opt/worker

# Enter env & launch worker
. /opt/rh/gcc-toolset-10/enable

# Create buildbot
cd /opt/worker
buildbot-worker create-worker ${WORKDIR} ${BUILDMASTER} ${BOTNAME} ${BOTPW}

# Start buildbot and follow log
buildbot-worker start ${WORKDIR}
tail -f ${WORKDIR}/twistd.log &

sleep infinity
EOF
