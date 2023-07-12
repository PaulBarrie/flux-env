#!/bin/sh
BRANCH=$(git rev-parse --abbrev-ref HEAD)

flux install
flux bootstrap github \
    --owner=gitter-flow \
    --repository=kubernetes-env \
    --path=./clusters/$1 \
    --branch=$BRANCH

git pull --rebase origin $BRANCH
flux check