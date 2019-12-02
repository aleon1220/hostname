# Hostname Container Example Demo

1. Login to your registry (e.g. hub.docker.com by default)

```
docker login
username: xxxx
password: xxxx
```

2. Prepare Env Variables and build docker image 
```
export USER_GIT_NAME=""
export VERSION="vX"
# Use another Branch if required. Command below gets the latest commit ID.
export COMMIT_ID=$( git rev-parse origin/master )
```

- Build docker image

```
docker build \
     --build-arg VERSION=$VERSION \
     --build-arg COMMIT_ID=${COMMIT_ID} \
     --tag ${USER_GIT_NAME}/hostname:${VERSION} .
```

3. Push the image

`docker push -t {USER_GIT_NAME}/hostname:$VERSION`

4. Run the image:

`docker run --rm --name hostname -p 8080:80 -d $USER_GIT_NAME/hostname:$VERSION`

## Test that the image works:

`curl http://localhost:8080`

## Stop the running instance:

`docker stop hostname`

## Clean up the local build/run environment:

```
docker rmi $USER_GIT_NAME/hostname:v1
docker rmi nginx:latest
```
