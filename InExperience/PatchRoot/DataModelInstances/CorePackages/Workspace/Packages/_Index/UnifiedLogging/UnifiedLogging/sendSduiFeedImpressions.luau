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
local var3 = tModule.strictInterface({
	pageContext = tModule.string,
	feedItemPositions = tModule.string,
	feedCollectionIds = tModule.string,
	feedComponentTypes = tModule.string
})

return function(p0, p1, p2, p3)
	-- upvalues: discoveryEventErrorLogger (ref), var3 (ref), telemetryService (ref), t (ref)
	if #p0 == 0 then return end
	if #p0 ~= #p1 or #p0 ~= #p2 then
		discoveryEventErrorLogger.reportError("SendSduiFeedImpressionsArrayLengthMismatch", `feedItemPositions ({#p0}), feedCollectionIds ({#p1}), and feedComponentTypes ({#p2}) must have equal length`, {
			feedItemPositionsCount = #p0,
			feedCollectionIdsCount = #p1,
			feedComponentTypesCount = #p2
		})
		
		return
	end
	local t_1 = {
		pageContext = p3,
		feedItemPositions = table.concat(p0, ","),
		feedCollectionIds = table.concat(p1, ","),
		feedComponentTypes = table.concat(p2, ",")
	}
	local var5, var6 = var3(t_1)
	
	if var5 then
		telemetryService:LogEvent(t, {
			eventContext = p3,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = t_1
		})
		
		return
	end
	discoveryEventErrorLogger.reportError("SduiFeedImpressionsEventInvalidInterface", var6)
end