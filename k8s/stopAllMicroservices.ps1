Write-Host "stoping all simpleapp microservices" -ForegroundColor White
#kubectl apply -f simpleweb-configmap.yaml
#kubectl apply -f simpleweb-deployment.yaml
#kubectl apply -f simpleweb-loadbalancer.yaml
kubectl delete -f simpleapi-configmap.yaml
kubectl delete -f simpleapi-deployment.yaml
kubectl delete -f simpleapi-service.yaml
kubectl delete -f simpleapidb-deployment.yaml
kubectl delete -f simpleapidb-service.yaml
kubectl delete -f simpleweb-configmap.yaml
kubectl delete -f simpleweb-deployment.yaml
kubectl delete -f simpleweb-service.yaml

Write-Host "The list of k8s objects running locally is:" -ForegroundColor Yellow
kubectl get all