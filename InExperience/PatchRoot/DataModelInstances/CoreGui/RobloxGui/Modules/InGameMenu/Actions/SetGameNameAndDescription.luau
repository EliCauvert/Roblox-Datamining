return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(GameName, GameDescription) --[[ Line: 5 ]]
	return { gameName = GameName, gameDescription = GameDescription }
end)