local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameVoteThrottleHundrethsPercent = game:DefineFastInt("GameVoteThrottleHundrethsPercent", 0)
local var3 = tModule.strictInterface({
	placeId = tModule.string,
	vote = tModule.union(tModule.literal("UpVoted"), tModule.literal("DownVoted"), tModule.literal("NotVoted")),
	prevVote = tModule.union(tModule.literal("UpVoted"), tModule.literal("DownVoted"), tModule.literal("NotVoted")),
	uid = tModule.string
})

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: var3 (ref), discoveryEventErrorLogger (ref), gameVoteThrottleHundrethsPercent (ref), telemetryService (ref)
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameVoteInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "vote",
		description = "User has voted on a game",
		backends = { "EventIngest" },
		throttlingPercentage = gameVoteThrottleHundrethsPercent,
		lastUpdated = { 25, 11, 11 }
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end