local ampUpsellModule = require(script:FindFirstAncestor("GamePlayButton").Parent.AmpUpsell)

return game:DefineFastFlag("EnablePlayButtonWizardVPCPrologue", false) and (ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and (ampUpsellModule.GetFFlagEnableReusableVPCPrologue() and ampUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix()))