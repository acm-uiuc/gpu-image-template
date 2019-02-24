# gpu-image-template
### Template dockerfile for custom docker enviorment on the gpu cluster

#### Build the image:
```
docker build -t username/image .
```

#### Test the dockerfile:
```
NV_GPU=[device_id] nvidia-docker run --rm -ti --ipc=host -p 8888:8888 -p 6006:6006 -v /vault:/vault --name test username/image
```
