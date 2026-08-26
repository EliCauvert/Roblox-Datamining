return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4, p5)
	return {
		promptInfo = {
			promptType = p1,
			assetInstance = p2,
			assetType = p3,
			guid = p4,
			scopes = p5
		}
	}
end)