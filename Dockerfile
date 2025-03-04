FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install --root-user-action=ignore --upgrade pip

RUN pip3 install --root-user-action=ignore streamlit

COPY start.sh .
RUN chmod a+x start.sh

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

CMD ["./start.sh"]
