local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")

return require(AmpV2Wizard.Nodes.createOdpVerificationNode)(require(AmpV2Wizard.OdpVerification.Types).OdpVerificationMethod.Idv)