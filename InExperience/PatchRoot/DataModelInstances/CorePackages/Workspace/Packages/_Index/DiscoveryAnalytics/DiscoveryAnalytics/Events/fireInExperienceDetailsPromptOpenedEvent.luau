local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppIedpSendPoints = require(Parent.SharedFlags).FFlagLuaAppIedpSendPoints
local StrictInterfaceResult = TModule.strictInterface({ targetUniverseId = TModule.string })
local config = {
	eventName = "inExperienceDetailsPromptOpened",
	description = "Fires when the in-experience details prompt is opened",
	backends = if FFlagLuaAppIedpSendPoints then { "EventIngest", "Points" } else { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("InExperienceDetailsPromptOpenedHundredthsPercent", 0),
	lastUpdated = if FFlagLuaAppIedpSendPoints then { 25, 11, 19 } else { 25, 11, 11 }
}

return function(CustomFields) --[[ Line: 24 | Named "fireInExperienceDetailsPromptOpenedEvent" ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("InExperienceDetailsPromptOpenedInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addUniverseId", "addOSInfo" },
		customFields = CustomFields
	})
end