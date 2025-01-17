# docker_rtsp_grab
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/JudahBella/docker_rtsp_grab/docker-image.yml?logo=github)](https://github.com/JudahBella/docker_rtsp_grab/actions/workflows/docker-image.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/judahbella/rtsp_grab?logo=docker&label=pulls)](https://hub.docker.com/r/judahbella/rtsp_grab)

Docker image to grab a still image from an RTSP feed and serve it up as a snapshot

Forked from [dewgenenny/docker_rtsp_grab](https://github.com/dewgenenny/docker_rtsp_grab)

This image comes in handy if your camera does not expose a URL for snapshots (or at least, the URL is unknown).

I have modified `HEALTHCHECK` to test against localhost instead of a static IP that doesn't exist so that it will pass.

You need to call this image with the `URL` environment variable set to the URL of the camera you want it to connect to, and `FPS` set to FPS you would want the snapshots to be updated. I have found `1/10` (once every 10 seconds) to work well.

Once you've got it running, you'll be able to see the snapshot at http://your-server-ip:port/snapshot.jpg

Examples:

Using the image from DockerHub:

```
docker run --rm --name rtsp_grab -e URL=http://url-of-your-camera:554/live/ch0 -e FPS=1/10 -p 8844:80 judahbella/rtsp_grab
```

Building the docker image yourself:

```
sudo docker build -t rtsp_grab .
```

Then, run your newly built docker image:

```
docker run --rm --name rtsp_grab -e URL=http://url-of-your-camera:554/live/ch0 -e FPS=1/10 -p 8844:80 rtsp_grab  
```

I highly recommend double checking that your URL works using VLC or ffmpeg before moving to use image
