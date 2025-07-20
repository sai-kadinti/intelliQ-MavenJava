FROM tomcat:9.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY /var/lib/jenkins/workspace/P1/webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
