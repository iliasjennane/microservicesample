docker-compose -f 'dc.allup.yml' up --build -d
$resource = "http://localhost:8080/api/customers"
$result = ""
Try
{
    $result = Invoke-RestMethod -Method Get -Uri $resource
}
Catch
{
   echo "api invoked once for warmup"
}
