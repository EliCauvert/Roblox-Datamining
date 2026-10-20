return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Route)
	return { route = Route }
end)