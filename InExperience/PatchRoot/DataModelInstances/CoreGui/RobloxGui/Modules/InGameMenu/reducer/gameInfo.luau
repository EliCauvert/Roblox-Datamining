local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Cryo = InGameMenuDependenciesModule.Cryo

return InGameMenuDependenciesModule.Rodux.createReducer({ name = "Game", description = "" }, {
	[require(script.Parent.Parent.Actions.SetGameNameAndDescription).name] = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { name = p2.gameName, description = p2.gameDescription })
	end
})