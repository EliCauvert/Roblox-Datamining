return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Friend)
	return { friend = Friend }
end)