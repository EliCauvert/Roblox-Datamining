local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref)
	return p1.roduxNetworking.POST("ActOnPartyNudge", function(p2, p3)
		-- upvalues: SQUAD_URLModule (copy)
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("act-on-party-nudge"):body({
			action = p3.action,
			nudgeId = p3.nudgeId,
			squadId = p3.squadId,
			leaveExisting = p3.leaveExisting,
			partyAttemptId = p3.partyAttemptId,
			squadLocation = p3.squadLocation,
			parentChannelId = p3.parentChannelId,
			universeId = if game.GameId > 0 then game.GameId else nil,
			placeId = if game.PlaceId > 0 then game.PlaceId else nil,
			gameInstanceId = if game.JobId ~= "" then nil else game.JobId
		})
	end)
end