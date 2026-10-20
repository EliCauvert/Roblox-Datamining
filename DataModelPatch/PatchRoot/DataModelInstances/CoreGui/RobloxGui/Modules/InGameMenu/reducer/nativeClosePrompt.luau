local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Cryo = InGameMenuDependenciesModule.Cryo
local Parent = script.Parent.Parent

return InGameMenuDependenciesModule.Rodux.createReducer({ closingApp = false, menuIconTooltipOpen = false }, {
	[require(Parent.Actions.OpenNativeClosePrompt).name] = function(p1, _)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { closingApp = true })
	end,
	[require(Parent.Actions.CloseNativeClosePrompt).name] = function(p1, _)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { closingApp = false })
	end,
	[require(Parent.Actions.SetMenuIconTooltipOpen).name] = function(p1, p2)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { menuIconTooltipOpen = p2.menuIconTooltipOpen })
	end
})