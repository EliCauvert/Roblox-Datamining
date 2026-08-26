local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	uid = tModule.string,
	ctx = tModule.string
})
local t = {
	eventName = "createPrivateGame",
	description = "User opened create private server flow from experience details overflow",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("GameCreatePrivateGameThrottleHundrethsPercent", 10000),
	lastUpdated = { 26, 4, 29 }
}
local list = { "addSessionInfo" }

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref), list (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameCreatePrivateGameInvalidInterface", var3)
	end
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = list,
		customFields = p1
	})
end