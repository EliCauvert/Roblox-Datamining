return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PlayerName)
	return { playerName = PlayerName }
end)