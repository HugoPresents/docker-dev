build:
	docker build -t rabbit52/ubuntu .

clean:
	docker rmi rabbit52/ubuntu
