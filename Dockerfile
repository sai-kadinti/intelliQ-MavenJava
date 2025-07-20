FROM ubuntu
RUN sudo -i
COPY  /root/webapp.war .
CMD ["java","-jar","webapp.war"]
EXPOSE 7070
