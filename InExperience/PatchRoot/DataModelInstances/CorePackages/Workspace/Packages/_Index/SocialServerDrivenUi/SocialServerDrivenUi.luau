return {
	SduiSocialRegister = require(script.System.SduiSocialRegister),
	OpenProfileQRCodePageBridge = require(script.System.OpenProfileQRCodePageBridge),
	PymkNavigationBridge = require(script.System.PymkNavigationBridge),
	SocialSduiComponentWrapper = require(script.Components.SocialSduiComponentWrapper.SocialSduiComponentWrapper),
	registerSocialActions = require(script.Actions.registerSocialActions),
	["jest.config"] = script["jest.config"]
}