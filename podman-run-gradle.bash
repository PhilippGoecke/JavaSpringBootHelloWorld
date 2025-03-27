podman build --no-cache --rm -f Containerfile.gradle -t spring:demo .
podman run --interactive --tty -p 8887:8888 spring:demo
echo "browse http://localhost:8887/hello?name=Test"
