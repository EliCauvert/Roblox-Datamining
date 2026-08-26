local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local t = {
	eventName = "showMoreClick",
	description = "User clicked the show more button to reveal additional rows in a home game grid",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppShowMoreClickEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 12 }
}
local var1 = tModule.strictInterface({
	topicId = tModule.string,
	sortIndex = tModule.number,
	previousVisibleRows = tModule.number,
	newVisibleRows = tModule.number,
	visibleRowsPerReveal = tModule.number,
	totalNumberOfRows = tModule.number
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("ShowMoreClickEventInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p2
	})
end