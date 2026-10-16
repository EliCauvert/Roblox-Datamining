local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameVoteThrottleHundrethsPercent = game:DefineFastInt("GameVoteThrottleHundrethsPercent", 0)
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	vote = TModule.union(TModule.literal("UpVoted"), TModule.literal("DownVoted"), TModule.literal("NotVoted")),
	prevVote = TModule.union(TModule.literal("UpVoted"), TModule.literal("DownVoted"), TModule.literal("NotVoted")),
	uid = TModule.string,
	universeId = if require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents then TModule.optional(TModule.string) else nil
})

return function(CustomFields, EventContext) --[[ Line: 21 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), GameVoteThrottleHundrethsPercent (copy), TelemetryService (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameVoteInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "vote",
		description = "User has voted on a game",
		backends = { "EventIngest" },
		throttlingPercentage = GameVoteThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end