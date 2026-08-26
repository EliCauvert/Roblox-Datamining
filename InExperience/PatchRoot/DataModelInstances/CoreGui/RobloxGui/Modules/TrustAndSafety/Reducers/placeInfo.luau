local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ name = "", description = "" }, {
	[require(script.Parent.Parent.Actions.SetPlaceInfo).name] = function(_, p1)
		return { name = p1.name, description = p1.description }
	end
})