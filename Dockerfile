FROM eclipse-temurin:11-jdk-alpine

RUN apk add --no-cache bash procps curl tar

# common for all images
ENV MAVEN_HOME /usr/share/maven

COPY --from=maven:3.9.1-eclipse-temurin-11 ${MAVEN_HOME} ${MAVEN_HOME}
COPY --from=maven:3.9.1-eclipse-temurin-11 /usr/local/bin/mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY --from=maven:3.9.1-eclipse-temurin-11 /usr/share/maven/ref/settings-docker.xml /usr/share/maven/ref/settings-docker.xml

RUN ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

ARG MAVEN_VERSION=3.9.1
ARG USER_HOME_DIR="/root"
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]


RUN apk update
RUN apk upgrade
RUN adduser -hs /bin/bash karateapiuser
WORKDIR /home/karateapiuser/KarateApitestdemo2
RUN chown karateapiuser /home/karateapiuser/KarateApitestdemo2
USER karateuser
COPY . /home/karateapiuser/KarateApitestdemo2
RUN mvn -v
RUN mvn clean test
EXPOSE 9001
