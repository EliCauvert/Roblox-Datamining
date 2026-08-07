local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameDetailsSubpageThrottleHundrethsPercent = game:DefineFastInt("GameDetailsSubpageThrottleHundrethsPercent", 10000)
local var3 = tModule.strictInterface({
	universeId = tModule.string,
	placeId = tModule.string,
	subpage = tModule.string,
	action = tModule.optional(tModule.string),
	uid = tModule.string,
	ctx = tModule.string
})

return function(p0, p1) --[[ line: 20 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameDetailsSubpageThrottleHundrethsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameDetailsSubpageInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "gameDetailsSubpage",
		description = "User has navigated to a game details subpage",
		backends = { "EventIngest" },
		throttlingPercentage = gameDetailsSubpageThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end