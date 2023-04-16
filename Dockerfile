FROM amazoncorretto:11

RUN yum install -y tar which gzip # TODO remove

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
RUN yum install -y shadow-utils
RUN useradd  -ms /bin/bash karateuser
RUN CACHEBUST=1
WORKDIR /home/karateuser/KarateApitestdemo2
RUN chown karateuser /home/karateuser/KarateApitestdemo2
RUN CACHEBUST=1
USER karateuser
RUN CACHEBUST=1
COPY . /home/karateuser/KarateApitestdemo2
RUN CACHEBUST=1
RUN chmod -R 777 KarateApitestdemo2
RUN CACHEBUST=1
RUN mvn -v
RUN mvn clean test
EXPOSE 9001