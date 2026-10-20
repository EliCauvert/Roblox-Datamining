local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else MakeActionCreatorFunction(script.Name, function(GameName)
	return { gameName = GameName }
end)