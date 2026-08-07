local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 20 ]]
	return { itemIdToOrderMap = p0 }
end)