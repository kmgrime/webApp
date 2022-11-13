# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8501

RUN mkdir /src
RUN mkdir /src/images
WORKDIR /src
ADD /src/requirements.txt /src/
ADD ./src/main.py /src/
ADD ./images/code.jpg /src/images/


RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]