param sitename string 
param location string = resourceGroup().location
param dockerImage string
param dockerImageTag string
param appPlanId string

resource name_website 'Microsoft.Web/sites@2022-03-01' = {
  name: sitename
  location: location
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
    }
    serverFarmId: appPlanId
  }
}

output siteUrl string = name_website.properties.hostNames[0]
