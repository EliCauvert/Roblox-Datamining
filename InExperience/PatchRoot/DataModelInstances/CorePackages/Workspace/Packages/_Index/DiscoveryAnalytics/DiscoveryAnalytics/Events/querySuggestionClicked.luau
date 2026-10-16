local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "querySuggestionClicked",
	description = "User clicked a query suggestion",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("QuerySuggestionClickedEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 8, 13 }
}
local StrictInterfaceResult = TModule.strictInterface({
	pos = TModule.optional(TModule.number),
	sortPos = TModule.optional(TModule.number),
	sortId = TModule.optional(TModule.string),
	queryText = TModule.string,
	componentType = TModule.string
})

return function(EventContext, CustomFields) --[[ Line: 35 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("QuerySuggestionClickedInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end