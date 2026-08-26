local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo

return inGameMenuDependenciesModule.Rodux.createReducer({ name = "Game", description = "" }, {
	[require(script.Parent.Parent.Actions.SetGameNameAndDescription).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { name = p2.gameName, description = p2.gameDescription })
	end
})