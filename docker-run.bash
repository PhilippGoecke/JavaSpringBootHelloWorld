docker build --no-cache --rm -f Containerfile -t spring:demo .
docker run --interactive --tty -p 8080:8080 spring:demo
echo "browse http://localhost:8080/hello"
