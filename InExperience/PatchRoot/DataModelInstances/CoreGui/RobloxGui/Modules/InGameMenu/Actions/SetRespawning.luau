return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWNING", function(Respawning)
	return { respawning = Respawning }
end)