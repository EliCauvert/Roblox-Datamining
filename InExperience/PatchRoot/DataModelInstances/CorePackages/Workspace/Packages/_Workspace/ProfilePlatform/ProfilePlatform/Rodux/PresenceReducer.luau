local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local CryoModule = require(ProfilePlatform.Parent.Cryo)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local List = { "OFFLINE", "ONLINE", "IN_GAME", "IN_STUDIO" }

local function convertFromOldPresenceModel(p1) --[[ Line: 16 ]]
	-- upvalues: PresenceModule (copy), CryoModule (copy), List (copy)
	return PresenceModule.Actions.ReceivedUserPresence((PresenceModule.Models.Presence.new(CryoModule.Dictionary.join(p1, {
		lastOnline = "",
		userPresenceType = (table.find(List, p1.presence) or 1) - 1,
		gameId = p1.gameInstanceId
	}))))
end

local InstallReducerResult = PresenceModule.installReducer()

return function(p1, p2) --[[ Line: 28 ]]
	-- upvalues: convertFromOldPresenceModel (copy), InstallReducerResult (copy)
	if p2.type == "ReceivedUserPresence" and not p2.payload then
		p2 = convertFromOldPresenceModel(p2)
	end
	return InstallReducerResult(p1, p2)
end