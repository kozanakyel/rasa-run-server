FROM python:3.7.7-stretch AS BASE

RUN apt-get update \
    && apt-get --assume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

WORKDIR /app

# upgrade pip version
RUN pip install --no-cache-dir --upgrade pip

RUN pip install rasa

COPY . .

USER root
RUN chown -R 1001 /app
RUN ["pip", "install", "-r", "req_local.txt"]

RUN ["python3", "-m", "spacy", "download", "en_core_web_sm"]

USER 1001
RUN rm -rf models/*
RUN rasa train
CMD ["python", "app.py"]
