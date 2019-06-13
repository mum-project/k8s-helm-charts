#Install all all secrets in your kubernetes
kubectl apply -f secrets.yaml

#Deploy your helm charts to your cluster
helm install ./