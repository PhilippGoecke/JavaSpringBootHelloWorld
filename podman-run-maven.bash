podman build --no-cache --rm -f Containerfile.maven -t spring:demo .
podman run --interactive --tty -p 8889:8888 spring:demo
echo "browse http://localhost:8889/hello?name=Test"
