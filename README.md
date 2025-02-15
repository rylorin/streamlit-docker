# streamlit-docker

![License MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/rylorin/streamlit-docker.svg)

This repository contains a Docker container to run Streamlit applications from a GitHub repository.

## 📌 Prerequisites

Before getting started, make sure you have the following installed on your machine:

- [Docker](https://www.docker.com/get-started)

## 🚀 Installation & Usage

1. **Download the image**

   ```sh
   docker pull rylorin/streamlit-docker
   ```

2. **Run the container**

   ```sh
   docker run -p 8501:8501 rylorin/streamlit-docker
   ```

3. **Access the application**

   - Open a browser and go to [http://localhost:8501](http://localhost:8501)

## ⚙️ Customization

The `GIT_URL` variable specifies the Git repository URL containing the Streamlit application to be executed. By default, it is set to `https://github.com/streamlit/streamlit-example.git`.

You can change it by specifying another URL:

```sh
export GIT_URL="https://github.com/your-user/your-repository.git"
docker run -p 8501:8501 --env GIT_URL="${GIT_URL}" rylorin/streamlit-docker
```

Or you can and mount your own script or volume to run a local application:

```sh
docker run -p 8501:8501 -v $(pwd)/my_app:/app/streamlit_app/ streamlit-docker
```

## 🛠 Development & Debugging

- To view real-time logs:
  ```sh
  docker logs -f <container_id>
  ```
- To enter the container:
  ```sh
  docker exec -it <container_id> /bin/sh
  ```

## 📌 Deployment Example

### 🌍 Environment Variable `GIT_URL`

The `GIT_URL` variable specifies the Git repository URL containing the Streamlit application to be executed and can be set directly in `docker-compose.yml`:

```yaml
environment:
  GIT_URL: https://github.com/your-user/your-repository.git
```

Example `docker-compose.yml` configuration to deploy the application with Docker Compose:

```yaml
version: "3.8"
services:
  streamlit:
    image: rylorin/streamlit:latest
#    ports:
#    - 8501:8501/tcp
    environment:
      GIT_URL: ${GIT_URL:-https://github.com/streamlit/streamlit-example.git}
    networks:
      - default
      - system_dmz_network

networks:
  default:
  system_dmz_network:
    external: true
```

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## ✨ Contributions

Contributions are welcome! Please submit a *pull request* with your improvements.
