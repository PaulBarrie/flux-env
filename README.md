# Gitter environement

>## Manage Flux environment

Init with :

```
export GITHUB_TOKEN=<token>
git checkout -b /new/branch
./flux-setup.sh
```

Edit:

```
    ./flux-edit.sh <"some commit message">
```

Force reconciliation with:

```
    ./flux-edit.sh --dry
```

>## Expose services

Expose a particular service running on a localhost port running:

```
    ./expose-dev.sh <service-name>
```

Get the list of the handled services running `./expose-dev.sh`.

>## Openfaas: 
- https://docs.openfaas.com/deployment/kubernetes/
- https://www.digitalocean.com/community/tutorials/how-to-run-serverless-functions-using-openfaas-on-digitalocean-kubernetes-fr

Get the admin password with:
```
PASSWORD=$(kubectl -n openfaas get secret basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode) && echo "OpenFaaS admin password: $PASSWORD"
```

Expose the service running:

```
    kubectl -n openfaas port-forward svc/gateway-external 8080:8080
```

Create and call a function with:
``` 
    curl -sL https://cli.openfaas.com | sudo sh
    export GATEWAY_URL=http://localhost:8080
    export GATEWAY_PASSWORD=ctVj8ar5FwFg
    export DOCKER_ID=
    echo -n "password1234" | faas 
    faas new hello --lang golang-middleware --handler function --gateway $GATEWAY_URL --prefix $DOCKER_ID
    curl http://127.0.0.1:8080/function/test-node
```

# Keycloak

https://github.com/ibuetler/docker-keycloak-traefik-workshop/issues/1