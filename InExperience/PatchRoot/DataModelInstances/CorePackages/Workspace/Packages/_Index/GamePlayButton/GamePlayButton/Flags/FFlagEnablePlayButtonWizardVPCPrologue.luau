local AmpUpsellModule = require(script:FindFirstAncestor("GamePlayButton").Parent.AmpUpsell)

return game:DefineFastFlag("EnablePlayButtonWizardVPCPrologue", false) and (AmpUpsellModule.GetFFlagEnableAmpVPCPrologue() and (AmpUpsellModule.GetFFlagEnableReusableVPCPrologue() and AmpUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix()))