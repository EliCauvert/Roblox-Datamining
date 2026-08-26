return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { respawnEnabled = p1, customCallback = p2 }
end)