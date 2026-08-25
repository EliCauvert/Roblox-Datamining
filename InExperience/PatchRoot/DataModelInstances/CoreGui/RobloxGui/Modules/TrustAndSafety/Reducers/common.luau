local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ toastTitle = nil, toastSubtitle = nil }, {
	[require(script.Parent.Parent.Actions.ShowToast).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			toastTitle = p1.toastTitle,
			toastSubtitle = p1.toastSubtitle
		})
	end
})