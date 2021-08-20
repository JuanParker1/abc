// ----------------------------------------------------------------------------------
// THIS CODE AND INFORMATION ARE PROVIDED 'AS IS" WITHOUT WARRANTY OF ANY KIND
// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
// ----------------------------------------------------------------------------------

targetScope = 'managementGroup'

param assignableMgId string
var scope = tenantResourceId('Microsoft.Management/managementGroups', assignableMgId)

var roleName = 'SecOps (Security Operations)'
var description = 'Security administrator role with a horizontal view across the entire Azure estate and the Azure Key Vault purge policy'

resource roleDefn 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' = {
  name: guid(roleName)
  scope: managementGroup()
  properties: {
    roleName: roleName
    description: description
    permissions: [
      {
        actions: [
          '*/read'
          '*/register/action'
          'Microsoft.KeyVault/locations/deletedVaults/purge/action'
          'Microsoft.PolicyInsights/*'
          'Microsoft.Authorization/policyAssignments/*'
          'Microsoft.Authorization/policyDefinitions/*'
          'Microsoft.Authorization/policyExemptions/*'
          'Microsoft.Authorization/policySetDefinitions/*'
          'Microsoft.Insights/alertRules/*'
          'Microsoft.Resources/deployments/*'
          'Microsoft.Security/*'
          'Microsoft.Support/*'
        ]
        notActions: []
        dataActions: []
        notDataActions: []
      }
    ]
    assignableScopes: [
      scope
    ]
  }
}
