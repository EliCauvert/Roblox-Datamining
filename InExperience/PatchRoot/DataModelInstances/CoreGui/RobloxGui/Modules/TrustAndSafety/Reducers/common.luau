local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ toastTitle = nil, toastSubtitle = nil }, {
	[require(script.Parent.Parent.Actions.ShowToast).name] = function(p1, p2) --[[ Line: 14 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			toastTitle = p2.toastTitle,
			toastSubtitle = p2.toastSubtitle
		})
	end
})