Write-Host "starting all simpleapp microservices" -ForegroundColor White


kubectl apply -f simpleapidb-deployment.yaml
kubectl apply -f simpleapidb-service.yaml
Write-Host "Database service started"

kubectl apply -f simpleapi-configmap.yaml
kubectl apply -f simpleapi-deployment.yaml
kubectl apply -f simpleapi-service.yaml
Write-Host "api service started"

kubectl apply -f simpleweb-configmap.yaml
kubectl apply -f simpleweb-deployment.yaml
kubectl apply -f simpleweb-service.yaml
Write-Host "ui service started"

Write-Host "The list of k8s objects running locally is:" -ForegroundColor Yellow
kubectl get all