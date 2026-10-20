local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "openSearchResultsWithQueryDeeplink",
	description = "User opened Search Results via SDUI OpenSearchResultsWithQuery",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("OpenSearchResultsWithQueryDeeplinkEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 6, 17 }
}
local StrictInterfaceResult = TModule.strictInterface({ kwd = TModule.string, searchType = TModule.string })

return function(EventContext, CustomFields)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("OpenSearchResultsWithQueryDeeplinkInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end