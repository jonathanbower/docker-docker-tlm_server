FROM phusion/baseimage:0.11
CMD ["/sbin/my_init"]
COPY root/ /
RUN /root/tlm_install.sh
VOLUME /usr/local/tweak/etc
EXPOSE 5436
