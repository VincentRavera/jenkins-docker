# Jenkins-Docker


## Run the container

### Standalone

```shell
docker run --name jenkins -it -p 8088:8088 -p 50000:50000 -v /var/run/docker:/var/run/docker -v /var/run/docker.sock:/var/run/docker.sock vincentravera/jenkins-docker
```


### Swarm

```shell
docker stack deploy --compose-file docker-compose.yml jenkins-swarmed
```

### Docker-compose

```shell
docker-compose up
```
## There is an official repository, why should I use this image ?

I bought Raspberry pi's for swarm, but pi architectures is arm, and are most of the time incompatible with
"normal" images.
Here, I can build this image and commit the arm version for myself (at least).
Then I use the arm jenkins version on a pi to rebuild images I need, and commit them.

(FYI)
