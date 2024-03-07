# Stage 1: Generate SSL Certificates
FROM alpine:latest as ssl-certs

RUN apk add --no-cache openssl

RUN mkdir /certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /certs/nginx-selfsigned.key -out /certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"

# Stage 2: Setup Nginx
FROM nginx:alpine

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy SSL certificates from the first stage
COPY --from=ssl-certs /certs /etc/nginx/ssl

# Nginx configuration
ARG MY_DOCKER_HOST
ENV MY_DOCKER_HOST=${MY_DOCKER_HOST}
RUN echo 'server { \
    listen 443 ssl; \
    server_name localhost; \
    ssl_certificate /etc/nginx/ssl/nginx-selfsigned.crt; \
    ssl_certificate_key /etc/nginx/ssl/nginx-selfsigned.key; \
    location / { \
        proxy_pass http://'"${MY_DOCKER_HOST}"':3000; \
        proxy_set_header Host $host; \
        proxy_set_header X-Real-IP $remote_addr; \
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; \
        proxy_set_header X-Forwarded-Proto $scheme; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
