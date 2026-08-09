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
local var3 = tModule.strictInterface({ kwd = tModule.string, searchType = tModule.string })

return function(p0, p1) --[[ line: 24 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var3(p1)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("OpenSearchResultsWithQueryDeeplinkInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p0,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p1
	})
end