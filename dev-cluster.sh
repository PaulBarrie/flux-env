#!/bin/bash

kind create cluster --name test-cluster --image kindest/node:v1.21.1 --config kind.yaml