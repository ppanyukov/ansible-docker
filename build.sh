#!/usr/bin/env bash

# Builds the docker images for ansible and other tools.
set -e 

ROOT_DIR=$(cd $(dirname ${BASH_SOURCE}) && pwd)
USER_ID=$(id -u)
USER_NAME=$(id -un)
GROUP_ID=$(id -g)


function build_ansible() {
	echo "Build ansible imgage"
	local image_name="ppanyukov/ansible-docker/ansible/${USER_NAME}"
	set +x
	docker build \
		--rm \
		--tag ${image_name} \
		--build-arg USER_NAME=${USER_NAME} \
		--build-arg USER_ID=${USER_ID} \
		--build-arg GROUP_ID=${GROUP_ID} \
		${ROOT_DIR}/docker/ansible
}


build_ansible