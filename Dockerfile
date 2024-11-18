FROM openjdk:23-jdk

ADD target/springboot-sample-0.0.1-SNAPSHOT.jar springboot-sample-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "springboot-sample-0.0.1-SNAPSHOT.jar"]