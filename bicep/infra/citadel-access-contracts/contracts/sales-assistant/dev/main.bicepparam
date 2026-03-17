using '../../../main.bicep'

// ============================================================================
// Sales Assistant - Key Vault only - Generated from Notebook
// ============================================================================

param apim = {
  subscriptionId: 'd2e7f84f-2790-4baa-9520-59ae8169ed0d'
  resourceGroupName: 'rg-ai-hub-citadel-dev-45'
  name: 'apim-o3f2kanzvey6q'
}

param keyVault = {
  subscriptionId: 'd2e7f84f-2790-4baa-9520-59ae8169ed0d'
  resourceGroupName: 'rg-foundry-agent-spoke-01'
  name: 'kv-foundry-spoke-01'
}

param useTargetAzureKeyVault = true

param useCase = {
  businessUnit: 'Sales'
  useCaseName: 'Assistant'
  environment: 'DEV'
}

param apiNameMapping = {
  LLM: ['universal-llm-api', 'azure-openai-api', 'unified-ai-api']
}

param services = [
  {
    code: 'LLM'
    endpointSecretName: 'SALES-LLM-ENDPOINT'
    apiKeySecretName: 'SALES-LLM-KEY'
    policyXml: loadTextContent('ai-product-policy.xml')
  }
]

param productTerms = 'Access Contract created from testing notebook - Sales Assistant - Key Vault only'

// Azure AI Foundry Integration (disabled)
param useTargetFoundry = false

param foundry = {
  subscriptionId: '00000000-0000-0000-0000-000000000000'
  resourceGroupName: 'placeholder'
  accountName: 'placeholder'
  projectName: 'placeholder'
}

