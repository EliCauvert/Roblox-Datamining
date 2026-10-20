local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	return (p1.roduxNetworking.POST("ActOnPartyNudge", function(Callback, p2)
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("act-on-party-nudge"):body({
			action = p2.action,
			nudgeId = p2.nudgeId,
			squadId = p2.squadId,
			leaveExisting = p2.leaveExisting,
			partyAttemptId = p2.partyAttemptId,
			squadLocation = p2.squadLocation,
			parentChannelId = p2.parentChannelId,
			universeId = if game.GameId > 0 then game.GameId else nil,
			placeId = if game.PlaceId > 0 then game.PlaceId else nil,
			gameInstanceId = if game.JobId == "" then nil else game.JobId
		})
	end))
end