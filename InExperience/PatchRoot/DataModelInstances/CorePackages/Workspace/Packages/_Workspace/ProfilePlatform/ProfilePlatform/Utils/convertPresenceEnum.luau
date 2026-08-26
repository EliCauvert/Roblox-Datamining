local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local presenceType = require(profilePlatform.Rodux.Presence).Enums.PresenceType
local enumsModule = require(profilePlatform.Common.Enums)
local t = {
	[presenceType.Offline] = enumsModule.PresenceTypes.Offline,
	[presenceType.Online] = enumsModule.PresenceTypes.Online,
	[presenceType.InGame] = enumsModule.PresenceTypes.InGame,
	[presenceType.InStudio] = enumsModule.PresenceTypes.InStudio,
	Offline = enumsModule.PresenceTypes.Offline,
	Online = enumsModule.PresenceTypes.Online,
	InGame = enumsModule.PresenceTypes.InGame,
	InStudio = enumsModule.PresenceTypes.InStudio
}

return function(p1, p2)
	-- upvalues: t (ref), enumsModule (ref)
	local var1 = t[p1] or enumsModule.PresenceTypes.Offline
	
	return if var1 == enumsModule.PresenceTypes.InGame and p2 == nil then enumsModule.PresenceTypes.Online else var1
end