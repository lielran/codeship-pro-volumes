# We're using the official OpenJDK image from the Docker Hub (https://hub.docker.com/_/java/).
#FROM gradle:jdk-alpine as build-stage
FROM java:openjdk-8-alpine as build-stage


# All following commands will be run in this directory.
WORKDIR /app

COPY \
  ./gradle \
  build.gradle \
  gradlew \
  settings.gradle \
  ./



# Copying all gradle files necessary to install gradle with gradlew
COPY gradle gradle
COPY \
  ./gradle \
  build.gradle \
  gradlew \
  settings.gradle \
  ./

#Install gradle
RUN ./gradlew

#Run gradle assemble to install dependencies before adding the whole repository
RUN ./gradlew assemble



ADD . ./