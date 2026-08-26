local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({ placeId = tModule.string })
local t = {
	eventName = "requestRefundClick",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("RequestRefundClickThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 24 }
}

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), telemetryService (ref), t (ref)
	if type(p2) ~= "string" or p2 == "" then
		discoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", `string eventContext expected, got {type(p2)} with value {tostring(p2)}`)
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end