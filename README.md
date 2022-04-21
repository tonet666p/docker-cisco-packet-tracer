# Packet Tracer 8.1
Packet Tracer is a cross-platform visual simulation program designed by Cisco Systems that allows users to create network topologies and imitate modern computer networks. The software allows users to simulate the configuration of Cisco routers and switches using a simulated command line interface. Packet Tracer makes use of a drag and drop user interface, allowing users to add and remove simulated network devices as they see fit. The software is mainly focused towards Certified Cisco Network Associate Academy students as an educational tool for helping them learn fundamental CCNA concepts. 

# Description
This is an unofficial containerized image for run on every GNU/Linux distribution, this dockerfile was done and tested by me on Fedora 35 Workstation using Podman.

# Requirements
- Docker or Podman (just replace the command)

# How to use
For build and run this Dockerfile:

```
podman build . -t packettracer:latest

podman run -it --rm -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  -v $HOME/packettracer/:/root/pt \
  localhost/packettracer:latest
```

For run this container directly from Dockerhub (if I can upload it :D ):
```
podman run -it --rm -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  -v $HOME/packettracer/:/root/pt \
  tonet666p/packet-tracer
```
