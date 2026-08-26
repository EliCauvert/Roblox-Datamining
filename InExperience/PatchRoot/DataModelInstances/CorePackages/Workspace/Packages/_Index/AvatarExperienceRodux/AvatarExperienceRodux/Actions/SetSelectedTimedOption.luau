local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return {
		itemId = p1,
		selectedTimedOptionIndex = p2,
		itemType = p3
	}
end)