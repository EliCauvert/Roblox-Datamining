local telemetryService = game:GetService("TelemetryService")
local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local aiOverviewSentimentModule = require(discoveryAnalytics.Constants.AiOverviewSentiment)
local aiOverviewSentimentThrottleHundrethsPercent = game:DefineFastInt("AiOverviewSentimentThrottleHundrethsPercent", 10000)
local var1 = tModule.strictInterface({
	sentiment = tModule.union(tModule.literal(aiOverviewSentimentModule.ThumbsUp), tModule.literal(aiOverviewSentimentModule.ThumbsDown)),
	searchSessionId = tModule.string,
	query = tModule.string,
	universeIds = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), aiOverviewSentimentThrottleHundrethsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("AiOverviewSentimentInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "aiOverviewSentiment",
		description = "User tapped thumbs up or down on AI Overview card",
		backends = { "EventIngest" },
		throttlingPercentage = aiOverviewSentimentThrottleHundrethsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end