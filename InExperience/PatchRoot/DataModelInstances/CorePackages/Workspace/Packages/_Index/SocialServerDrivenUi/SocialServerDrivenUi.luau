return {
	SduiSocialRegister = require(script.System.SduiSocialRegister),
	OpenProfileQRCodePageBridge = require(script.System.OpenProfileQRCodePageBridge),
	PymkNavigationBridge = require(script.System.PymkNavigationBridge),
	SocialSduiComponentWrapper = require(script.Components.SocialSduiComponentWrapper.SocialSduiComponentWrapper),
	registerSocialActions = require(script.Actions.registerSocialActions),
	registerSocialActionTelemetryHandlers = require(script.Actions.TelemetryHandlers.registerSocialActionTelemetryHandlers),
	registerSocialComponents = require(script.System.registerSocialComponents),
	registerSocialImpressions = require(script.Impressions.registerSocialImpressions),
	FFlagSduiCreateSocialTelemetryRegistries = require(script.Flags.FFlagSduiCreateSocialTelemetryRegistries),
	["jest.config"] = script["jest.config"]
}