local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameConnectionsPlayedChipClickedThrottleHundredthsPercent = game:DefineFastInt("GameConnectionsPlayedChipClickedThrottleHundredthsPercent", 10000)
local var3 = tModule.strictInterface({
	universeId = tModule.string,
	placeId = tModule.string,
	uid = tModule.string,
	totalConnections = tModule.number
})

return function(p0, p1) --[[ line: 18 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameConnectionsPlayedChipClickedThrottleHundredthsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameConnectionsPlayedChipClickedInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "gameConnectionsPlayedChipClicked",
		description = "User has clicked the connections played chip to open the user list",
		backends = { "EventIngest" },
		throttlingPercentage = gameConnectionsPlayedChipClickedThrottleHundredthsPercent,
		lastUpdated = { 26, 2, 10 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end