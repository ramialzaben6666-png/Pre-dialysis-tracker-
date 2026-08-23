FROM node:20-slim
WORKDIR /app
COPY pd-education-tracker.zip .
RUN apt-get update && apt-get install -y --no-install-recommends unzip && \
    unzip -o pd-education-tracker.zip -d /tmp/extracted && \
    cp -r /tmp/extracted/pd-tracker/. . && \
    rm -rf /tmp/extracted pd-education-tracker.zip /var/lib/apt/lists/* && \
    npm install --omit=dev
EXPOSE 3000
CMD ["node", "server.js"]
