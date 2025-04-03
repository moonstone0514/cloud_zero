#!/bin/bash
echo 'Restarting besiness deployments...'
kubectl rollout restart deployment besiness01
kubectl rollout restart deployment besiness02
kubectl rollout restart deployment besiness03
kubectl rollout restart deployment besiness04
kubectl rollout restart deployment besiness05
kubectl rollout restart deployment besiness06
kubectl rollout restart deployment besiness07
kubectl rollout restart deployment besiness08
kubectl rollout restart deployment besiness09
kubectl rollout restart deployment besiness10