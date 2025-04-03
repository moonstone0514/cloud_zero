#!/bin/bash
echo 'Restarting security deployments...'
kubectl rollout restart deployment security01
kubectl rollout restart deployment security02
kubectl rollout restart deployment security03
kubectl rollout restart deployment security04
kubectl rollout restart deployment security05
kubectl rollout restart deployment security06
kubectl rollout restart deployment security07
kubectl rollout restart deployment security08
kubectl rollout restart deployment security09
kubectl rollout restart deployment security10