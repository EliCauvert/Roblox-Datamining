local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ name = "", description = "" }, {
	[require(script.Parent.Parent.Actions.SetPlaceInfo).name] = function(_, p1) --[[ Line: 13 ]]
		return { name = p1.name, description = p1.description }
	end
})