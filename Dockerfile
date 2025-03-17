# Use a Tomcat image with Java 17
FROM tomcat:11-jdk17

USER root

# Set Tomcat environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

# Ensure Tomcat has the right permissions
RUN chmod +x /usr/local/tomcat/bin/*.sh

# Copy the WAR file into the Tomcat webapps directory
COPY webMethods.war /usr/local/tomcat/webapps/

# Expose port 8080 for web access
EXPOSE 8080

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
