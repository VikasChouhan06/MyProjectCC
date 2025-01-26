# Use the latest official Tomcat 8 image with JDK 8
FROM tomcat:8-jdk8

# Remove default web applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat’s webapps directory
COPY ./STQA_Project/dist/STQA_Project.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat's default port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
