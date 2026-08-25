return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { tryingOn = p0, assetId = p1, assetTypeId = p2 }
end)