return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	return {
		promptInfo = {
			promptType = p0,
			guid = p1,
			scopes = p2,
			makeupEntries = p3
		}
	}
end)