podman build --no-cache --rm --file Containerfile.gradle --tag spring:demo .
podman run --interactive --tty --publish 8887:8888 spring:demo
echo "browse http://localhost:8887/hello?name=Test"
