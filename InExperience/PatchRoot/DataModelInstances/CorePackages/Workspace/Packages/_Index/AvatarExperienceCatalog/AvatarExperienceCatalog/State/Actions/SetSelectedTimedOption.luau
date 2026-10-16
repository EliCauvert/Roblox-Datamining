local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.AvatarExperienceModel)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 17 ]]
	return {
		itemId = p1.itemId,
		selectedTimedOptionIndex = p1.selectedTimedOptionIndex,
		itemType = p1.itemType
	}
end)