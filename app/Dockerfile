# Use the official n8n image
FROM n8nio/n8n:latest


WORKDIR /data


COPY add-form.json /data/add-form.json
COPY check-pulse.json /data/check-pulse.json
COPY credentials.json /data/credentials.json



EXPOSE 5678




RUN n8n import:workflow --input=/data/add-form.json
RUN n8n import:workflow --input=/data/check-pulse.json
RUN n8n import:credentials --input=/data/credentials.json
RUN n8n update:workflow --all --active=true

