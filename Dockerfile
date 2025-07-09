# 1. Alpine tabanlı Node.js image'ı kullan
FROM node:20-alpine

# 2. Chromium kurmak için bazı paketler gerekli
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nginx

# 3. Puppeteer Chromium'u bulabilsin diye env değişkeni
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# 4. Çalışma dizini oluştur
WORKDIR /app

# 5. HTML dosyasını nginx'in sunacağı yere kopyala
COPY index.html /usr/share/nginx/html/

# 6. Nginx config dosyasını doğru yere kopyala
COPY nginx.conf /etc/nginx/nginx.conf

# 7. server.js dosyasını kopyala
COPY server.js .

# 8. Node modüllerini yükle
RUN npm init -y && npm install puppeteer

# 9. Output klasörü oluştur
RUN mkdir /output

# 10. Aynı anda nginx + Node script başlat
CMD sh -c "nginx && node server.js"