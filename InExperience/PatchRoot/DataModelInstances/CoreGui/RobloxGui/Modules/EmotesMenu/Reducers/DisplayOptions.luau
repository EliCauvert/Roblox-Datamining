local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return require(CorePackages.Packages.Rodux).createReducer({
	menuVisible = false,
	guiInset = 0,
	errorVisible = false,
	errorText = ""
}, {
	[require(Actions.ShowMenu).name] = function(p1, _) --[[ Line: 30 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { menuVisible = true })
	end,
	[require(Actions.HideMenu).name] = function(p1, _) --[[ Line: 36 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { menuVisible = false })
	end,
	[require(Actions.ShowError).name] = function(p1, p2) --[[ Line: 42 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { errorVisible = true, errorText = p2.errorText })
	end,
	[require(Actions.HideError).name] = function(p1, _) --[[ Line: 49 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { errorVisible = false })
	end,
	[require(Actions.SetGuiInset).name] = function(p1, p2) --[[ Line: 55 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { guiInset = p2.guiInset })
	end
})