local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppIedpSendPoints = require(Parent.SharedFlags).FFlagLuaAppIedpSendPoints
local StrictInterfaceResult = TModule.strictInterface({
	targetUniverseId = TModule.string,
	targetRootPlaceId = TModule.optional(TModule.number),
	playabilityRetrievalStatus = TModule.optional(TModule.string)
})
local config = {
	eventName = "inExperienceDetailsPromptPlayButtonClicked",
	description = "Fires when the play button is clicked in the in-experience details prompt",
	backends = if FFlagLuaAppIedpSendPoints then { "EventIngest", "Points" } else { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("InExperienceDetailsPromptPlayClickedHundredthsPercent", 0),
	lastUpdated = if FFlagLuaAppIedpSendPoints then { 25, 11, 19 } else { 25, 11, 11 }
}

return function(CustomFields)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("InExperienceDetailsPromptPlayClickedInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addUniverseId", "addOSInfo" },
		customFields = CustomFields
	})
end