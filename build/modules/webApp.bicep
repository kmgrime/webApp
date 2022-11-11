// parameters
param appServicePlanIdParam string
param environmentParam string
param linuxFxVersionParam string
param webAppNameParam string
param location string = resourceGroup().location

// variables
var webAppName = '${webAppNameParam}-${environmentParam}'


// webApp
resource webApp 'Microsoft.Web/sites@2021-01-01' = {
  name: webAppName
  location: location
  properties: {
    siteConfig: {
      appSettings: []
      linuxFxVersion: linuxFxVersionParam
    }
    serverFarmId: appServicePlanIdParam
  }
}
