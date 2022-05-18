# Docker Remote Desktop Environments

## How it works?

This repository contains docker containers that able to run IDE (or any other GUI software)

Running GUI inside docker container is not the case that docker was build for.
However, ease of configuration and community support makes it much more convenient than running and supporting
virtual machines.

## Setup

### Dependencies

First, you need to install the following components:

* `docker` - For installing Docker CE, follow the official [instructions](https://docs.docker.com/engine/install/) for
  your supported Linux distribution.
* `nvidia-docker2` This only required for `ml` configuration. Follow the
  official [instructions](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-on-ubuntu-and-debian)

## Tooling

Docker does not support the ability to include some configurations in others, therefore, for greater flexibility,
the configurations are divided into several small files that are assembled using a `build` script.

The way how configurations are assembled defined into configuration files located in [configs](./configs) folder.

There are few existing configurations:

### Existing configurations

- `basic` - Ubuntu based linux container with `xordp` and `vnc`

- `android` - Same as `basic` but also includes android sdk installed with emulator.
  Follow [instructions](./android/Readme.md) for more details.
- `ml` Ubuntu + nvidia based container with popular python packages for data science research

### How to run a container?

First, you need to build the docker image.
The simplest way is to run `build` script:

```bash
./build --config configs/basic --name dev
```

After success build, run container with `run` script. It will forward all required ports and let you connect via RDP:

```bash
./run --ip 127.0.0.1 --prefix 99 --image dev:latest -name my_container
```

Note that `--prefix` parameter is used to forward bunch of ports to the container. See [run](./run) script for more
details

### How to build a custom configuration?

Create file that describes how to combine configuration parts. You can either add just a few steps
like in [android](./configs/android) script or even start a container from different source like in [ml](./configs/ml).

### Intellij IDEA support

This container did not install any IDE. However Intellij IDEA IDE was tested
All existing containers contains [Jetbrains Toolbox](https://www.jetbrains.com/toolbox-app/) installation script that
could be executed from container with command:

```bash 
bash ~/scripts/download_jb_toolbox.sh
```

But if your client machine is Mac OS based you might face with problem that `CMD` key do not match with `Ctrl` key of
container's, so all IDE keymap is broken.

Check [this](https://github.com/satween/MacOsLinuxRDPBindings)
repository to fix keymap bindings
