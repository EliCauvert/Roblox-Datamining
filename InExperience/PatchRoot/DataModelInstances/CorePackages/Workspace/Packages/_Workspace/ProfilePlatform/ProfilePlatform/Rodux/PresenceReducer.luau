local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local presenceModule = require(profilePlatform.Rodux.Presence)
local list = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p1)
	-- upvalues: presenceModule (ref), cryoModule (ref), list (ref)
	return presenceModule.Actions.ReceivedUserPresence(presenceModule.Models.Presence.new(cryoModule.Dictionary.join(p1, {
		lastOnline = "",
		userPresenceType = (table.find(list, p1.presence) or 1) - 1,
		gameId = p1.gameInstanceId
	})))
end

local var1 = presenceModule.installReducer()

return function(p1, p2)
	-- upvalues: convertFromOldPresenceModel (ref), var1 (ref)
	if p2.type == "ReceivedUserPresence" and not p2.payload then
		p2 = convertFromOldPresenceModel(p2)
	end
	return var1(p1, p2)
end