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
local var3 = tModule.strictInterface({
	pos = tModule.optional(tModule.number),
	sortPos = tModule.optional(tModule.number),
	sortId = tModule.optional(tModule.string),
	queryText = tModule.string,
	componentType = tModule.string
})

return function(p0, p1) --[[ line: 35 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var3(p1)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("QuerySuggestionClickedInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p0,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p1
	})
end