local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameFollowThrottleHundrethsPercent = game:DefineFastInt("GameFollowThrottleHundrethsPercent", 10000)
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	state = TModule.union(TModule.literal("on"), TModule.literal("off")),
	ctx = TModule.string,
	uid = TModule.string,
	universeId = if require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents then TModule.optional(TModule.string) else nil
})

return function(CustomFields, EventContext) --[[ Line: 21 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameFollowThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameFollowInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "follow",
		description = "User has followed/unfollowed a game",
		backends = { "EventIngest" },
		throttlingPercentage = GameFollowThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end