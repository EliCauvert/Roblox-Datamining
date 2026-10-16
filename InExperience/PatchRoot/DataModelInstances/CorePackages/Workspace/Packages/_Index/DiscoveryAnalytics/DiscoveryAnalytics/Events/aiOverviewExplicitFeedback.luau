local TelemetryService = game:GetService("TelemetryService")
local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local AiOverviewSentimentModule = require(DiscoveryAnalytics.Constants.AiOverviewSentiment)
local AiOverviewExplicitFeedbackThrottleHundrethsPercent = game:DefineFastInt("AiOverviewExplicitFeedbackThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	sentiment = TModule.union(TModule.literal(AiOverviewSentimentModule.ThumbsUp), TModule.literal(AiOverviewSentimentModule.ThumbsDown)),
	searchSessionId = TModule.string,
	query = TModule.string,
	didSubmit = TModule.boolean,
	feedbackText = TModule.optional(TModule.string)
})

return function(CustomFields, EventContext) --[[ Line: 28 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), AiOverviewExplicitFeedbackThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("AiOverviewExplicitFeedbackInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "aiOverviewExplicitFeedback",
		description = "User submitted or dismissed freeform text feedback on AI Overview",
		backends = { "EventIngest" },
		throttlingPercentage = AiOverviewExplicitFeedbackThrottleHundrethsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end