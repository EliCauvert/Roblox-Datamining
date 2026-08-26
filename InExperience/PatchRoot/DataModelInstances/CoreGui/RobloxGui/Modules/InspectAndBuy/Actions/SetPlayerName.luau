return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { playerName = p1 }
end)