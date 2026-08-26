local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({
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

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("PlayButtonContextualMessageImpressionInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p1
	})
end