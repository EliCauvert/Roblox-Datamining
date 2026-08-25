return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { itemId = p0, itemType = p1 }
end)