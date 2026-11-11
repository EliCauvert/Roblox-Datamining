local TelemetryService = game:GetService("TelemetryService")
local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local AiOverviewSentimentModule = require(DiscoveryAnalytics.Constants.AiOverviewSentiment)
local AiOverviewSentimentThrottleHundrethsPercent = game:DefineFastInt("AiOverviewSentimentThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	sentiment = TModule.union(TModule.literal(AiOverviewSentimentModule.ThumbsUp), TModule.literal(AiOverviewSentimentModule.ThumbsDown)),
	searchSessionId = TModule.string,
	query = TModule.string,
	universeIds = TModule.optional(TModule.string)
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), AiOverviewSentimentThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("AiOverviewSentimentInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "aiOverviewSentiment",
		description = "User tapped thumbs up or down on AI Overview card",
		backends = { "EventIngest" },
		throttlingPercentage = AiOverviewSentimentThrottleHundrethsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end