FROM maven:sapmachine as build
ADD ./ /
RUN mvn clean install package

FROM sapmachine:17.0.8.1-jre-ubuntu-jammy as run
COPY --from=build target/app-0.0.1-SNAPSHOT.jar /app.jar
CMD java -jar app.jar
