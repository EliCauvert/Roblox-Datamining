local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppIedpSendPoints = require(parent.SharedFlags).FFlagLuaAppIedpSendPoints
local var1 = tModule.strictInterface({ targetUniverseId = tModule.string })
local t = {
	eventName = "inExperienceDetailsPromptOpened",
	description = "Fires when the in-experience details prompt is opened",
	backends = if fFlagLuaAppIedpSendPoints then { "EventIngest", "Points" } else { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("InExperienceDetailsPromptOpenedHundredthsPercent", 0),
	lastUpdated = if fFlagLuaAppIedpSendPoints then { 25, 11, 19 } else { 25, 11, 11 }
}

return function(p1)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("InExperienceDetailsPromptOpenedInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addUniverseId", "addOSInfo" },
		customFields = p1
	})
end