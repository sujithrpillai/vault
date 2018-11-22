# Hashicorp Vault
This repo contains my experiments with Hashicorp Vault.
You can use this as a reference only. Refer official Hashicorp https://www.hashicorp.com/ for authentic information related to Vault. 

This repo explores the following items, 
* Setting up a Hashicorp Vault Server with Web UI using Docker container
* Seting up a SSH Server & SSH client
* Use Vault to authorise SSH access from the client to server via Vault.

## Vault Server
This is a minimalized version of Vault container. (Use the official DockerHub image if you prefer :-https://hub.docker.com/_/vault/)

### Build details
* Clone this git repo
```shell
git clone << Replace with Repo URL >>
```
* Build the docker images from scratch
```shell
docker build -t vaultserver .
```

### Running the Vault server
* Use the sample config.json and docker-compose.yml provided
* Run the container using docker-compose
```shell
docker-compose up -d
```

### Setting up Vault server
```shell
export VAULT_ADDR="http://127.0.0.1:8200"
vault operator init -key-shares=1 -key-threshold=1
# Unseal Key 1: DPs8g6xBAwf5AyWl9DpMUAx+Y2mJSk4x6GYfWnLTXqE=
# Initial Root Token: 6TpqTEGZsQMrW0WzgRMRtGry
vault operator unseal DPs8g6xBAwf5AyWl9DpMUAx+Y2mJSk4x6GYfWnLTXqE=
vault login token=6TpqTEGZsQMrW0WzgRMRtGry
```
### Enabling SSH Secrets Engine
```shell
vault secrets enable -path=ssh-client ssh
```
