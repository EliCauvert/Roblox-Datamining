local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({ placeId = TModule.string })
local config = {
	eventName = "requestRefundClick",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("RequestRefundClickThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 24 }
}

return function(CustomFields, EventContext) --[[ Line: 23 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), TelemetryService (copy), config (copy)
	if type(EventContext) ~= "string" or EventContext == "" then
		DiscoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", `string eventContext expected, got {type(EventContext)} with value {tostring(EventContext)}`)
	end
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end