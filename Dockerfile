#FROM ________________ (supply base image)

#MAINTAINER _____________

RUN apt-get update
RUN apt-get install -y python3-pip

RUN pip3 --no-cache-dir install \
    ipykernel \
    jupyter \
    bash_kernel

RUN python3 -m bash_kernel.install && \
    python3 -m ipykernel.kernelspec

#RUN _________________ (add your own installations)

#tensorboard default port
EXPOSE 6006
#jupyter default port
EXPOSE 8888

RUN mkdir /opt/cluster-container
RUN cd /opt/cluster-container

COPY start-jupyter.sh /opt/cluster-container
COPY jupyter_get.py /opt/cluster-container
COPY jupyter_notebook_config.py /root/.jupyter/
RUN chmod +x /opt/cluster-container/start-jupyter.sh

WORKDIR "/vault"

CMD ["/opt/cluster-container/start-jupyter.sh",  "--allow-root"]
