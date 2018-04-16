# All-In-One Docker Box for Deep Learning
## dl-box


### Build docker container
```
docker build -t deeplearning:cpu .
```

### Run docker container
```
docker run -d -v ${pwd}/data:/home/root/data -p 6006:6006 -p 8888:8888 -h dlbox --name dl-box deeplearning:cpu
```

### Start docker container
```
docker start dl-box
```

### Check running docker containers
```
docker ps
```

### Login to bash shell on docker container
```
docker exec -it dl-box /bin/bash
```

### Stop docker container
```
docker stop dl-box
```

### Remove docker container
```
docker rm dl-box
```

