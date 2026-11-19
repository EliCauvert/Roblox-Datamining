local LocalizationService = game:GetService("LocalizationService")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local CloudPlayTelemetryModule = require(InExperienceCloudPlay.CloudPlayTelemetry)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local FFlagLuaAppCloudClientRobloxRealityNameParamModule = require(InExperienceCloudPlay.Flags.FFlagLuaAppCloudClientRobloxRealityNameParam)
local FStringLuaAppCloudClientRobloxRealityNameModule = require(InExperienceCloudPlay.Flags.FStringLuaAppCloudClientRobloxRealityName)
local CloudPlayUnsupportedFeatureSnackbarSeconds = game:DefineFastInt("CloudPlayUnsupportedFeatureSnackbarSeconds", 4)
local config = {
	Captures = "Feature.CloudClient.Label.CaptureUnavailableCloudPlay",
	SelfView = "Feature.CloudClient.Label.SelfViewUnavailableCloudPlay"
}
local config1 = {
	Captures = "Feature.CloudClient.Label.CaptureUnavailableRobloxReality",
	SelfView = "Feature.CloudClient.Label.SelfViewUnavailableRobloxReality"
}
local config2 = {
	Captures = "Feature.CloudClient.Label.CaptureUnavailableRobloxRealityV2",
	SelfView = "Feature.CloudClient.Label.SelfViewUnavailableRobloxRealityV2"
}
local config3 = { Captures = "capture", SelfView = "self_view" }

return function(p1)
	-- upvalues: GetCloudClientServiceModule (copy), config1 (copy), config (copy), InExperienceLocalesModule (copy), LocalizationService (copy), TransientUIOverlayModule (copy), FFlagLuaAppCloudClientRobloxRealityNameParamModule (copy), config2 (copy), FStringLuaAppCloudClientRobloxRealityNameModule (copy), FoundationModule (copy), CloudPlayUnsupportedFeatureSnackbarSeconds (copy), CloudPlayTelemetryModule (copy), config3 (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	local Config = if CloudClientServiceModule and CloudClientServiceModule.IsRobloxRealityEnvironment then config1 else config
	local NewResult = InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	TransientUIOverlayModule.displaySnackbar({
		kind = "snackbar",
		title = if FFlagLuaAppCloudClientRobloxRealityNameParamModule and Config == config1 then NewResult:Format(config2[p1], {
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		}) else NewResult:Format(Config[p1]),
		icon = FoundationModule.Enums.IconName.TriangleExclamation
	}, CloudPlayUnsupportedFeatureSnackbarSeconds)
	CloudPlayTelemetryModule.logUnsupportedFeatureShown(config3[p1])
end