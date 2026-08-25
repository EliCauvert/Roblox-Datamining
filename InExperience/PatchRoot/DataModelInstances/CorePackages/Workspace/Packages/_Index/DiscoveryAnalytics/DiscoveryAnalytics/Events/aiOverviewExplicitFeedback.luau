local telemetryService = game:GetService("TelemetryService")
local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local aiOverviewSentimentModule = require(discoveryAnalytics.Constants.AiOverviewSentiment)
local aiOverviewExplicitFeedbackThrottleHundrethsPercent = game:DefineFastInt("AiOverviewExplicitFeedbackThrottleHundrethsPercent", 10000)
local var5 = tModule.strictInterface({
	sentiment = tModule.union(tModule.literal(aiOverviewSentimentModule.ThumbsUp), tModule.literal(aiOverviewSentimentModule.ThumbsDown)),
	searchSessionId = tModule.string,
	query = tModule.string,
	didSubmit = tModule.boolean,
	feedbackText = tModule.optional(tModule.string)
})

return function(p0, p1)
	-- upvalues: var5 (ref), discoveryEventErrorLogger (ref), aiOverviewExplicitFeedbackThrottleHundrethsPercent (ref), telemetryService (ref)
	local var6, var7 = var5(p0)
	
	if not var6 then
		discoveryEventErrorLogger.reportError("AiOverviewExplicitFeedbackInvalidInterface", var7)
	end
	telemetryService:LogEvent({
		eventName = "aiOverviewExplicitFeedback",
		description = "User submitted or dismissed freeform text feedback on AI Overview",
		backends = { "EventIngest" },
		throttlingPercentage = aiOverviewExplicitFeedbackThrottleHundrethsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end