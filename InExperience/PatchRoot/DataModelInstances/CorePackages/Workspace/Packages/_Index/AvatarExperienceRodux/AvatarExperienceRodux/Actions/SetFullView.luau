local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AvatarScreen, FullViewStatus)
	return {
		avatarScreen = AvatarScreen,
		fullViewStatus = FullViewStatus
	}
end)