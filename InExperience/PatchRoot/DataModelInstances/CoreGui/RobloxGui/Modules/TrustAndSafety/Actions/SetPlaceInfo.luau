return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { name = p1, description = p2 }
end)