FROM debian:bullseye-slim as build-env

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
  # install tools
  && apt install -y --no-install-recommends unzip curl \
  # install spring dependencies
  && apt install -y --no-install-recommends openjdk-17-jdk gradle \
  # make image smaller
  && rm -rf "/var/lib/apt/lists/*" \
  && rm -rf /var/cache/apt/archives

RUN adduser user
USER user
WORKDIR /home/user

# https://github.com/spring-io/initializr
RUN curl "https://start.spring.io/starter.zip?type=gradle-project&language=java&bootVersion=3.0.6&baseDir=demo&groupId=com.example&artifactId=demo&name=demo&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.demo&packaging=jar&javaVersion=17&dependencies=web" --output springdemo.zip \
  && unzip springdemo.zip

WORKDIR /home/user/demo

COPY DemoApplication.java ./src/main/java/com/example/demo/DemoApplication.java

EXPOSE 8888

CMD [ "./gradlew", "bootRun", "--args='--server.port=8888'" ]

HEALTHCHECK CMD curl -f "http://localhost:8888/hello?name=health&" || exit 1
