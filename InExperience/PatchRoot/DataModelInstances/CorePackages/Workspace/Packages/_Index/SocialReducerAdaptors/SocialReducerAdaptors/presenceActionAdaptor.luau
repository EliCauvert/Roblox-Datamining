local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p0)
	-- upvalues: llama (ref)
	local var0 = function(p1)
		-- upvalues: p0 (ref), llama (copy)
		return p0.Actions.ReceivedUserPresence(p0.Models.Presence.new(llama.Dictionary.join(p1, {
			presence = llama.None,
			userPresenceType = (table.find({ "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }, p1.presence) or 1) - 1,
			gameInstanceId = llama.None,
			gameId = p1.gameInstanceId,
			lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p1.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z",
			type = llama.None
		})))
	end
	
	return {
		ReceivedUserPresence = function(p2)
			-- upvalues: var0 (ref)
			return if p2.payload then { p2 } else { var0(p2) }
		end
	}
end