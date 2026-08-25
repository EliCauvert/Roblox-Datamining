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
local var3 = tModule.strictInterface({
	universeId = tModule.string,
	durationMs = tModule.number,
	endReason = tModule.string,
	endPlayButtonState = tModule.optional(tModule.string),
	endPlayabilityStatus = tModule.optional(tModule.string),
	pageName = tModule.optional(tModule.string)
})

return function(p0, p1)
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("PlayButtonLoadingDurationInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p0
	})
end