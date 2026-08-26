local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { avatarScreen = p1, fullViewStatus = p2 }
end)