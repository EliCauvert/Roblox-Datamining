local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceModel)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemId, SelectedTimedOptionIndex, ItemType) --[[ Line: 13 ]]
	return {
		itemId = ItemId,
		selectedTimedOptionIndex = SelectedTimedOptionIndex,
		itemType = ItemType
	}
end)