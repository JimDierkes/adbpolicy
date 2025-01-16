az login --tenant <TENANTID>

az policy definition delete --name "enforce-naming-adb-resourcegroupnameeast"
az policy definition create --name "enforce-naming-adb-resourcegroupnameeast" --display-name "Enforce naming on Databricks Resource Group East" --description "Ensure Databricks resource group name meets standards" --rules "enforce-naming-adb-resourcegroupnameeast.json" --params "effect.deny.parameters.json" --mode All --metadata 'version=1.0.7' 'category=Azure Databricks Custom'
az policy definition show   --name "enforce-naming-adb-resourcegroupnameeast"
az policy assignment create --name "DatabricksResourceGrouoNameEast" --display-name "Enforce Databricks Resource Group Name East"  --policy "enforce-naming-adb-resourcegroupnameeast" --scope "/subscriptions/<SUBSCRIPTIONID>"
az policy assignment delete --name "DatabricksResourceGrouoNameEast" --scope "/subscriptions/<SUBSCRIPTIONID>"

az policy definition delete --name "enforce-naming-adb-resourcegroupnamewest"
az policy definition create --name "enforce-naming-adb-resourcegroupnamewest" --display-name "Enforce naming on Databricks Resource Group West" --description "Ensure Databricks resource group name meets standards" --rules "enforce-naming-adb-resourcegroupnamewest.json" --params "effect.deny.parameters.json" --mode All --metadata 'category=Azure Databricks Custom'
az policy definition show   --name "enforce-naming-adb-resourcegroupnamewest"
az policy assignment create --name "DatabricksResourceGrouoNameWest" --display-name "Enforce Databricks Resource Group Name West" --policy "enforce-naming-adb-resourcegroupnamewest" --scope "/subscriptions/<SUBSCRIPTIONID>"
az policy assignment delete --name "DatabricksResourceGrouoNameWest" --scope "/subscriptions/<SUBSCRIPTIONID>"

az policy definition delete --name "enforce-naming-adb-workspacename"
az policy definition create --name "enforce-naming-adb-workspacename" --display-name "Enforce Databricks Workspace Name" --description "Ensure Databricks workspace name meets standards" --rules "enforce-naming-adb-workspacename.json" --params "effect.deny.parameters.json" --mode All --metadata 'category=Azure Databricks Custom'
az policy definition show   --name "enforce-naming-adb-workspacename"
az policy assignment create --name "DatabricksVirtualNetwork" --display-name "Databricks in Virual Network" --policy "enforce-naming-adb-workspacename" --scope "/subscriptions/<SUBSCRIPTIONID>"
az policy assignment delete --name "DatabricksVirtualNetwork" --scope "/subscriptions/<SUBSCRIPTIONID>"

az policy definition delete --name "enforce-naming-adb-workspacelocations"
az policy definition create --name "enforce-naming-adb-workspacelocations" --display-name "Enforce Databricks Allowed Locations" --description "Ensure Databricks workspace is deployed in allowed locations" --rules "enforce-naming-adb-workspacelocations.json" --params "effect.deny.parameters.json" --mode All --metadata 'category=Azure Databricks Custom'
az policy definition show   --name "enforce-naming-adb-workspacelocations"
az policy assignment create --name "DatabricksLocations" --display-name "Databricks Allowed Locations" --policy "enforce-naming-adb-workspacelocations" --scope "/subscriptions/<SUBSCRIPTIONID>"
az policy assignment delete --name "DatabricksLocations" --scope "/subscriptions/<SUBSCRIPTIONID>"

az policy definition delete --name "enforce-naming-adb-secureclusterconnectivity"
az policy definition create --name "enforce-naming-adb-secureclusterconnectivity" --display-name "Enable Secure Databricks Cluster Connectivity" --description "Secure cluster connectivity is also known as no public IP (NPIP)" --rules "enforce-naming-adb-secureclusterconnectivity.json" --params "effect.deny.parameters.json" --mode All --metadata 'category=Azure Databricks Custom'
az policy definition show   --name "enforce-naming-adb-secureclusterconnectivity"
az policy assignment create --name "DatabricksSecureClusterConnectivity" --display-name "Enable Secure Databricks Cluster Connectivity" --policy "enforce-naming-adb-secureclusterconnectivity" --scope "/subscriptions/<SUBSCRIPTIONID>"
az policy assignment delete --name "DatabricksSecureClusterConnectivity" --scope "/subscriptions/<SUBSCRIPTIONID>"



# 9c25c9e4-ee12-4882-afd2-11fb9d87893f  Azure Databricks Workspaces should be in a virtual network
az policy assignment create --name "DatabricksVirtualNetwork" --display-name "Databricks in Virual Network" --policy "9c25c9e4-ee12-4882-afd2-11fb9d87893f" --scope "/subscriptions/<SUBSCRIPTIONID>" --params '{"Effect":{"value":"Audit"}}'
az policy assignment delete --name "DatabricksVirtualNetwork" --scope "/subscriptions/<SUBSCRIPTIONID>"


# 2cc2c3b5-c2f8-45aa-a9e6-f90d85ae8352  Azure Databricks workspaces should be Premium SKU that supports features like private link, customer-managed key for encryption
az policy assignment create --name "DatabricksPremiumSKU" --display-name "Databricks Premium SKU" --policy "2cc2c3b5-c2f8-45aa-a9e6-f90d85ae8352" --scope "/subscriptions/<SUBSCRIPTIONID>" --params '{"Effect":{"value":"Audit"}}'
az policy assignment delete --name "DatabricksPremiumSKU" --scope "/subscriptions/<SUBSCRIPTIONID>"

az policy assignment create --help


az policy definition list --help
az policy definition list --query "[?metadata.category=='Azure Databricks Custom']" --output table
az policy definition list --query "[?metadata.category=='Azure Databricks']" --output table

az policy definition list --query "[?metadata.category=='Azure Databricks Custom'].{Name:name,DisplayName:displayName,Description:description}" --output table
az policy definition list --query "[?metadata.category=='Azure Databricks'].{Name:name,DisplayName:displayName,Description:description}" --output table

