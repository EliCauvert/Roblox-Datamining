local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("UnifiedLogging").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "sduiFeedImpressions",
	description = "Feed-level section impressions for SDUI feed containers (e.g. SduiVerticalFeed)",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppFeedImpressionsHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 11 }
}
local StrictInterfaceResult = TModule.strictInterface({
	pageContext = TModule.string,
	feedItemPositions = TModule.string,
	feedCollectionIds = TModule.string,
	feedComponentTypes = TModule.string
})

return function(List, List1, List2, EventContext)
	-- upvalues: DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), TelemetryService (copy), config (copy)
	if #List == 0 then return end
	if #List ~= #List1 or #List ~= #List2 then
		DiscoveryEventErrorLogger.reportError("SendSduiFeedImpressionsArrayLengthMismatch", `feedItemPositions ({#List}), feedCollectionIds ({#List1}), and feedComponentTypes ({#List2}) must have equal length`, {
			feedItemPositionsCount = #List,
			feedCollectionIdsCount = #List1,
			feedComponentTypesCount = #List2
		})
		
		return
	end
	local CustomFields = {
		pageContext = EventContext,
		feedItemPositions = table.concat(List, ","),
		feedCollectionIds = table.concat(List1, ","),
		feedComponentTypes = table.concat(List2, ",")
	}
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if StrictInterfaceResultResult then
		TelemetryService:LogEvent(config, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = CustomFields
		})
		
		return
	else
		DiscoveryEventErrorLogger.reportError("SduiFeedImpressionsEventInvalidInterface", StrictInterfaceResultResult2)
	end
end