local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ name = "", description = "" }, {
	[require(script.Parent.Parent.Actions.SetPlaceInfo).name] = function(_, p0)
		return { name = p0.name, description = p0.description }
	end
})