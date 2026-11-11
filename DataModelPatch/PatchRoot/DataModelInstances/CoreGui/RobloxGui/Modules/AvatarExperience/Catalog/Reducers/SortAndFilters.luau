local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	CatalogSort = require(Modules.AvatarExperience.Catalog.Reducers.CatalogSort),
	CatalogSortAggregation = require(Modules.AvatarExperience.Catalog.Reducers.CatalogSortAggregation),
	PriceRange = require(Modules.AvatarExperience.Catalog.Reducers.PriceRange),
	SalesTypeFilter = require(Modules.AvatarExperience.Catalog.Reducers.SalesTypeFilter),
	CreatorFilter = require(Modules.AvatarExperience.Catalog.Reducers.CreatorFilter),
	UnavailableItemFilter = require(Modules.AvatarExperience.Catalog.Reducers.UnavailableItemFilter),
	SelectedTopics = require(Modules.AvatarExperience.Catalog.Reducers.SelectedTopics),
	WearTimeFilter = require(Modules.AvatarExperience.Catalog.Reducers.WearTimeFilter)
})