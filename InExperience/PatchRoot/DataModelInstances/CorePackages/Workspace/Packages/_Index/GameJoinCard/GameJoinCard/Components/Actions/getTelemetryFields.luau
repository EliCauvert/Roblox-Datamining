local FFlagGameJoinCardAnalyticsCardId = require(script:FindFirstAncestor("GameJoinCard").Parent.SharedFlags).FFlagGameJoinCardAnalyticsCardId
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: FFlagGameJoinCardAnalyticsCardId (copy)
	local Telemetry = p1.telemetry
	local UniverseId = Telemetry.universeId
	
	return {
		friendId = p1.userId,
		universeId = if UniverseId == nil or UniverseId == "" then nil else UniverseId,
		absolutePosition = Telemetry.absolutePosition,
		joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then Telemetry.joinGameCardId else nil
	}
end