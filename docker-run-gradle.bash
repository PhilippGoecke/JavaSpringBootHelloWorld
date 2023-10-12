docker build --no-cache --rm -f Containerfile.gradle -t spring:demo .
docker run --interactive --tty -p 8888:8888 spring:demo
echo "browse http://localhost:8888/hello?name=Test"
