local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameVoteThrottleHundrethsPercent = game:DefineFastInt("GameVoteThrottleHundrethsPercent", 0)
local var1 = tModule.strictInterface({
	placeId = tModule.string,
	vote = tModule.union(tModule.literal("UpVoted"), tModule.literal("DownVoted"), tModule.literal("NotVoted")),
	prevVote = tModule.union(tModule.literal("UpVoted"), tModule.literal("DownVoted"), tModule.literal("NotVoted")),
	uid = tModule.string
})

return function(p1, p2)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), gameVoteThrottleHundrethsPercent (ref), telemetryService (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameVoteInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "vote",
		description = "User has voted on a game",
		backends = { "EventIngest" },
		throttlingPercentage = gameVoteThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end