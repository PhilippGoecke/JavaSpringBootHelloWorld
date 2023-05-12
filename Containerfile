FROM debian:bullseye-slim as build-env

RUN apt update && apt upgrade -y \
  # install tools
  && apt install -y --no-install-recommends wget unzip \
  # install spring dependencies
  && apt install -y --no-install-recommends openjdk-17-jdk gradle \
  # add custom dependencies
  #&& apt install -y --no-install-recommends netcat vim-tiny \
  # make image smaller
  && rm -rf "/var/lib/apt/lists/*" \
  && rm -rf /var/cache/apt/archives

# https://github.com/spring-io/initializr
RUN wget "https://start.spring.io/starter.zip?type=gradle-project&language=java&bootVersion=3.0.6&baseDir=demo&groupId=com.example&artifactId=demo&name=demo&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.demo&packaging=jar&javaVersion=17&dependencies=web" --output-document=springdemo.zip \
  && unzip springdemo.zip -d /srv \
  && ls -lisah /srv

WORKDIR /srv/demo

COPY DemoApplication.java ./src/main/java/com/example/demo/DemoApplication.java

RUN pwd \
  && ls -lisah

EXPOSE 8080

#ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "./gradlew", "bootRun" ]
