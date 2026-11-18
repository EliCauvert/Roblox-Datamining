local LocalizationService = game:GetService("LocalizationService")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local CloudPlayTelemetryModule = require(InExperienceCloudPlay.CloudPlayTelemetry)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local CloudPlayUnsupportedFeatureSnackbarSeconds = game:DefineFastInt("CloudPlayUnsupportedFeatureSnackbarSeconds", 4)
local config = {
	Captures = "Feature.CloudClient.Label.CaptureUnavailableCloudPlay",
	SelfView = "Feature.CloudClient.Label.SelfViewUnavailableCloudPlay"
}
local config1 = {
	Captures = "Feature.CloudClient.Label.CaptureUnavailableRobloxReality",
	SelfView = "Feature.CloudClient.Label.SelfViewUnavailableRobloxReality"
}
local config2 = { Captures = "capture", SelfView = "self_view" }

return function(p1)
	-- upvalues: GetCloudClientServiceModule (copy), config1 (copy), config (copy), InExperienceLocalesModule (copy), LocalizationService (copy), TransientUIOverlayModule (copy), FoundationModule (copy), CloudPlayUnsupportedFeatureSnackbarSeconds (copy), CloudPlayTelemetryModule (copy), config2 (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	TransientUIOverlayModule.displaySnackbar({
		kind = "snackbar",
		title = InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId):Format((if CloudClientServiceModule and CloudClientServiceModule.IsRobloxRealityEnvironment then config1 else config)[p1]),
		icon = FoundationModule.Enums.IconName.TriangleExclamation
	}, CloudPlayUnsupportedFeatureSnackbarSeconds)
	CloudPlayTelemetryModule.logUnsupportedFeatureShown(config2[p1])
end