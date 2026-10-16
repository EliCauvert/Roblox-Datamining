return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PlayerId) --[[ Line: 4 ]]
	return { playerId = PlayerId }
end)