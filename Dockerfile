# actual container
FROM adoptopenjdk/openjdk11:alpine-jre
ENV ARTIFACT_NAME=tracker-server.jar
ENV APP_HOME=/usr/app/
    
WORKDIR $APP_HOME
COPY traccar.xml target/$ARTIFACT_NAME .
COPY schema ./schema
COPY templates ./templates
COPY target/lib ./lib
COPY default.xml ./default.xml

EXPOSE 8082
EXPOSE 5027
EXPOSE 5046
ENTRYPOINT ["java", "-jar", "tracker-server.jar", "traccar.xml"]
