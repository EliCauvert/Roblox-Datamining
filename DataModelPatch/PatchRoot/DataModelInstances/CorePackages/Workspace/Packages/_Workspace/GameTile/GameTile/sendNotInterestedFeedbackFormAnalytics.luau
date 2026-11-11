local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("GameTile").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppFixExplicitFeedbackTelemetry = require(Parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local StrictInterfaceResult = TModule.strictInterface({
	ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else TModule.string,
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

return function(CustomFields, p1)
	-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (copy), DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), TelemetryService (copy), config (copy)
	if FFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		DiscoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", "event is missing context")
	end
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = if FFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end