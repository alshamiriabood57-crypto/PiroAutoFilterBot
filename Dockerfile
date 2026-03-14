FROM python:3.10-slim-buster

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip3 install -U pip && pip3 install -r requirements.txt

COPY . .

CMD ["python3", "bot.py"]
