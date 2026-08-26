local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return require(corePackagesService.Packages.Rodux).createReducer({
	menuVisible = false,
	guiInset = 0,
	errorVisible = false,
	errorText = ""
}, {
	[require(actions.ShowMenu).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { menuVisible = true })
	end,
	[require(actions.HideMenu).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { menuVisible = false })
	end,
	[require(actions.ShowError).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { errorVisible = true, errorText = p2.errorText })
	end,
	[require(actions.HideError).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { errorVisible = false })
	end,
	[require(actions.SetGuiInset).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { guiInset = p2.guiInset })
	end
})