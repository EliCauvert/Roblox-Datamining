local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama
local RoduxPresence = DependenciesModule.RoduxPresence
local List = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p1)
	-- upvalues: RoduxPresence (copy), Llama (copy), List (copy)
	return RoduxPresence.Actions.ReceivedUserPresence((RoduxPresence.Models.Presence.new(Llama.Dictionary.join(p1, {
		presence = Llama.None,
		userPresenceType = (table.find(List, p1.presence) or 1) - 1,
		gameInstanceId = Llama.None,
		gameId = p1.gameInstanceId,
		lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p1.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
	}))))
end

return {
	ReceivedUserPresence = function(p1)
		-- upvalues: convertFromOldPresenceModel (copy)
		return if p1.payload then p1 else { convertFromOldPresenceModel(p1) }
	end
}