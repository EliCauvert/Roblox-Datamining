local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	CollectiblesItemInfo = require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo),
	CollectiblesResellableInstances = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances),
	CollectiblesMarketplaceResaleParameters = require(Modules.AvatarExperience.Common.Reducers.CollectiblesMarketplaceResaleParameters),
	CollectiblesResellersInstances = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
})