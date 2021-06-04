FROM alpine:latest

RUN apk --update add --no-cache openssh \
  && adduser -D -g '' USER \
  && echo "USER:PASS" | chpasswd \
  && rm -rf /var/cache/apk/*

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
