#!/bin/bash


function expose_service() {
    fuser -k $3/tcp
    kubectl -n $1 port-forward service/$2 $3:$4 &
    echo "Service $1/$2 available at http://localhost:$3"
}

if [ -z $1 ]; then
    echo 'List of available services:
    - openfaas
    - traefik
    - keycloak
    - minio
    '
    exit 1
fi


case $1 in
    openfaas)
        expose_service openfaas gateway 8080 8080
        ;;
    traefik)
        expose_service traefik traefik 80 80
        ;;
    keycloak)
        expose_service auth keycloak-http 8081 80
        ;;
    minio)
        expose_service bucket-service minio 9000 9000
        ;;
    *)
        echo "Unhandled service: $1"
        ;;
esac
