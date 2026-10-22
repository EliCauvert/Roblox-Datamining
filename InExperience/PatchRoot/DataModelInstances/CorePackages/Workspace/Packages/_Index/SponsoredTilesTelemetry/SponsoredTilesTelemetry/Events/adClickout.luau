local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("SponsoredTilesTelemetry").Parent
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "adClickout",
	description = "Fires when the user activates a sponsored ad clickout CTA",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/ads/ads_clickout_event.proto",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppAdClickoutEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 19 }
}
local StrictInterfaceResult = TModule.strictInterface({
	encryptedTrackingData = TModule.string,
	tileType = TModule.string,
	clickoutUrl = TModule.string
})

return function(EncryptedTrackingData, TileType, ClickoutUrl)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy), GetPlatformTargetFunction (copy)
	local CustomFields = {
		encryptedTrackingData = EncryptedTrackingData,
		tileType = TileType,
		clickoutUrl = ClickoutUrl
	}
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("AdClickoutInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields,
		legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
	})
end