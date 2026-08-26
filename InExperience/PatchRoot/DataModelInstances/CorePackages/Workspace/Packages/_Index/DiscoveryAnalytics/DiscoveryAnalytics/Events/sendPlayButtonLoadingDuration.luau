local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local t = {
	eventName = "playButtonLoadingDuration",
	description = "Fires when a mounted Play Button leaves the Loading state.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppPlayButtonLoadingDurationTelemetryThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 12 }
}
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	durationMs = tModule.number,
	endReason = tModule.string,
	endPlayButtonState = tModule.optional(tModule.string),
	endPlayabilityStatus = tModule.optional(tModule.string),
	pageName = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("PlayButtonLoadingDurationInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p1
	})
end