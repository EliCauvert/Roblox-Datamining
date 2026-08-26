return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { itemId = p1, itemType = p2 }
end)