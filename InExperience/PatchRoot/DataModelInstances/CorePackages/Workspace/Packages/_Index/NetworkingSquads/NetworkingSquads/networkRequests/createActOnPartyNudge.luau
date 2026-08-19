local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	return p0.roduxNetworking.POST("ActOnPartyNudge", function(p1, p2) --[[ line: 10 ]]
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("act-on-party-nudge"):body({
			action = p2.action,
			nudgeId = p2.nudgeId,
			squadId = p2.squadId,
			leaveExisting = p2.leaveExisting,
			partyAttemptId = p2.partyAttemptId,
			squadLocation = p2.squadLocation,
			parentChannelId = p2.parentChannelId,
			universeId = if game.GameId > 0 then game.GameId else nil,
			placeId = if game.PlaceId > 0 then game.PlaceId else nil,
			gameInstanceId = if game.JobId ~= "" then nil else game.JobId
		})
	end)
end