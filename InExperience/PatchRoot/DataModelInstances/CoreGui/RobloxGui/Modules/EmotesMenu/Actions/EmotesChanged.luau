return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { emotes = p1 }
end)