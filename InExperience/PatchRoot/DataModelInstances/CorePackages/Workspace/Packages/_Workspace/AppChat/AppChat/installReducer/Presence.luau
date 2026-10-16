local AppChat = script:FindFirstAncestor("AppChat")
local Llama = require(AppChat.Parent.LuaSocialLibrariesDeps).llama
local RoduxPresenceModule = require(AppChat.Http.RoduxPresence)

if require(AppChat.Flags.FFlagAppChatPresenceStoreMigration) then
	return nil
else
	local List = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }
	
	local function convertFromOldPresenceModel(p1) --[[ Line: 23 ]]
		-- upvalues: RoduxPresenceModule (copy), Llama (copy), List (copy)
		return RoduxPresenceModule.Actions.ReceivedUserPresence((RoduxPresenceModule.Models.Presence.new(Llama.Dictionary.join(p1, {
			presence = Llama.None,
			userPresenceType = (table.find(List, p1.presence) or 1) - 1,
			gameInstanceId = Llama.None,
			gameId = p1.gameInstanceId,
			lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(p1.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
		}))))
	end
	
	local config = {
		ReceivedUserPresence = function(p1) --[[ Line: 40 ]]
			-- upvalues: convertFromOldPresenceModel (copy)
			return if p1.payload then p1 else { convertFromOldPresenceModel(p1) }
		end
	}
	local InstallReducerResult = RoduxPresenceModule.installReducer()
	
	return function(p1, p2) --[[ Line: 51 ]]
		-- upvalues: config (copy), Llama (copy), InstallReducerResult (copy)
		local P2 = p1 or {
			byUserId = {},
			byGameId = {},
			byGameInstanceId = {},
			byPlaceId = {}
		}
		local list = { p2 }
		local Entry = config[p2.type]
		
		if Entry then
			list = Entry(p2)
		end
		return Llama.List.reduce(list, InstallReducerResult, P2)
	end
end