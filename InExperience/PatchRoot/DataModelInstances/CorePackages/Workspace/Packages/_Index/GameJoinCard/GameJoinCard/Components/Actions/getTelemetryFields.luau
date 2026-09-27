local fFlagGameJoinCardAnalyticsCardId = require(script:FindFirstAncestor("GameJoinCard").Parent.SharedFlags).FFlagGameJoinCardAnalyticsCardId
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: fFlagGameJoinCardAnalyticsCardId (ref)
	local telemetry = p1.telemetry
	local universeId = telemetry.universeId
	
	return {
		friendId = p1.userId,
		universeId = if universeId == nil or universeId == "" then nil else universeId,
		absolutePosition = telemetry.absolutePosition,
		joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then telemetry.joinGameCardId else nil
	}
end