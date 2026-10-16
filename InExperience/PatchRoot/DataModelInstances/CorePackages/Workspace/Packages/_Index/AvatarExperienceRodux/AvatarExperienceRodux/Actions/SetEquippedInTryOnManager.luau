local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceModel)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemId, SelectedInTryOnManager, ItemType) --[[ Line: 13 ]]
	return {
		itemId = ItemId,
		selectedInTryOnManager = SelectedInTryOnManager,
		itemType = ItemType
	}
end)