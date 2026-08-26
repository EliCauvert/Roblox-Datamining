local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local t = {
	eventName = "querySuggestionClicked",
	description = "User clicked a query suggestion",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("QuerySuggestionClickedEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 8, 13 }
}
local var1 = tModule.strictInterface({
	pos = tModule.optional(tModule.number),
	sortPos = tModule.optional(tModule.number),
	sortId = tModule.optional(tModule.string),
	queryText = tModule.string,
	componentType = tModule.string
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("QuerySuggestionClickedInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p2
	})
end