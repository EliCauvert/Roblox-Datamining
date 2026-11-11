local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameConnectionsPlayedChipClickedThrottleHundredthsPercent = game:DefineFastInt("GameConnectionsPlayedChipClickedThrottleHundredthsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	placeId = TModule.string,
	uid = TModule.string,
	totalConnections = TModule.number
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameConnectionsPlayedChipClickedThrottleHundredthsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameConnectionsPlayedChipClickedInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "gameConnectionsPlayedChipClicked",
		description = "User has clicked the connections played chip to open the user list",
		backends = { "EventIngest" },
		throttlingPercentage = GameConnectionsPlayedChipClickedThrottleHundredthsPercent,
		lastUpdated = { 26, 2, 10 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end