# Docker Postgis database + Importer

This postgis docker container is based on the geofabrik/postgis docker container.


## Usage

**build container:**

docker build -t cammanderson/postgis .

**run cammanderson/postgis container and remove it immediately after it is beeing closed**

docker run --rm --name postgis -v /path/to/desired/import/data:/data/import cammanderson/postgis

or

**run cammanderson/postgis container**

docker run --name postgis -v /path/to/desired/import/data:/data/import cammanderson/postgis --expose 5432

* add "-e POSTGRES_PASSWORD=super_secret_password" to set a password
* docker stop postgis
* docker start postgis

docker rm postgis

e. g.:
docker run --rm --name postgis -e POSTGRES_PASSWORD=pass -v $HOME/Desktop/import:/data/import cammanderson/postgis

### Referencing in other 




## excerpt from 'docker run --help'
```
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
-e, --env=[]                    Set environment variables
-d, --detach                    Run container in background and print container ID
--rm                            Automatically remove the container when it exits
-v, --volume=[]                 Bind mount a volume
```
