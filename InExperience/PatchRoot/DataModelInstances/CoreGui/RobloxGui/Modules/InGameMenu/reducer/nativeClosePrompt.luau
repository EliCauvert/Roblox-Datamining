local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local rodux = inGameMenuDependenciesModule.Rodux
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent

return rodux.createReducer({ closingApp = false, menuIconTooltipOpen = false }, {
	[require(parent.Actions.OpenNativeClosePrompt).name] = function(p0, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p0, { closingApp = true })
	end,
	[require(parent.Actions.CloseNativeClosePrompt).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { closingApp = false })
	end,
	[require(parent.Actions.SetMenuIconTooltipOpen).name] = function(p2, p3)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p2, { menuIconTooltipOpen = p3.menuIconTooltipOpen })
	end
})