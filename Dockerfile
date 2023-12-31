FROM python:3

ARG APP_DIR=/usr/src/hello_world_printer

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p $APP_DIR
ADD hello_world/ $APP_DIR/hello_world/
ADD main.py $APP_DIR

WORKDIR $APP_DIR
CMD FLASK_APP=hello_world flask run --host=0.0.0.0

docker_build:
	docker build -t hello-world-printer .

 docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer
