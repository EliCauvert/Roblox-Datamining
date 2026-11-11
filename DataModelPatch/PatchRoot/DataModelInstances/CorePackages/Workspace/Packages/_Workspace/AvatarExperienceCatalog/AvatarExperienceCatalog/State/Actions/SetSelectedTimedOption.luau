local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.AvatarExperienceCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		itemId = p1.itemId,
		selectedTimedOptionIndex = p1.selectedTimedOptionIndex,
		itemType = p1.itemType
	}
end)