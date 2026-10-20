local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameDetailsSubpageThrottleHundrethsPercent = game:DefineFastInt("GameDetailsSubpageThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	placeId = TModule.string,
	subpage = TModule.string,
	action = TModule.optional(TModule.string),
	uid = TModule.string,
	ctx = TModule.string
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameDetailsSubpageThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameDetailsSubpageInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "gameDetailsSubpage",
		description = "User has navigated to a game details subpage",
		backends = { "EventIngest" },
		throttlingPercentage = GameDetailsSubpageThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end