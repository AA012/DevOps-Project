# Use official nginx base image
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/* \
    rm -rf /etc/nginx/sites-enabled/*

# Copy your website files into nginx directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]