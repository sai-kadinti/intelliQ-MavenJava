# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Remove default web apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR into Tomcat webapps directory
COPY webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose default Tomcat port
EXPOSE 8080

# CMD is inherited from base image (starts Tomcat)
