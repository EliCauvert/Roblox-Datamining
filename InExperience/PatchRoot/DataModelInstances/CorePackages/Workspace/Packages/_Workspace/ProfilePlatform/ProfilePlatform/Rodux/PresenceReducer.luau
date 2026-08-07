local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local presenceModule = require(profilePlatform.Rodux.Presence)
local list = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p0) --[[ line: 16 ]]
	-- upvalues: presenceModule (ref), cryoModule (ref), list (ref)
	return presenceModule.Actions.ReceivedUserPresence(presenceModule.Models.Presence.new(cryoModule.Dictionary.join(p0, {
		lastOnline = "",
		userPresenceType = (table.find(list, p0.presence) or 1) - 1,
		gameId = p0.gameInstanceId
	})))
end

local var5 = presenceModule.installReducer()

return function(p1, p2) --[[ line: 28 ]]
	-- upvalues: convertFromOldPresenceModel (ref), var5 (ref)
	if p2.type == "ReceivedUserPresence" and not p2.payload then
		p2 = convertFromOldPresenceModel(p2)
	end
	return var5(p1, p2)
end