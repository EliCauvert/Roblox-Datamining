local Parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	assets = require(Parent.FavoriteAssets),
	bundles = require(Parent.FavoriteBundles)
})