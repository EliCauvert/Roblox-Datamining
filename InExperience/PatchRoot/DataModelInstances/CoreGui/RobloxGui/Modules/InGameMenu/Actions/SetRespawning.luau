return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWNING", function(p1)
	return { respawning = p1 }
end)