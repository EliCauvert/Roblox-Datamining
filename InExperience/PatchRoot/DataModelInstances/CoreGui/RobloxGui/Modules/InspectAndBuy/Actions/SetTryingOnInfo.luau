return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { tryingOn = p1, assetId = p2, assetTypeId = p3 }
end)