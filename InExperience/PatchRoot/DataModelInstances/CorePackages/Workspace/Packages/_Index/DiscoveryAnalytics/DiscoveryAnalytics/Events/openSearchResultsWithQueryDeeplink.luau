local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local t = {
	eventName = "openSearchResultsWithQueryDeeplink",
	description = "User opened Search Results via SDUI OpenSearchResultsWithQuery",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("OpenSearchResultsWithQueryDeeplinkEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 6, 17 }
}
local var1 = tModule.strictInterface({ kwd = tModule.string, searchType = tModule.string })

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("OpenSearchResultsWithQueryDeeplinkInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p2
	})
end