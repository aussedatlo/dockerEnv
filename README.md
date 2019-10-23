### Installation

```
docker build . --network host -t dev/env:1.0
```

### Usage

```
FOLDER=<path_to_folder>

docker run -dti --name dev_env \
    -v $FOLDER:/home/developer/ \
    --env no_proxy=$no_proxy\
    --network host \
    dev/env:1.0 /bin/bash
```

now you can use the docker using

```
docker exec -it dev_env /bin/zsh
```
