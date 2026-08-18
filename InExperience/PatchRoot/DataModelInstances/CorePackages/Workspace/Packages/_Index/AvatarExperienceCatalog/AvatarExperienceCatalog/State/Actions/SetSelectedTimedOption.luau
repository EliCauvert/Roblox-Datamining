local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 17 ]]
	return {
		itemId = p0.itemId,
		selectedTimedOptionIndex = p0.selectedTimedOptionIndex,
		itemType = p0.itemType
	}
end)