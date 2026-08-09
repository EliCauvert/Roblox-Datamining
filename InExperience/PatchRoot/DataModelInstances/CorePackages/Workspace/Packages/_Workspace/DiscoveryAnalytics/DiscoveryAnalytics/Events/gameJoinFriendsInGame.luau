local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var2 = tModule.strictInterface({
	placeId = tModule.string,
	uid = tModule.string,
	ctx = tModule.string
})
local t = {
	eventName = "joinFriendsInGame",
	description = "User joined friends in game from experience details overflow",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("GameJoinFriendsInGameThrottleHundrethsPercent", 10000),
	lastUpdated = { 26, 4, 29 }
}
local list = { "addSessionInfo" }

return function(p0, p1) --[[ line: 29 ]]
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref), list (ref)
	local var5, var6 = var2(p0)
	
	if not var5 then
		discoveryEventErrorLogger.reportError("GameJoinFriendsInGameInvalidInterface", var6)
	end
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = list,
		customFields = p0
	})
end