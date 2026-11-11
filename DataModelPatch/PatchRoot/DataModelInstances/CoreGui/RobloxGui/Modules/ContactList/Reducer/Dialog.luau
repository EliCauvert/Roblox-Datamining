local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({
	isOpen = false,
	title = "",
	bodyText = "",
	dismissCallback = nil
}, {
	[require(script.Parent.Parent.Actions.OpenOrUpdateDialog).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			isOpen = true,
			title = p2.title,
			bodyText = p2.bodyText,
			dismissCallback = p2.dismissCallback
		})
	end,
	[require(script.Parent.Parent.Actions.CloseDialog).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			isOpen = false,
			title = "",
			bodyText = "",
			dismissCallback = CryoModule.None
		})
	end
})