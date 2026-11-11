local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameFavoriteThrottleHundrethsPercent = game:DefineFastInt("GameFavoriteThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	state = TModule.union(TModule.literal("on"), TModule.literal("off")),
	ctx = TModule.string,
	uid = TModule.string
})

return function(CustomFields, EventContext)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameFavoriteThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameFavoriteInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "favorite",
		description = "User has favorited/unfavorited a game",
		backends = { "EventIngest" },
		throttlingPercentage = GameFavoriteThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end