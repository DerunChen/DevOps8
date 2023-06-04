# Variables    
$location = "eastus"
$resourceGroup = "vulnerableWebApp-rg"
$appServicePlan = "vulnerableWebAppPlan"
$appServiceName = "vulnerableWebAppServiceUB"

## 1 
#Write-Host "[MasterUB] Create resource group $resourceGroup" 
az group create -l $location -n $resourceGroup

## 2 
Write-Host "[MasterUB] Create App Service Plan ==> $appServicePlan"     
az appservice plan create `
    --resource-group $resourceGroup `
    --name $appServicePlan `
    --location $location `
    --sku F1 `
    --number-of-workers 2
 
## 3
Write-Host "[MasterUB] Create App Service ==> $appServiceName" 
az webapp create `
    --name $appServiceName `
    --resource-group $resourceGroup `
    --plan $appServicePlan

az webapp config set `
    --always-on false `
    --resource-group $resourceGroup `
    --name $appServiceName