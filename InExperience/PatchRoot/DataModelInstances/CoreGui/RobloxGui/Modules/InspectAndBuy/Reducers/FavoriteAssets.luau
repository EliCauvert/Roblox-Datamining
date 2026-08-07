local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetFavoriteAsset).name] = function(p0, p1) --[[ line: 8 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { [p1.id] = p1.isFavorite })
	end
})