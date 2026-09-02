local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("GameTile").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionType = tModule.string
})
local t = {
	eventName = "notInterestedFeedbackFormAction",
	description = "User has taken an action with the Not Interested Feedback Form",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("NotInterestedFeedbackFormActionThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 10, 22 }
}

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), telemetryService (ref), t (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", "event is missing context")
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("NotInterestedFeedbackFormActionInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end