local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({
	isOpen = false,
	title = "",
	bodyText = "",
	dismissCallback = nil
}, {
	[require(script.Parent.Parent.Actions.OpenOrUpdateDialog).name] = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			isOpen = true,
			title = p1.title,
			bodyText = p1.bodyText,
			dismissCallback = p1.dismissCallback
		})
	end,
	[require(script.Parent.Parent.Actions.CloseDialog).name] = function(p2, _) --[[ line: 22 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, {
			isOpen = false,
			title = "",
			bodyText = "",
			dismissCallback = cryoModule.None
		})
	end
})