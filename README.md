# Get started

Simple container to execute Bash scripts from URL (e.g. hosted on GitHub) in a [Ubuntu Docker image](https://hub.docker.com/_/ubuntu).. Mainly used to download datasets for the [Data2Services](http://d2s.semanticscience.org/) project.

# Build or pull

```shell
docker pull vemonet/d2s-bash-exec
docker build -t vemonet/d2s-bash-exec .
```

# Run

This command will download files in `/data/data2services`.

```shell
docker run -it --rm -v /data/data2services:/data vemonet/d2s-bash-exec https://raw.githubusercontent.com/MaastrichtU-IDS/data2services-download/master/datasets/stitch-sample/download.sh
```

You can provide an output directory as second parameter

```bash
docker run -it --rm -v /data/data2services:/tmp/download vemonet/d2s-bash-exec https://raw.githubusercontent.com/MaastrichtU-IDS/data2services-download/master/datasets/stitch-sample/download.sh /tmp/download
```



# Add a new dataset

Shell scripts are executed to download each dataset. Add your own.

* Copy and rename the TEMPLATE directory, then change the `download.sh` accordingly, you will find a lot of simple operations to download files already covered.
* Use the name of the directory to pass it as a dataset to download.
* Use `$USERNAME` and `$PASSWORD` variables if you need one.

See the [Wiki](https://github.com/MaastrichtU-IDS/data2services-download/wiki) for more details on common Shell download operations.



