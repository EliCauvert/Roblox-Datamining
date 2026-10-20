return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Enable)
	return { enable = Enable }
end)