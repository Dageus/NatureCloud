FROM amazoncorretto:11-al2023
COPY target/webserver-fat.jar /app/webserver.jar
COPY agents/javassist-profiler.jar /app/profiler.jar

EXPOSE 8000
ENTRYPOINT ["java", "-javaagent:/app/profiler.jar", "-jar", "/app/webserver.jar"]
