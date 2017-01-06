#!/bin/bash -x

###################################################################################################

exec > >(sudo tee /bootstrap.log) 2>&1

###################################################################################################

interval=1
iterations=300

###################################################################################################

hash apt-get 2>/dev/null
if [ ${?} -eq 0 ]; then
  APT_BUSY_CODE=100
  DEBIAN_FRONTEND=noninteractive

  for i in `seq 1 ${iterations}`; do
    sudo apt-get update --quiet --quiet
    retval=${?}
    [ ${retval} -eq ${APT_BUSY_CODE} ] && sleep ${interval} && continue
    break
  done
  [ ${retval} -ne 0 ] && exit ${retval}

  for i in `seq 1 ${iterations}`; do
    sudo apt-get install --quiet --quiet --yes --no-install-recommends aptitude python-all python-setuptools python-simplejson
    retval=${?}
    [ ${retval} -eq ${APT_BUSY_CODE} ] && sleep ${interval} && continue
    break
  done
  [ ${retval} -ne 0 ] && exit ${retval}
fi

###################################################################################################

sudo rm -f /bootstrap.log

###################################################################################################

sudo touch /bootstrapped
exit ${?}

###################################################################################################
