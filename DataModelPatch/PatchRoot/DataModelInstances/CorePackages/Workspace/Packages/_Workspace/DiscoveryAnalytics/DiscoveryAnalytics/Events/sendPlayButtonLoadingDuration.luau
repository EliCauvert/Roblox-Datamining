local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "playButtonLoadingDuration",
	description = "Fires when a mounted Play Button leaves the Loading state.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppPlayButtonLoadingDurationTelemetryThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 12 }
}
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	durationMs = TModule.number,
	endReason = TModule.string,
	endPlayButtonState = TModule.optional(TModule.string),
	endPlayabilityStatus = TModule.optional(TModule.string),
	pageName = TModule.optional(TModule.string)
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("PlayButtonLoadingDurationInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end