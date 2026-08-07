local socialCommon = script:FindFirstAncestor("SocialCommon")
local presenceTypesModule = require(socialCommon.Enums.PresenceTypes)
local foundationModule = require(socialCommon.Parent.Foundation)
local t = {
	[presenceTypesModule.Offline] = foundationModule.Enums.UserPresence.Away,
	[presenceTypesModule.Online] = foundationModule.Enums.UserPresence.Active,
	[presenceTypesModule.InGame] = foundationModule.Enums.UserPresence.InExperience,
	[presenceTypesModule.InStudio] = foundationModule.Enums.UserPresence.Active,
	Offline = foundationModule.Enums.UserPresence.Away,
	Online = foundationModule.Enums.UserPresence.Active,
	InGame = foundationModule.Enums.UserPresence.InExperience,
	InStudio = foundationModule.Enums.UserPresence.Active
}

return function(p0) --[[ line: 18 ]]
	-- upvalues: t (ref), foundationModule (ref)
	return t[p0] or foundationModule.Enums.UserPresence.None
end