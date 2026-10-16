local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local PresenceType = require(ProfilePlatform.Rodux.Presence).Enums.PresenceType
local EnumsModule = require(ProfilePlatform.Common.Enums)
local config = {
	[PresenceType.Offline] = EnumsModule.PresenceTypes.Offline,
	[PresenceType.Online] = EnumsModule.PresenceTypes.Online,
	[PresenceType.InGame] = EnumsModule.PresenceTypes.InGame,
	[PresenceType.InStudio] = EnumsModule.PresenceTypes.InStudio,
	Offline = EnumsModule.PresenceTypes.Offline,
	Online = EnumsModule.PresenceTypes.Online,
	InGame = EnumsModule.PresenceTypes.InGame,
	InStudio = EnumsModule.PresenceTypes.InStudio
}

return function(p1, p2) --[[ Line: 18 ]]
	-- upvalues: config (copy), EnumsModule (copy)
	local Entry = config[p1] or EnumsModule.PresenceTypes.Offline
	
	return if Entry == EnumsModule.PresenceTypes.InGame and p2 == nil then EnumsModule.PresenceTypes.Online else Entry
end