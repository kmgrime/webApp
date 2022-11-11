targetScope = 'subscription'

// parameters
param appServicePlan object
param resGroup object
param webApp object
param location string = deployment().location

// resourceGroup
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resGroup.name
  location: location
  tags: resGroup.tags
}

// appPlan
module appPlan 'modules/appServicePlan.bicep' = {
  scope: rg
  name: appServicePlan.name
  params: {
    appServicePlanNameParam: appServicePlan.name
    appServicePlanSkuParam: appServicePlan.sku
    environmentParam: resGroup.tags.Environment
  }
}

// webApp
module app 'modules/webApp.bicep' = {
  scope: rg
  name: webApp.name
  params: {
    appServicePlanIdParam: appPlan.outputs.aspId
    environmentParam: resGroup.tags.Environment
    linuxFxVersionParam: webApp.linuxFxVersion
    webAppNameParam: webApp.name
  }
}
