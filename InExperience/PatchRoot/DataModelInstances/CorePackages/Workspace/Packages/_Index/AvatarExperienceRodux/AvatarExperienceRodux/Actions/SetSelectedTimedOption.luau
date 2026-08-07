local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 13 ]]
	return {
		itemId = p0,
		selectedTimedOptionIndex = p1,
		itemType = p2
	}
end)