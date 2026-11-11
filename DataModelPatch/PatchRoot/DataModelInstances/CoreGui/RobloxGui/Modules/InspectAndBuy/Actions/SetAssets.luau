return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Assets)
	return { assets = Assets }
end)