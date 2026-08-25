return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { respawnEnabled = p0, customCallback = p1 }
end)