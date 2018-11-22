FROM alpine
ENV VAULT_VERSION=0.11.5
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip -d /bin vault_${VAULT_VERSION}_linux_amd64.zip && \
    rm -rf vault_${VAULT_VERSION}_linux_amd64.zip
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
