local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var2 = tModule.strictInterface({
	universeId = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	contextualMessage = tModule.string
})
local t = {
	eventName = "playButtonContextualMessageImpression",
	description = "Impressions for play button contextual message",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("PlayButtonContextualMessageImpressionHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 6 }
}

return function(p0, p1) --[[ line: 23 | named "sendPlayButtonContextualMessageImpressionEvent" ]]
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("PlayButtonContextualMessageImpressionInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p0
	})
end