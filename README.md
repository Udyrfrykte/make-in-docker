# make-in-docker

This project contains a set of bash scripts that help manage build dependencies in a contained manner. A typical case would be a C or C++ project that rely on the libraries provided by a linux distribution.

You can also find an example use for these scripts.

## Usage

4 scripts help manage builds in these dockerized environments:
- `build-docker-image.sh`
- `docker-export.sh`
- `docker-make.sh`
- `docker-run.sh`


### `build-docker-image.sh`

```
./build-docker-image.sh --help               
Usage: ./build-docker-image.sh options
Options:
    --help             This page
    --directory <dir>  project directory
```

The `build-docker-image.sh` script builds the two dockerized environments (make and run). It expects to build the images from the `docker-make` and `docker-run` directories. The "docker" prefix can be changed by placing a `prefix-docker-image` file containing the prefix to use.


### `docker-export.sh`

```
./docker-export.sh --help               
Usage: ./docker-export.sh options
Options:
    --help             This page
    --directory <dir>  project directory
```

The `docker-export.sh` script exports the rootfs of the make image to the `<prefix>-make-root` directory, with only the `/usr/include` and `/usr/local/include`.


### `docker-make.sh`

```
./docker-make.sh --help               
Usage: ./docker-make.sh options [COMMAND]
COMMAND: the command to run in the make container (default: make)
Options:
    --help             This page
    --directory <dir>  project directory
```

The `docker-make.sh` run the make image.


### `docker-run.sh`

```
./docker-run.sh --help               
Usage: ./docker-run.sh options [COMMAND]
COMMAND: the command to run in the run container (defaults to the image default)
Options:
    --help             This page
    --directory <dir>  project directory
```

The `docker-run.sh` run the run image.


## Try it
```
$ ./build-docker-image.sh
$ ./docker-make.sh --directory sample
$ ./docker-run.sh --directory sample
```
