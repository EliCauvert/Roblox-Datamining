local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "showMoreClick",
	description = "User clicked the show more button to reveal additional rows in a home game grid",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppShowMoreClickEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 12 }
}
local StrictInterfaceResult = TModule.strictInterface({
	topicId = TModule.string,
	sortIndex = TModule.number,
	previousVisibleRows = TModule.number,
	newVisibleRows = TModule.number,
	visibleRowsPerReveal = TModule.number,
	totalNumberOfRows = TModule.number
})

return function(EventContext, CustomFields)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("ShowMoreClickEventInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end