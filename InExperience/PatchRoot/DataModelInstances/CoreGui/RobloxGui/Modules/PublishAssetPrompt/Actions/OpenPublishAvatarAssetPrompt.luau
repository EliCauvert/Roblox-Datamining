return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		promptInfo = {
			promptType = p1,
			accessoryType = p2,
			guid = p3,
			scopes = p4
		}
	}
end)