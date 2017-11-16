# ansible-docker

A quick hack to run ansible and tools I need in a docker container.

Removes the need to install anything on the hosts, just need docker.

## Quick start

- clone this repo

```
git clone https://github.com/ppanyukov/ansible-docker
cd ansible-docker
```

- build image(s)

```
./build.sh
```

- add dockerized images to the path

```
export PATH=${PWD}/bin:${PATH}
```

- use tools

```
# ansible
ansible [whatever args]
az [whatever args]
```


## Image:

- baseed on Centos 7
- ansible
- azure CLI 2.0 (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

## To install:

- run `build.sh`

This will build the docker images.

The images are tagged like this:

- `ppanyukov/ansible-docker/az/$USERNAME`
- `ppanyukov/ansible-docker/ansible/$USERNAME`


## To run:

The stubs to `ansible` and `az` are in `bin` directory.

Run them like `bin/ansible`.

Add `bin` dir to `$PATH` to just run them as if they are installed globally.


## Note on volume mapping

The stub commands will map entire home directory `$HOME` as a read-write volume
into the running docker image.

So anything that `az` or `ansible` read/write from `$HOME` will be available and
persisted between runs.

