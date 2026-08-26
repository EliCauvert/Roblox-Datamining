local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameFavoriteThrottleHundrethsPercent = game:DefineFastInt("GameFavoriteThrottleHundrethsPercent", 10000)
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	state = tModule.union(tModule.literal("on"), tModule.literal("off")),
	ctx = tModule.string,
	uid = tModule.string
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), gameFavoriteThrottleHundrethsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameFavoriteInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "favorite",
		description = "User has favorited/unfavorited a game",
		backends = { "EventIngest" },
		throttlingPercentage = gameFavoriteThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end