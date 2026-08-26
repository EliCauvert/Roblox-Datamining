local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local t = {
	eventName = "invalidPlayIntent",
	description = "Fires when the user clicks on a Play Button that is in an invalid state to play (i.e. Loading)",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppInvalidPlayIntentThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 18 }
}
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	playButtonState = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then tModule.optional(tModule.string) else nil
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("InvalidPlayIntentInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p2 else {
			universeId = p2.universeId,
			playButtonState = p2.playButtonState,
			playabilityStatus = p2.playabilityStatus
		}
	})
end