podman build --no-cache --rm --file Containerfile.maven --tag spring:maven_demo .
podman run --interactive --tty --publish 8889:8888 spring:maven_demo
echo "browse http://localhost:8889/hello?name=Test"
