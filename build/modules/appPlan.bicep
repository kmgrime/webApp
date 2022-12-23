param appServicePlanNameParam string
param environmentParam string
param location string = resourceGroup().location

var appServicePlanName = '${appServicePlanNameParam}-${environmentParam}'

resource appPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: 'B1'
  }
}

output PlanId string = appPlan.id
