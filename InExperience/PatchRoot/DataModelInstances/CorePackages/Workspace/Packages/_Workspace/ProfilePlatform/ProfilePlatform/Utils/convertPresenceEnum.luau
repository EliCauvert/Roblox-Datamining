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

return function(p0, p1)
	-- upvalues: t (ref), enumsModule (ref)
	local var3 = t[p0] or enumsModule.PresenceTypes.Offline
	
	return if var3 == enumsModule.PresenceTypes.InGame and p1 == nil then enumsModule.PresenceTypes.Online else var3
end