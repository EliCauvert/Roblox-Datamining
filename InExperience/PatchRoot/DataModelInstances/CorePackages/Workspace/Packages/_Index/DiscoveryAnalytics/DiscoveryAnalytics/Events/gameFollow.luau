local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameFollowThrottleHundrethsPercent = game:DefineFastInt("GameFollowThrottleHundrethsPercent", 10000)
local var3 = tModule.strictInterface({
	placeId = tModule.string,
	state = tModule.union(tModule.literal("on"), tModule.literal("off")),
	ctx = tModule.string,
	uid = tModule.string
})

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameFollowThrottleHundrethsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameFollowInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "follow",
		description = "User has followed/unfollowed a game",
		backends = { "EventIngest" },
		throttlingPercentage = gameFollowThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end