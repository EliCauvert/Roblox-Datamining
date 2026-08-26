local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameDetailsSubpageThrottleHundrethsPercent = game:DefineFastInt("GameDetailsSubpageThrottleHundrethsPercent", 10000)
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	placeId = tModule.string,
	subpage = tModule.string,
	action = tModule.optional(tModule.string),
	uid = tModule.string,
	ctx = tModule.string
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), gameDetailsSubpageThrottleHundrethsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameDetailsSubpageInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "gameDetailsSubpage",
		description = "User has navigated to a game details subpage",
		backends = { "EventIngest" },
		throttlingPercentage = gameDetailsSubpageThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end