return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Screen, Params)
	return { screen = Screen, params = Params }
end)