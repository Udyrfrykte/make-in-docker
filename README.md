# make-in-docker

This project contains a set of bash scripts that help manage build dependencies in a contained manner. A typical case would be a C or C++ project that rely on the libraries provided by a linux distribution.

You can also find an sample use for these scripts in the `sample` repository.

## Usage

```
Usage: mid COMMAND

Make and run projects (typically system dependent ones, e.g. C/C++ ones) in Docker containers

Options:
  --help             print usage
  --directory <dir>  project directory (default: ./)
  --prefix <prefix>  prefix value (default: content of the 'mid-prefix' file in
                     the project directory or default if it doesn't exist)

Commands:
  build                build the make and run images
  export               export the make image include directories (for IDEs)
  make                 make the project in the make image
  run                  run the project in the run image

Run 'mid COMMAND --help' for more information on a command.
```

## Try it
```
$ cd sample
$ ../mid build
$ ../mid make
$ ../mid run
```
