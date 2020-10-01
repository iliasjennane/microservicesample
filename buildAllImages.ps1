  
Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$simpleapiImageTag,
    [Parameter(Mandatory=$false)][string]$simpleapidbImageTag,
    [Parameter(Mandatory=$false)][string]$simplewebImageTag
)

if ([string]::IsNullOrEmpty($simpleapiImageTag)) {
    $simpleapiImageTag = 'latest'
}
Write-Host "Docker simpleapi image will be built with tag: $simpleapiImageTag" -ForegroundColor White

if ([string]::IsNullOrEmpty($simpleapidbImageTag)) {
    $simpleapidbImageTag = 'latest'
}
Write-Host "Docker simpleapi database image will be built with tag: $simpleapidbImageTag" -ForegroundColor White

if ([string]::IsNullOrEmpty($simplewebImageTag)) {
    $simplewebImageTag = 'latest'
}
Write-Host "Docker simpleweb image will be built with tag: $simplewebImageTag" -ForegroundColor White

docker build -t simpleapi:$simpleapiImageTag ./simpleapi.Solution
docker build -t simpleapidb:$simpleapiImageTag ./simpleapi.Solution/simpleapi.Database
docker build -t simpleweb:$simplewebImageTag ./simpleweb.Solution

docker image ls "simple*"