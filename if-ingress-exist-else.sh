#!/bin/bash

INGRESS_NAME=${1:-default};

INGRESS=$(kubectl get ingress $INGRESS_NAME -n <namespace> --ignore-not-found);
if [[ "$INGRESS" ]]; then
  echo "Skipping creation of ingress $INGRESS_NAME - already exists";
else
  echo "Creating ingress $INGRESS_NAME";
  k create ingress -n <namespace> $INGRESS_NAME;
fi;
