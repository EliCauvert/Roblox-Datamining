local telemetryService = game:GetService("TelemetryService")
local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local aiOverviewSentimentModule = require(discoveryAnalytics.Constants.AiOverviewSentiment)
local aiOverviewSentimentThrottleHundrethsPercent = game:DefineFastInt("AiOverviewSentimentThrottleHundrethsPercent", 10000)
local var5 = tModule.strictInterface({
	sentiment = tModule.union(tModule.literal(aiOverviewSentimentModule.ThumbsUp), tModule.literal(aiOverviewSentimentModule.ThumbsDown)),
	searchSessionId = tModule.string,
	query = tModule.string,
	universeIds = tModule.optional(tModule.string)
})

return function(p0, p1) --[[ line: 26 ]]
	-- upvalues: var5 (ref), discoveryEventErrorLogger (ref), aiOverviewSentimentThrottleHundrethsPercent (ref), telemetryService (ref)
	local var6, var7 = var5(p0)
	
	if not var6 then
		discoveryEventErrorLogger.reportError("AiOverviewSentimentInvalidInterface", var7)
	end
	telemetryService:LogEvent({
		eventName = "aiOverviewSentiment",
		description = "User tapped thumbs up or down on AI Overview card",
		backends = { "EventIngest" },
		throttlingPercentage = aiOverviewSentimentThrottleHundrethsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end