local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileDirectActionImpressedThrottleHundredthsPercent = game:DefineFastInt("GameTileDirectActionImpressedThrottleHundredthsPercent", 10000)
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionId = tModule.string,
	contentType = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), gameTileDirectActionImpressedThrottleHundredthsPercent (ref), telemetryService (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("GameTileDirectActionImpressedInvalidInterface", "event is missing context")
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameTileDirectActionImpressedInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "gameTileDirectActionImpressed",
		description = "A direct action on a Game Tile was shown",
		backends = { "EventIngest" },
		throttlingPercentage = gameTileDirectActionImpressedThrottleHundredthsPercent,
		lastUpdated = { 26, 8, 27 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo", "addOSInfo" },
		customFields = p1
	})
end