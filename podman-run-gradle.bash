podman build --no-cache --rm --file Containerfile.gradle --tag spring:gradle_demo .
podman run --interactive --tty --publish 8887:8888 spring:gradle_demo
echo "browse http://localhost:8887/hello?name=Test"
