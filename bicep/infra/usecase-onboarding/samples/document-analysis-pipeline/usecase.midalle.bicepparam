using '../../main.bicep'

// ============================================================================
// Document Analysis Pipeline Use Case - Onboarding Parameters
// ============================================================================
// This use case demonstrates onboarding a document processing pipeline that uses:
// - Azure Document Intelligence for OCR and form extraction
// - Azure OpenAI for document summarization and entity extraction
// - Multi-document batch processing capabilities
// ============================================================================

// Target APIM instance where APIs are published
param apim = {
  subscriptionId: '12e0adad-8c39-43ce-83ee-7e768d0b6220' // Replace with your subscription ID
  resourceGroupName: 'DAW-SYD-NS-ARG-Airbus'                 // Replace with your APIM resource group
  name: 'daw-syd-sbx-airbus-apim'                                 // Replace with your APIM name
}

// Target Key Vault for storing endpoint URLs and API keys
// For CI/CD pipelines, you can set useTargetAzureKeyVault to false
param keyVault = {
  subscriptionId: '12e0adad-8c39-43ce-83ee-7e768d0b6220' // Replace with your subscription ID
  resourceGroupName: 'DAW-SYD-NS-ARG-DocIntelTest'               // Replace with your Key Vault resource group
  name: 'dawsydsbxkeydocinteltest'                            // Replace with your Key Vault name
}

// Whether to store secrets in Key Vault (true) or output them directly (false)
// Set to false for CI/CD environments where you want to capture outputs
param useTargetAzureKeyVault = true

// Use case identification for naming and organization
param useCase = {
  businessUnit: 'BID'         // Your business unit or department
  useCaseName: 'DocIntelTest' // Descriptive name for this use case
  environment: 'DEV'          // Environment (DEV, TEST, PROD, etc.)
}

// Mapping of service codes to their API names in APIM
// These API names must already exist in your APIM instance
param apiNameMapping = {
  DOC: [
    'document-intelligence-api'
  ]
  OAI: [
    'azure-openai-service-api'
  ]
}

// Services required for this use case
param services = [
  {
    code: 'DOC'
    endpointSecretName: 'DOC-PIPELINE-ENDPOINT'
    apiKeySecretName: 'DOC-PIPELINE-KEY'
    policyXml: loadTextContent('doc-policy.xml')
  }
  {
    code: 'OAI'
    endpointSecretName: 'OAI-PIPELINE-ENDPOINT'
    apiKeySecretName: 'OAI-PIPELINE-KEY'
    policyXml: loadTextContent('oai-policy.xml')
  }
]

// Optional: Product terms of service
param productTerms = 'This service is for internal document processing operations. All processed documents must comply with data retention and privacy policies.'
