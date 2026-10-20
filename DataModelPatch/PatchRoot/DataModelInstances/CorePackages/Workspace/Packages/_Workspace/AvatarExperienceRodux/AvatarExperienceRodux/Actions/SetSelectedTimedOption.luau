local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemId, SelectedTimedOptionIndex, ItemType)
	return {
		itemId = ItemId,
		selectedTimedOptionIndex = SelectedTimedOptionIndex,
		itemType = ItemType
	}
end)