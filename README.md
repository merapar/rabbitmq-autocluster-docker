# rabbitmq-autocluster-docker
This is the git repo for a Rabbitmq docker image, capable of being deployed in a high-available clustered manner.

It contains:
- Rabbit MQ 3.6 management base image
- A mechanism to cluster multiple Rabbit MQ Pods
- No Rabbit MQ Autocluster-plugin
- The Rabbit MQ Shovel plugin


It requires:
- To be deployed using StatefulSet (Kubernetes 1.5 or higher)
- Persistent storage for each Pod
