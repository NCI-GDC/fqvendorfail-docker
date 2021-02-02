# bio-software-template

Template repository for building Dockerized versions of external software tools.

## Using this template

An example of real-world use of this template can be found at [samtools-docker](https://github.com/NCI-GDC/samtools-docker)

This template is set up to easily publish mutiple tags of a Docker image, where each tag corresponds to the version of the software installed.

The parameterizable `Dockerfile.multi` makes it simple to use one Dockerfile to install multiple versions from Github, for example.

This Dockerfile takes a `VERSION` build argument, set by the Makefile in each subdirectory.

This VERSION argument is used to build the `URL` variable and reference subsequent files and directories.

Some experimentation might be necessaray to create generic build steps.

## Using Bespoke Dockerfiles

For some software, a parameterizable Dockerfile is insufficient (samtools version 1.1, for example).

If this the case, add the Dockerfile to the version subdirectory and update the Makefile to point the build command to the correct Dockerfile.
