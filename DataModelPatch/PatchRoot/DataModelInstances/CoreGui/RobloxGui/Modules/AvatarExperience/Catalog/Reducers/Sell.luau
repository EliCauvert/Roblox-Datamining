local Parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	AvailableToSellAssets = require(Parent.AvailableToSellAssets),
	CurrentlySellingAssets = require(Parent.CurrentlySellingAssets)
})