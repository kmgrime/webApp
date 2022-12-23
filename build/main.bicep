targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'appRG'
  location: deployment().location
}

module appPlanDeploy 'modules/appPlan.bicep' = {
  name: 'appPlanDeploy'
  scope: rg
  params: {
    appServicePlanNameParam: 'appPlanWork'
    environmentParam: 'dev'
  }
}

var websites = [
  {
    name: 'uisite123'
    tag: 'latest'
  }
  {
    name: 'plaintextsite123'
    tag: 'plain-text'
  }
]

module siteDeploy 'modules/site.bicep' = [for site in websites: {
  scope: rg
  name: '${site.name}siteDeploy'
  params: {
    appPlanId: appPlanDeploy.outputs.PlanId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: site.tag
    sitename: site.name
  }
}]
