local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo

return inGameMenuDependenciesModule.Rodux.createReducer({ name = "Game", description = "" }, {
	[require(script.Parent.Parent.Actions.SetGameNameAndDescription).name] = function(p0, p1)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p0, { name = p1.gameName, description = p1.gameDescription })
	end
})