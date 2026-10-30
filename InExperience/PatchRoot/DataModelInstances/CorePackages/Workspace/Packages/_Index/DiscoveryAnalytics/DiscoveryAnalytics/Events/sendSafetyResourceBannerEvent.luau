local TelemetryService = game:GetService("TelemetryService")
local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local SafetyResourceBannerActionModule = require(DiscoveryAnalytics.Constants.SafetyResourceBannerAction)
local config = {
	eventName = "safetyResourceBanner",
	description = "Impression or click on a search safety resource banner (e.g. SSH hotline, TVE diversion)",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SafetyResourceBannerEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 9 }
}
local StrictInterfaceResult = TModule.strictInterface({
	action = TModule.literal(SafetyResourceBannerActionModule.Impression, SafetyResourceBannerActionModule.LinkTapped, SafetyResourceBannerActionModule.Continue),
	moderationCategory = TModule.string,
	url = TModule.string,
	surface = TModule.string,
	textFilterRequestId = TModule.string
})

return function(CustomFields)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if StrictInterfaceResultResult then
		TelemetryService:LogEvent(config, {
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = CustomFields
		})
		
		return
	else
		DiscoveryEventErrorLogger.reportError("SafetyResourceBannerEventInvalidInterface", StrictInterfaceResultResult2)
	end
end