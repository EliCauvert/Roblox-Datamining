return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PlayerId)
	return { playerId = PlayerId }
end)