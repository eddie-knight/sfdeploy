FROM alpine 

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk add ansible gcc python3-dev make libc-dev libffi-dev openssh-client
RUN pip3 install --upgrade paramiko docker-compose
COPY . ansible/
RUN chmod -R 700 ansible/entrypoint.sh

ENTRYPOINT ["/ansible/entrypoint.sh"]
