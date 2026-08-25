local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return require(corePackagesService.Packages.Rodux).createReducer({
	menuVisible = false,
	guiInset = 0,
	errorVisible = false,
	errorText = ""
}, {
	[require(actions.ShowMenu).name] = function(p0, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { menuVisible = true })
	end,
	[require(actions.HideMenu).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { menuVisible = false })
	end,
	[require(actions.ShowError).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { errorVisible = true, errorText = p3.errorText })
	end,
	[require(actions.HideError).name] = function(p4, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { errorVisible = false })
	end,
	[require(actions.SetGuiInset).name] = function(p5, p6)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p5, { guiInset = p6.guiInset })
	end
})