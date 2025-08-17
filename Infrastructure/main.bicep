param location string = resourceGroup().location
var uniqueId = uniqueString(resourceGroup().id)

module appService 'Module/Compute/appservice.bicep' = {
  name: 'apiDeployment'
  params: {
    appName: 'api-url-${uniqueId}'
    appServicePlanName: 'plan-api-url-${uniqueId}'
    location: location
  }
}
