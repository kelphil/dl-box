# All-In-One Docker Box for Deep Learning


  * Jupyter notebook with multi-kernel support
    - Python3
    - Python2
    
  * Many popular python, machine learning libraries pre-installed: 
  
    * Data Structures
      - Numpy
      - Pandas
    
    * Data Visualization
      - Matplotlib
      - Seaborn
      - Bokeh
      - Plotly
      - Cufflinks
    
    * Machine Learning
      - Scikit Learn
      - Keras
      - Tensorflow
    
    * Hyperparameter Visualization/Optimization
      - comet_ml
   

### Build docker image
```
docker build -t deeplearning:cpu .
```

### Spin up a docker container
```
docker run -d -v ${pwd}/data:/home/root/data -p 6006:6006 -p 8888:8888 -h dlbox --name dl-box deeplearning:cpu
```
  * Mount local data volume for file sharing using ```-v``` option
    - **${pwd}/data:** Shared directory within host OS (Windows)
    - **/home/root/data:** Shared directory within docker container
  * Hostname
    - Hostname for the docker container defined as *dlbox* via ```-h dlbox``` option
  * Image name
    - Docker image name for the docker container defined as *dl-box* via ```-name dl-box``` option

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

### Open Jupyter Notebook in a web browser

[http://127.0.0.1:8888](http://127.0.0.1:8888)

```
Jupyter Notebook Password = 'root'
```

### Open TensorBoard in a web browser

[http://127.0.0.1:6006](http://127.0.0.1:6006)

