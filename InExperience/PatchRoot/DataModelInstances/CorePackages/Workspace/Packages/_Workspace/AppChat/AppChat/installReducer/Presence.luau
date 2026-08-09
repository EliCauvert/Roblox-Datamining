local appChat = script:FindFirstAncestor("AppChat")
local llama = require(appChat.Parent.LuaSocialLibrariesDeps).llama
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local list = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p0) --[[ line: 17 ]]
	-- upvalues: roduxPresenceModule (ref), llama (ref), list (ref)
	return roduxPresenceModule.Actions.ReceivedUserPresence(roduxPresenceModule.Models.Presence.new(llama.Dictionary.join(p0, {
		presence = llama.None,
		userPresenceType = (table.find(list, p0.presence) or 1) - 1,
		gameInstanceId = llama.None,
		gameId = p0.gameInstanceId,
		lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p0.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
	})))
end

local t = {
	ReceivedUserPresence = function(p1) --[[ line: 34 ]]
		-- upvalues: convertFromOldPresenceModel (ref)
		return if p1.payload then p1 else { convertFromOldPresenceModel(p1) }
	end
}
local var5 = roduxPresenceModule.installReducer()

return function(p2, p3) --[[ line: 45 ]]
	-- upvalues: t (ref), llama (ref), var5 (ref)
	p2 = p2 or {
		byUserId = {},
		byGameId = {},
		byGameInstanceId = {},
		byPlaceId = {}
	}
	local list = { p3 }
	local type = t[p3.type]
	
	if type then
		list = type(p3)
	end
	return llama.List.reduce(list, var5, p2)
end