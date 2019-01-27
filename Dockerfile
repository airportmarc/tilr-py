FROM python:3.7


RUN apt-get update -y

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app
RUN chmod +x boot.sh

ENV FLASK_APP app.py



ENTRYPOINT [ "python" ]

CMD [ "app.py" ]