local parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	assets = require(parent.FavoriteAssets),
	bundles = require(parent.FavoriteBundles)
})