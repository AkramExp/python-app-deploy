FROM python:3.9-slim-buster

WORKDIR /app

COPY ./app .

RUN pip3 install --no-cache-dir -r requirments.txt

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD [ "python", "main.py" ]