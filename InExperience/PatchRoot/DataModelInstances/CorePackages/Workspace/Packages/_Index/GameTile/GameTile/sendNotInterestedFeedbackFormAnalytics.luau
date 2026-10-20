local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("GameTile").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	sortId = TModule.optional(TModule.string),
	actionType = TModule.string
})
local config = {
	eventName = "notInterestedFeedbackFormAction",
	description = "User has taken an action with the Not Interested Feedback Form",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("NotInterestedFeedbackFormActionThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 10, 22 }
}

return function(CustomFields, EventContext)
	-- upvalues: DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), TelemetryService (copy), config (copy)
	if not EventContext then
		DiscoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", "event is missing context")
	end
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end