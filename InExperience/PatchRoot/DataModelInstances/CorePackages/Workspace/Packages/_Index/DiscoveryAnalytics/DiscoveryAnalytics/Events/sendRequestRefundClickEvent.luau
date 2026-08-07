local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var2 = tModule.strictInterface({ placeId = tModule.string })
local t = {
	eventName = "requestRefundClick",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("RequestRefundClickThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 24 }
}

return function(p0, p1) --[[ line: 23 ]]
	-- upvalues: discoveryEventErrorLogger (ref), var2 (ref), telemetryService (ref), t (ref)
	if type(p1) ~= "string" or p1 == "" then
		discoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", `string eventContext expected, got {type(p1)} with value {tostring(p1)}`)
	end
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("RequestRefundClickInvalidInterface", var5)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end