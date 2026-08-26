local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("UnifiedLogging").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local t = {
	eventName = "sduiFeedImpressions",
	description = "Feed-level section impressions for SDUI feed containers (e.g. SduiVerticalFeed)",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppFeedImpressionsHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 11 }
}
local var1 = tModule.strictInterface({
	pageContext = tModule.string,
	feedItemPositions = tModule.string,
	feedCollectionIds = tModule.string,
	feedComponentTypes = tModule.string
})

return function(p1, p2, p3, p4)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), telemetryService (ref), t (ref)
	if #p1 == 0 then return end
	if #p1 ~= #p2 or #p1 ~= #p3 then
		discoveryEventErrorLogger.reportError("SendSduiFeedImpressionsArrayLengthMismatch", `feedItemPositions ({#p1}), feedCollectionIds ({#p2}), and feedComponentTypes ({#p3}) must have equal length`, {
			feedItemPositionsCount = #p1,
			feedCollectionIdsCount = #p2,
			feedComponentTypesCount = #p3
		})
		
		return
	end
	local t_1 = {
		pageContext = p4,
		feedItemPositions = table.concat(p1, ","),
		feedCollectionIds = table.concat(p2, ","),
		feedComponentTypes = table.concat(p3, ",")
	}
	local var2, var3 = var1(t_1)
	
	if var2 then
		telemetryService:LogEvent(t, {
			eventContext = p4,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = t_1
		})
		
		return
	end
	discoveryEventErrorLogger.reportError("SduiFeedImpressionsEventInvalidInterface", var3)
end