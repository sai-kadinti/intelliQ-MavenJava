FROM ubuntu
RUN sudo -i
COPY /var/lib/jenkins/workspace/P1/webapp/target/webapp.war ./
CMD ["java","-jar","webapp.war"]
EXPOSE 7070
