return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ItemDetailsExpanded)
	return { itemDetailsExpanded = ItemDetailsExpanded }
end)