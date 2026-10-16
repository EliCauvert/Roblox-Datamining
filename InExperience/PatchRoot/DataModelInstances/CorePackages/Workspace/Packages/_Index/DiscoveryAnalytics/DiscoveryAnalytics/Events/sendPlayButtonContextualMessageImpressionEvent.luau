local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	playabilityStatus = TModule.optional(TModule.string),
	contextualMessage = TModule.string
})
local config = {
	eventName = "playButtonContextualMessageImpression",
	description = "Impressions for play button contextual message",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("PlayButtonContextualMessageImpressionHundredthsPercent", 10000),
	lastUpdated = { 26, 5, 6 }
}

return function(CustomFields, EventContext) --[[ Line: 23 | Named "sendPlayButtonContextualMessageImpressionEvent" ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("PlayButtonContextualMessageImpressionInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end