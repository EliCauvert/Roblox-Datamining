local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileDirectActionActivatedThrottleHundredthsPercent = game:DefineFastInt("GameTileDirectActionActivatedThrottleHundredthsPercent", 10000)
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionId = tModule.string,
	contentType = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), gameTileDirectActionActivatedThrottleHundredthsPercent (ref), telemetryService (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("GameTileDirectActionActivatedInvalidInterface", "event is missing context")
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameTileDirectActionActivatedInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "gameTileDirectActionActivated",
		description = "A direct action on a Game Tile was activated",
		backends = { "EventIngest", "Points" },
		throttlingPercentage = gameTileDirectActionActivatedThrottleHundredthsPercent,
		lastUpdated = { 26, 8, 27 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo", "addOSInfo" },
		customFields = p1
	})
end