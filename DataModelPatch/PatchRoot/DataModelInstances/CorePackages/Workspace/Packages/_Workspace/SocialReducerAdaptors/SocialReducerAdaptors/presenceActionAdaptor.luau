local Llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1)
	-- upvalues: Llama (copy)
	local function v1(p2)
		-- upvalues: p1 (copy), Llama (upval)
		return p1.Actions.ReceivedUserPresence((p1.Models.Presence.new(Llama.Dictionary.join(p2, {
			presence = Llama.None,
			userPresenceType = (table.find({ "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }, p2.presence) or 1) - 1,
			gameInstanceId = Llama.None,
			gameId = p2.gameInstanceId,
			lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p2.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z",
			type = Llama.None
		}))))
	end
	
	return {
		ReceivedUserPresence = function(p2)
			-- upvalues: v1 (copy)
			return if p2.payload then { p2 } else { v1(p2) }
		end
	}
end