local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(parent.AvatarExperienceCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		itemId = p1.itemId,
		selectedTimedOptionIndex = p1.selectedTimedOptionIndex,
		itemType = p1.itemType
	}
end)