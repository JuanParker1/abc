// ----------------------------------------------------------------------------------
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
// ----------------------------------------------------------------------------------

targetScope = 'managementGroup'

@minLength(2)
@maxLength(10)
param topLevelManagementGroupName string

param parentManagementGroupId string

// Level 1
resource topLevel 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: topLevelManagementGroupName
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: tenantResourceId('Microsoft.Management/managementGroups', parentManagementGroupId)
      }
    }
  }
}

// Level 2
resource secOps 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.SecOps'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

resource sharedServices 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.ShareServices'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

resource corporate 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.Corporate'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

resource businessUnit 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.BusinessUnit'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

resource retired 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.RetiredSubscriptions'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

resource sandbox 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${topLevelManagementGroupName}.Sandbox'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: topLevel.id
      }
    }
  }
}

// Level 3 - Landing Zones

resource corpProd 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${corporate.name}.Prod'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: corporate.id
      }
    }
  }
}

resource corpNonProd 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${corporate.name}.NonProd'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: corporate.id
      }
    }
  }
}

resource businessUnitProd 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${businessUnit.name}.Prod'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: businessUnit.id
      }
    }
  }
}

resource businessUnitNonProd 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: '${businessUnit.name}.NonProd'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: businessUnit.id
      }
    }
  }
}
