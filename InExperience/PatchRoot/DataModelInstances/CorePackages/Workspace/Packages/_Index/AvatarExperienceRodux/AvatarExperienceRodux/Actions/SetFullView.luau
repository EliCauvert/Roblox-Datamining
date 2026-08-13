local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 14 ]]
	return { avatarScreen = p0, fullViewStatus = p1 }
end)