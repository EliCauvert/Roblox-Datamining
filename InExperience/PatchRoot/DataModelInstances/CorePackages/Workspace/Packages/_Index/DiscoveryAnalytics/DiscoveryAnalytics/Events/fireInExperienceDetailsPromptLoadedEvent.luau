local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppIedpSendPoints = require(parent.SharedFlags).FFlagLuaAppIedpSendPoints
local var2 = tModule.strictInterface({
	targetUniverseId = tModule.string,
	gameInfoRetrievalStatus = tModule.string,
	playabilityRetrievalStatus = tModule.string,
	targetRootPlaceId = tModule.optional(tModule.number),
	isPlayable = tModule.optional(tModule.boolean),
	playabilityStatus = tModule.optional(tModule.string),
	gameInfoErrorType = tModule.optional(tModule.string)
})
local t = {
	eventName = "inExperienceDetailsPromptLoaded",
	description = "Fires when the in-experience details prompt gameInfo and playability are loaded",
	backends = if fFlagLuaAppIedpSendPoints then { "EventIngest", "Points" } else { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("InExperienceDetailsPromptLoadedHundredthsPercent", 0),
	lastUpdated = if fFlagLuaAppIedpSendPoints then { 25, 11, 19 } else { 25, 11, 11 }
}

return function(p0) --[[ line: 30 | named "fireInExperienceDetailsPromptLoadedEvent" ]]
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("InExperienceDetailsPromptLoadedInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addUniverseId", "addOSInfo" },
		customFields = p0
	})
end