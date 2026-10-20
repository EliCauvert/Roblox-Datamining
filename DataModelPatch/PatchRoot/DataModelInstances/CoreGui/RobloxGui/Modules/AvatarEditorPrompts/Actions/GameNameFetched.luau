return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(GameName)
	return { gameName = GameName }
end)