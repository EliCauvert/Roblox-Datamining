local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetFavoriteAsset).name] = function(p1, p2) --[[ Line: 8 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.id] = p2.isFavorite })
	end
})