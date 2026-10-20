return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ItemId, ItemType)
	return { itemId = ItemId, itemType = ItemType }
end)