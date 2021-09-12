# Karate docker image

If you make any changes in karate folder, please push those changes to the navyasolutions dockerhub repo.

## Steps:

### Build local image

```shell
   docker build -t navyasolutions/karate .
```

### Create tag from local image

```shell
   docker tag navyasolutions/karate:latest navyasolutions/karate:<IMAGE_VERSION>
```

### Push images to dockerhub

```shell
   docker push navyasolutions/karate:<IMAGE_VERSION>
   docker push navyasolutions/karate:latest
```
