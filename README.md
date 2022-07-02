# medium-vue-docker

Post medium Vue3 + Nginx + Docker + Docker-Compose

## Run with docker

```bash
# Crear imagen con docker
docker build -t app .

# Crear un contenedor a partir de una imagen con docker en el puerto X
docker run -dp 80:80 app
```

## Run with docker-compose

```bash
# Crear imagen con docker
docker-compose up -d --build
```
