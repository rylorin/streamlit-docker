# streamlit-docker
  <div style="display: flex;justify-content:center;">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg"/> 
    <img src="https://img.shields.io/docker/pulls/rylorin/streamlit-docker.svg"></img>
  </div>

This repository contains a Docker container to run Streamlit applications from a GitHub repository.

## 📌 Prerequisites

Before getting started, make sure you have the following installed on your machine:

- [Docker](https://www.docker.com/get-started)

## 🚀 Installation & Usage

1. **Run the container**

   ```sh
   docker run -p 8501:8501 rylorin/streamlit-docker
   ```

2. **Access the application**

   - Open a browser and go to [http://localhost:8501](http://localhost:8501)

## ⚙️ Customization

If you want to run a different Streamlit application, modify the `app.py` file or mount your own script as a volume:

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

The `GIT_URL` variable specifies the Git repository URL containing the Streamlit application to be executed. By default, it is set to `https://github.com/streamlit/streamlit-example.git`.

You can change it during deployment by specifying another URL:

```sh
export GIT_URL=https://github.com/your-user/your-repository.git
docker run --env GIT_URL=${GIT_URL} -p 8501:8501 streamlit-docker
```

Or if your application is on the local machine ($(pwd)/my_app)

```sh
docker run -p 8501:8501 -v $(pwd)/my_app:/app/streamlit_app/ streamlit-docker
```

Or directly in `docker-compose.yml`:

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
