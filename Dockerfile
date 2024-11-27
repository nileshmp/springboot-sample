FROM amazoncorretto:17.0.7-alpine

ARG JAR_FILE=target/springboot-sample-0.0.1-SNAPSHOT.jar

WORKDIR /opt/app

COPY ${JAR_FILE} springboot-web.jar

ENTRYPOINT ["java", "-jar", "springboot-web.jar"]