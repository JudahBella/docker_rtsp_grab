# docker_rtsp_grab
Docker image to grab a still image from an RTSP feed and serve it up as a snapshot

Forked from [dewgenenny/docker_rtsp_grab](https://github.com/dewgenenny/docker_rtsp_grab)

Modified `HEALTHCHECK` to test against localhost instead of a static IP that doesn't exist so that it will pass.

You need to call this image with the URL environment variable set to the URL of the camera you want it to connect to. Once
you've got it running, you'll be able to see the snapshot at http://your-server-ip:port/snapshot.jpg

Examples:

Using the image from DockerHub:

```
docker run --rm --name rtsp_grab -e URL=http://url-of-your-camera:554/live/ch0 -p 8844:80 judahbella/rtsp_grab
```

Building the docker image yourself:


```
sudo docker build -t rtsp_grab .
```

Then, run your newly built docker image:

```
docker run --rm --name rtsp_grab -e URL=http://url-of-your-camera:554/live/ch0 -p 8844:80 rtsp_grab  
```

I highly recommend double checking that your URL works using VLC or ffmpeg before moving to use image
