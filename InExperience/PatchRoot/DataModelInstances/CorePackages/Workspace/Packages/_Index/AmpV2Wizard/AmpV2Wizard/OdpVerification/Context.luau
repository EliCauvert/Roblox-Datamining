local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent

return (require(Parent.React).createContext({
	api = require(AmpV2Wizard.OdpVerification.ApiProvider),
	personaInquiryService = require(AmpV2Wizard.OdpVerification.PersonaInquiryService),
	openWebView = require(Parent.WebViewUtils).openWebViewSession,
	externalBrowser = require(AmpV2Wizard.OdpVerification.ExternalBrowser)
}))