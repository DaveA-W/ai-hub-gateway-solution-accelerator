using './main.bicep'

/* 
 * AI Hub Gateway Solution Accelerator - Complete Parameters File
 * This file contains ALL available parameters with default values
 * Customize values as needed for your deployment
 */

// =============================================================================
// BASIC PARAMETERS
// =============================================================================

// Name of the environment (generates unique hash for resources)
param environmentName = 'airbus-sbx'

// Primary Azure region for deployment
// Allowed: uaenorth, southafricanorth, westeurope, southcentralus, australiaeast, 
//          canadaeast, eastus, eastus2, francecentral, japaneast, northcentralus, 
//          swedencentral, switzerlandnorth, uksouth
param location = 'australiaeast'
// See AU East latency at https://learn.microsoft.com/en-us/azure/networking/azure-network-latency?tabs=APAC%2CAusNz
param secondaryLocation = 'japaneast'

// Tags applied to all resources
param tags = {
  Environment: 'SBX'
  System: 'AIRBUS'
  'azd-env-name': 'airbus-sbx'
  SecurityControl: 'Ignore'
  Project: 'AIRBUS'
}

// =============================================================================
// RESOURCE NAMES (leave empty for auto-generated names)
// =============================================================================

param resourceGroupName = 'DAW-SYD-NS-ARG-Airbus'
param apimIdentityName = 'sp-mid-syd-sbx-airbus-apim'
param usageLogicAppIdentityName = 'sp-mid-syd-sbx-airbus-usage'
param apimServiceName = 'daw-syd-sbx-airbus-apim'
param logAnalyticsName = 'daw-syd-sbx-law-airbus'
param apimApplicationInsightsDashboardName = 'daw-syd-sbx-ain-apim-airbus-dash'
param funcAplicationInsightsDashboardName = 'daw-syd-sbx-ain-airbus-functions-dash'
param foundryApplicationInsightsDashboardName = 'daw-syd-sbx-ain-airbus-foundry-dash'
param apimApplicationInsightsName = 'daw-syd-sbx-ain-apim'
param funcApplicationInsightsName = 'daw-syd-sbx-ain-airbus-functions'
param foundryApplicationInsightsName = 'daw-syd-sbx-ain-airbus-foundry'
param eventHubNamespaceName = 'daw-syd-sbx-evh-airbus'
param cosmosDbAccountName = 'dawsydsbxcosmosairbus'
param usageProcessingLogicAppName = 'daw-syd-sbx-lap-airbus-usage'
param storageAccountName = 'dawsydsbxstaairbus'
param languageServiceName = 'daw-syd-sbx-lan-airbus'
param aiContentSafetyName = 'daw-syd-sbx-cos-airbus'
param apicServiceName = 'daw-syd-sbx-apc-apim'
// param aiFoundryResourceName = 'daw-syd-sbx-aif-airbus'
// param aiFoundryResourceName2 = 'daw-tok-sbx-aif-airbus' 

// =============================================================================
// MONITORING PARAMETERS
// =============================================================================

// Log Analytics Workspace Configuration
param useExistingLogAnalytics = false
param existingLogAnalyticsName = ''  // Name of existing Log Analytics workspace
param existingLogAnalyticsRG = ''  // Resource group of existing workspace
param existingLogAnalyticsSubscriptionId = ''  // Subscription ID (leave empty for current subscription)

// =============================================================================
// NETWORKING PARAMETERS
// =============================================================================

// Virtual Network Configuration
param vnetName = 'DAW-SYD-NS-VNT-10.64.80.0'
param useExistingVnet = false
param existingVnetRG = '' // WAR-SYD-NS-ARG-Network

// Subnet Names
param apimSubnetName = 'DAW-SYD-NS-SUB-APIM'
param privateEndpointSubnetName = 'DAW-SYD-NS-SUB-PE'
param functionAppSubnetName = 'DAW-SYD-NS-SUB-ASE'

// Network Security Groups and Route Tables
param apimNsgName = 'DAW-SYD-NS-NSG-APIM'
param privateEndpointNsgName = 'DAW-SYD-NS-NSG-PE'
param functionAppNsgName = 'DAW-SYD-NS-NSG-ASE'
param apimRouteTableName = 'DAW-SYD-NS-RT-APIM'

// VNet Address Spaces and Subnet Prefixes
param vnetAddressPrefix = '10.64.80.0/21'
param apimSubnetPrefix = '10.64.83.0/27'
param privateEndpointSubnetPrefix = '10.64.83.64/26'
param functionAppSubnetPrefix = '10.64.84.0/25'
// TODO: Deploy functionApp into ASE

// DNS Zone Configuration (for existing VNet scenarios)
// param dnsZoneRG = 'WAR-SYD-NS-ARG-Network'
// param dnsSubscriptionId = '0de677dd-b619-4940-89a8-e0eef88f21f1'

// =============================================================================
// PRIVATE ENDPOINTS
// =============================================================================

param storageBlobPrivateEndpointName = 'DAW-SYD-NS-PE-AI-011'
param storageFilePrivateEndpointName = 'DAW-SYD-NS-PE-AI-012'
param storageTablePrivateEndpointName = 'DAW-SYD-NS-PE-AI-013'
param storageQueuePrivateEndpointName = 'DAW-SYD-NS-PE-AI-014'
param cosmosDbPrivateEndpointName = 'DAW-SYD-NS-PE-AI-002'
param eventHubPrivateEndpointName = 'DAW-SYD-NS-PE-AI-003'
param openAiPrivateEndpointName = 'DAW-SYD-NS-PE-AI-020'
param languageServicePrivateEndpointName = 'DAW-SYD-NS-PE-AI-021'
param aiContentSafetyPrivateEndpointName = 'DAW-SYD-NS-PE-AI-022'
param apimV2PrivateEndpointName = 'DAW-SYD-NS-PE-AI-001'

// =============================================================================
// SERVICES NETWORK ACCESS CONFIGURATION
// =============================================================================

// API Management Network Configuration
// apimNetworkType: External (public) or Internal (private)
param apimNetworkType = 'External'
param apimV2UsePrivateEndpoint = true
param apimV2PublicNetworkAccess = true

// Azure Services Public Network Access
param cosmosDbPublicAccess = 'Disabled'
param eventHubNetworkAccess = 'Enabled'
param languageServiceExternalNetworkAccess = 'Disabled'
param aiContentSafetyExternalNetworkAccess = 'Disabled'

// Azure Monitor Private Link Scope
param useAzureMonitorPrivateLinkScope = false

// =============================================================================
// FEATURE FLAGS
// =============================================================================

param createAppInsightsDashboards = true
param enableAIModelInference = true
param enableDocumentIntelligence = true
param enableAzureAISearch = true
param enableAIGatewayPiiRedaction = true
param enableOpenAIRealtime = true
param enableAIFoundry = true
param entraAuth = false
param enableAPICenter = true

// =============================================================================
// COMPUTE SKU & SIZE
// =============================================================================

// API Management SKU
// Allowed: Developer, Premium, StandardV2, PremiumV2
param apimSku = 'Developer'
param apimSkuUnits = 1

// Event Hub & Cosmos DB Capacity
param eventHubCapacityUnits = 1
param cosmosDbRUs = 400

// Logic Apps & Language Services
param logicAppsSkuCapacityUnits = 1
param languageServiceSkuName = 'S'
param aiContentSafetySkuName = 'S0'

// API Center SKU
param apicSku = 'Free'

// =============================================================================
// ACCELERATOR SPECIFIC PARAMETERS
// =============================================================================

param logicContentShareName = 'usage-logic-content'

// AI Search Instances Configuration
// Add your AI Search instances here
param aiSearchInstances = [
  // Example:
  // {
  //   name: 'ai-search-01'
  //   url: 'https://mysearch01.search.windows.net/'
  //   description: 'AI Search Instance 1'
  // }
]

// AI Foundry Instances Configuration
// Configure AI Foundry instances, their locations and default project name
param aiFoundryProjectName = 'airbus-governance' // Leave empty for auto-generated name
param aiFoundryInstances = [
  {
    name: 'daw-syd-sbx-aif-airbus'  // Leave empty for auto-generated name
    location: location
    customSubDomainName: ''
    defaultProjectName: '' // Leave empty unless distinct names required per instance
  }
  {
    name: 'daw-tok-sbx-aif-airbus'  // Leave empty for auto-generated name
    location: secondaryLocation
    customSubDomainName: ''
    defaultProjectName: '' // Leave empty unless distinct names required per instance
  }
]

// AI Foundry Model Deployments Configuration
// See https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/concepts/models-sold-directly-by-azure
// aiserviceIndex: Index of the AI Foundry instance in aiFoundryInstances array
// Leave aiserviceIndex empty to deploy to all instances
param aiFoundryModelsConfig = [
  // Models for all instances
  {
    name: 'gpt-5-mini'
    publisher: 'OpenAI'
    version: '2025-08-07'
    sku: 'GlobalStandard'
    capacity: 1
    // aiserviceIndex:
  }
  {
    name: 'gpt-4o'
    publisher: 'OpenAI'
    version: '2024-11-20'
    sku: 'GlobalStandard'
    capacity: 1
    // aiserviceIndex: 
  }
  // Models specific to AI Foundry Instance 0
  {
    name: 'gpt-4o-mini'
    publisher: 'OpenAI'
    version: '2024-07-18'
    sku: 'GlobalStandard'
    capacity: 1
    aiserviceIndex: 0
  }
  {
    name: 'DeepSeek-R1'
    publisher: 'DeepSeek'
    version: '1'
    sku: 'GlobalStandard'
    capacity: 1
    aiserviceIndex: 0
  }
  {
    name: 'Phi-4'
    publisher: 'Microsoft'
    version: '3'
    sku: 'GlobalStandard'
    capacity: 1
    aiserviceIndex: 0
  }
  // Models sepcific to AI Foundry Instance 1
  // {
  //   name: 'gpt-5'
  //   publisher: 'OpenAI'
  //   version: '2025-08-07'
  //   sku: 'GlobalStandard'
  //   capacity: 50
  //   aiserviceIndex: 1
  // }
  // {
  //   name: 'DeepSeek-R1'
  //   publisher: 'DeepSeek'
  //   version: '1'
  //   sku: 'GlobalStandard'
  //   capacity: 1
  //   aiserviceIndex: 1
  // }
]

// =============================================================================
// MICROSOFT ENTRA ID AUTHENTICATION
// =============================================================================

param entraTenantId = ''
param entraClientId = ''
param entraAudience = ''
