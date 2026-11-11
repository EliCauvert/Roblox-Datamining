local SocialCommon = script:FindFirstAncestor("SocialCommon")
local PresenceTypesModule = require(SocialCommon.Enums.PresenceTypes)
local FoundationModule = require(SocialCommon.Parent.Foundation)
local config = {
	[PresenceTypesModule.Offline] = FoundationModule.Enums.UserPresence.Away,
	[PresenceTypesModule.Online] = FoundationModule.Enums.UserPresence.Active,
	[PresenceTypesModule.InGame] = FoundationModule.Enums.UserPresence.InExperience,
	[PresenceTypesModule.InStudio] = FoundationModule.Enums.UserPresence.Active,
	Offline = FoundationModule.Enums.UserPresence.Away,
	Online = FoundationModule.Enums.UserPresence.Active,
	InGame = FoundationModule.Enums.UserPresence.InExperience,
	InStudio = FoundationModule.Enums.UserPresence.Active
}

return function(p1)
	-- upvalues: config (copy), FoundationModule (copy)
	return config[p1] or FoundationModule.Enums.UserPresence.None
end