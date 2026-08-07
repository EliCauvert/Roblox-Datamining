local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppIedpSendPoints = require(parent.SharedFlags).FFlagLuaAppIedpSendPoints
local var2 = tModule.strictInterface({
	targetUniverseId = tModule.string,
	closeReason = tModule.string,
	isFullyLoaded = tModule.boolean,
	targetRootPlaceId = tModule.optional(tModule.number),
	gameInfoErrorType = tModule.optional(tModule.string),
	isPlayable = tModule.optional(tModule.boolean),
	playabilityStatus = tModule.optional(tModule.string)
})
local t = {
	eventName = "inExperienceDetailsPromptClosed",
	description = "Fires when the in-experience details prompt is closed",
	backends = if fFlagLuaAppIedpSendPoints then { "EventIngest", "Points" } else { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("InExperienceDetailsPromptClosedHundredthsPercent", 0),
	lastUpdated = if fFlagLuaAppIedpSendPoints then { 25, 11, 19 } else { 25, 11, 11 }
}

return function(p0) --[[ line: 30 | named "fireInExperienceDetailsPromptClosedEvent" ]]
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("InExperienceDetailsPromptClosedInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addUniverseId", "addOSInfo" },
		customFields = p0
	})
end