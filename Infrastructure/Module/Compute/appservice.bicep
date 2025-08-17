param location string
param appServicePlanName string
param appName string

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' ={
  kind:'linux'
  location: location
  name: appServicePlanName
  properties: {
    reserved:true
  }
  sku:{
    name: 'F1'
  }
  
}

resource webApp 'Microsoft.Web/sites@2024-11-01' = {
  name: appName
  location: location
  properties:{
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|9.0'
    }
  }
}

resource webAppConfig 'Microsoft.Web/sites/config@2024-11-01'={
  parent: webApp
  name: 'web'
  properties:{
    scmType: 'GitHub'
  }
}

output appServiceId string = webApp.id
