return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("RemoveScreen", function(Item)
	return { item = Item }
end)