local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local roduxPresence = dependenciesModule.RoduxPresence
local list = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p0) --[[ line: 28 ]]
	-- upvalues: roduxPresence (ref), llama (ref), list (ref)
	return roduxPresence.Actions.ReceivedUserPresence(roduxPresence.Models.Presence.new(llama.Dictionary.join(p0, {
		presence = llama.None,
		userPresenceType = (table.find(list, p0.presence) or 1) - 1,
		gameInstanceId = llama.None,
		gameId = p0.gameInstanceId,
		lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p0.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
	})))
end

return {
	ReceivedUserPresence = function(p1) --[[ line: 45 ]]
		-- upvalues: convertFromOldPresenceModel (ref)
		return if p1.payload then p1 else { convertFromOldPresenceModel(p1) }
	end
}