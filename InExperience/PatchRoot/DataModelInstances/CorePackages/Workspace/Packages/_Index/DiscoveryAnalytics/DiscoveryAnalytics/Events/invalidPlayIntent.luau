local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local config = {
	eventName = "invalidPlayIntent",
	description = "Fires when the user clicks on a Play Button that is in an invalid state to play (i.e. Loading)",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppInvalidPlayIntentThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 18 }
}
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	playButtonState = TModule.string,
	playabilityStatus = TModule.optional(TModule.string),
	pageName = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then TModule.optional(TModule.string) else nil
})

return function(EventContext, p1) --[[ Line: 30 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("InvalidPlayIntentInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then p1 else {
			universeId = p1.universeId,
			playButtonState = p1.playButtonState,
			playabilityStatus = p1.playabilityStatus
		}
	})
end