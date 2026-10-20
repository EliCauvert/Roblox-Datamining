return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Items, ItemTypeId, RecommendationsType)
	return {
		items = Items,
		itemTypeId = ItemTypeId,
		recommendationsType = RecommendationsType
	}
end)