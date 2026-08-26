local appChat = script:FindFirstAncestor("AppChat")
local llama = require(appChat.Parent.LuaSocialLibrariesDeps).llama
local roduxPresenceModule = require(appChat.Http.RoduxPresence)

if require(appChat.Flags.FFlagAppChatPresenceStoreMigration) then
	return nil
end
local list = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p1)
	-- upvalues: roduxPresenceModule (ref), llama (ref), list (ref)
	return roduxPresenceModule.Actions.ReceivedUserPresence(roduxPresenceModule.Models.Presence.new(llama.Dictionary.join(p1, {
		presence = llama.None,
		userPresenceType = (table.find(list, p1.presence) or 1) - 1,
		gameInstanceId = llama.None,
		gameId = p1.gameInstanceId,
		lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p1.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
	})))
end

local t = {
	ReceivedUserPresence = function(p1)
		-- upvalues: convertFromOldPresenceModel (ref)
		return if p1.payload then p1 else { convertFromOldPresenceModel(p1) }
	end
}
local var1 = roduxPresenceModule.installReducer()

return function(p1, p2)
	-- upvalues: t (ref), llama (ref), var1 (ref)
	p1 = p1 or {
		byUserId = {},
		byGameId = {},
		byGameInstanceId = {},
		byPlaceId = {}
	}
	local list = { p2 }
	local type = t[p2.type]
	
	if type then
		list = type(p2)
	end
	return llama.List.reduce(list, var1, p1)
end