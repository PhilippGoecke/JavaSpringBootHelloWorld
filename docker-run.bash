docker build --no-cache --rm -f Containerfile -t spring:demo .
# docker build --no-cache --rm -f Containerfile.maven -t spring:demo .
docker run --interactive --tty -p 8888:8888 spring:demo
echo "browse http://localhost:8888/hello?name=Test"
