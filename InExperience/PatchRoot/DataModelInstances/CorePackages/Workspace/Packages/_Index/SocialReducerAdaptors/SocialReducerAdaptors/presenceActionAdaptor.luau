local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1)
	-- upvalues: llama (ref)
	local var1 = function(p2)
		-- upvalues: p1 (ref), llama (copy)
		return p1.Actions.ReceivedUserPresence(p1.Models.Presence.new(llama.Dictionary.join(p2, {
			presence = llama.None,
			userPresenceType = (table.find({ "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }, p2.presence) or 1) - 1,
			gameInstanceId = llama.None,
			gameId = p2.gameInstanceId,
			lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p2.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z",
			type = llama.None
		})))
	end
	
	return {
		ReceivedUserPresence = function(p2)
			-- upvalues: var1 (ref)
			return if p2.payload then { p2 } else { var1(p2) }
		end
	}
end