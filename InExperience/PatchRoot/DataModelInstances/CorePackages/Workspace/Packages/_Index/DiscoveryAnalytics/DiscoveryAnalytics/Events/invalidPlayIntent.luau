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
local var3 = tModule.strictInterface({
	universeId = tModule.string,
	playButtonState = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	pageName = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then tModule.optional(tModule.string) else nil
})

return function(p0, p1)
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref)
	local var4, var5 = var3(p1)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("InvalidPlayIntentInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p0,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p1 else {
			universeId = p1.universeId,
			playButtonState = p1.playButtonState,
			playabilityStatus = p1.playabilityStatus
		}
	})
end