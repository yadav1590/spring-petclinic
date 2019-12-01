FROM maven:3.6.3-ibmjava-alpine
WORKDIR /app
COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /app/spring-petclinic.jar
CMD ["java", "-jar", "/app/spring-petclinic.jar"]
