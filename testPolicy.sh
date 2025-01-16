#!/bin/bash

createDatabricksWorkspaces() {
  local -n array=$1
  
  echo "${array[0]} - ${array[1]} - ${array[2]} - ${array[3]} - ${array[4]}"

  # Uncomment and modify the following lines as needed
  echo "Creating RG ${array[0]}"
  az group create --name "${array[0]}" --location "${array[3]}"

  echo "Creating Databricks Workspace ${array[2]}"
  az databricks workspace create --resource-group "${array[0]}" --name "${array[2]}" --location "${array[3]}" --sku standard --enable-no-public-ip ${array[4]}
}

cleanUp() {
  local -n array=$1
  
  echo "${array[0]} - ${array[1]} - ${array[2]} - ${array[3]}"
  echo "Deleting RG ${array[0]}"

  # Uncomment and modify the following lines as needed
  az group delete --name "${array[0]}" --yes --no-wait
}

# Test Cases
testCase01=("test01d-rg" "test-managed01d-rg" "ws01d" "eastus" false) # Fail Enable Secure Databricks Cluster Connectivity
testCase02=("test02d-rg" "test-managed02d-rg" "ws02d" "eastus2" true) # Fail location
testCase03=("test03d-rg" "test-managed03d-rg" "ws03d" "eastus2" true) # Fail location
testCase04=("test04d-rg3" "test-managed04d-rg" "ws04d" "westus" true)

testCase10=("test10d-rg" "test-manage10d-rg" "ws10d" "eastus" true)  # Succeed

testCases=(
  testCase01
  testCase02
)

for testCase in "${testCases[@]}"; do
    #createDatabricksWorkspaces "$testCase"
    #cleanUp "$testCase"
done