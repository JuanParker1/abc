// ----------------------------------------------------------------------------------
// THIS CODE AND INFORMATION ARE PROVIDED 'AS IS" WITHOUT WARRANTY OF ANY KIND,
// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
// ----------------------------------------------------------------------------------

targetScope = 'managementGroup'

param assignableMgId string
var scope = tenantResourceId('Microsoft.Management/managementGroups', assignableMgId)

var roleName = 'NetOps (Network Management)'
var description = 'Platform-wide global connectivity management: Virtual networks, UDRs, NSGs, NVAs, VPN, Azure ExpressRoute, and others'

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
          'Microsoft.operationalinsights/workspaces/features/servergroups/members/read'
          'Microsoft.operationalinsights/workspaces/features/clientgroups/memebers/read'
          'Microsoft.operationalinsights/workspaces/features/machineGroups/read'
          'Microsoft.OperationalInsights/workspaces/query/VMBoundPort/read'
          'Microsoft.OperationalInsights/workspaces/query/VMComputer/read'
          'Microsoft.OperationalInsights/workspaces/query/VMConnection/read'
          'Microsoft.OperationalInsights/workspaces/query/VMProcess/read'
          'Microsoft.OperationalInsights/workspaces/query/InsightsMetrics/read'
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
