local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetFavoriteBundle).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.id] = p2.isFavorite })
	end
})