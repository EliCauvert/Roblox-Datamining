local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameConnectionsPlayedChipClickedThrottleHundredthsPercent = game:DefineFastInt("GameConnectionsPlayedChipClickedThrottleHundredthsPercent", 10000)
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	placeId = tModule.string,
	uid = tModule.string,
	totalConnections = tModule.number
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), gameConnectionsPlayedChipClickedThrottleHundredthsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameConnectionsPlayedChipClickedInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "gameConnectionsPlayedChipClicked",
		description = "User has clicked the connections played chip to open the user list",
		backends = { "EventIngest" },
		throttlingPercentage = gameConnectionsPlayedChipClickedThrottleHundredthsPercent,
		lastUpdated = { 26, 2, 10 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end