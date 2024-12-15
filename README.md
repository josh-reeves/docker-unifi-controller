## Docker UniFi Controller

Unifi Controller built on Ubuntu Jammy image with logging to standard output.

Upon built, the image will pull in the debian UniFi Network Application (UniFi Controller) software along with its dependencies and any additional dependencies required for the install process. This includes the following:
- All depdencies required by the unifi apt package, including MongoDB, and the package itself.
- wget
- curl
- gnupg

<br>

When run, the resulting container will automatically start the unifi service and begin tailing the contents of /usr/lib/unifi/logs/server.log to the standard output.

Use docker to run the image in detached mode. At a minimum, the following ports should be published in order to ensure basic functionality (e.g. device adoption and management, etc.):
- 8443 TCP
- 8080 TCP
- 10001 UDP
- 1900 UDP
- 123 UDP

<br>  

Example:  
*docker run -d -p 8443:8443 -p 8080:8080 -p 10001:10001 -p 1900:1900 -p 123:123 joshreeves/docker-unifi-controller*

Alternatively, the controller will also work if you provide the container with direct access to the host network:  
*docker run -d --network host joshreeves/docker-unifi-controller*

For a full list of available services and the associated ports that need to be published, reference Ubiquiti's official documentation:  
https://help.ui.com/hc/en-us/articles/218506997-Required-Ports-Reference

Note that port 22, for SSH, is not currently exposed. It can still be manually published, of course, just be aware of any potential conflicts.

Similarly, the container does not currently specify any volume mounts to persist the controller data. Instead, that functionality is delegated to the user at runtime.

There are no currently plans to change this behavior. Both options can be easily overidden via Docker, and both are, in my opinion, sufficiently system specific to warrant leaving their implementation, or lack thereof, to the end-user.

