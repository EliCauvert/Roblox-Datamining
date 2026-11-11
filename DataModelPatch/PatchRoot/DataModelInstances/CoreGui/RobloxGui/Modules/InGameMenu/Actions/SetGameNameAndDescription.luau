return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(GameName, GameDescription)
	return { gameName = GameName, gameDescription = GameDescription }
end)