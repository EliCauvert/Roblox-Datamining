local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local rodux = inGameMenuDependenciesModule.Rodux
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent

return rodux.createReducer({ closingApp = false, menuIconTooltipOpen = false }, {
	[require(parent.Actions.OpenNativeClosePrompt).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { closingApp = true })
	end,
	[require(parent.Actions.CloseNativeClosePrompt).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { closingApp = false })
	end,
	[require(parent.Actions.SetMenuIconTooltipOpen).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { menuIconTooltipOpen = p2.menuIconTooltipOpen })
	end
})