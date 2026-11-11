local Modules = game:GetService("CoreGui").RobloxGui.Modules
local BundleFavoritesModule = require(Modules.AvatarExperience.Catalog.Reducers.BundleFavorites)
local AssetFavoritesModule = require(Modules.AvatarExperience.Catalog.Reducers.AssetFavorites)
local CategoriesModule = require(Modules.AvatarExperience.Catalog.Reducers.Categories)
local SearchCategoriesModule = require(Modules.AvatarExperience.Catalog.Reducers.SearchCategories)
local MarketplaceFeeModule = require(Modules.AvatarExperience.Catalog.Reducers.MarketplaceFee)
local SellModule = require(Modules.AvatarExperience.Catalog.Reducers.Sell)
local TopicsModule = require(Modules.AvatarExperience.Catalog.Reducers.Topics)
local TopicsFetchTimesModule = require(Modules.AvatarExperience.Catalog.Reducers.TopicsFetchTimes)
local UserAssetsModule = require(Modules.AvatarExperience.Catalog.Reducers.UserAssets)
local ResellerCursorModule = require(Modules.AvatarExperience.Catalog.Reducers.ResellerCursor)
local SortAndFiltersModule = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local SponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Reducers.SponsoredItems)
local MetadataModule = require(Modules.AvatarExperience.Catalog.Reducers.Metadata)
local ResultsListModule = require(Modules.AvatarExperience.Catalog.Reducers.ResultsList)
local AvatarsTabSearchInfoModule = require(Modules.AvatarExperience.Catalog.Reducers.AvatarsTabSearchInfo)

return function(p1, p2)
	-- upvalues: AssetFavoritesModule (copy), BundleFavoritesModule (copy), CategoriesModule (copy), SearchCategoriesModule (copy), TopicsModule (copy), TopicsFetchTimesModule (copy), MarketplaceFeeModule (copy), SellModule (copy), ResellerCursorModule (copy), UserAssetsModule (copy), SortAndFiltersModule (copy), SponsoredItemsModule (copy), MetadataModule (copy), ResultsListModule (copy), AvatarsTabSearchInfoModule (copy)
	local P0 = p1 or {}
	
	return {
		AssetFavorites = AssetFavoritesModule(P0.AssetFavorites, p2),
		BundleFavorites = BundleFavoritesModule(P0.BundleFavorites, p2),
		Categories = CategoriesModule(P0.Categories, p2),
		SearchCategories = SearchCategoriesModule(P0.SearchCategories, p2),
		Topics = TopicsModule(P0.Topics, p2),
		TopicsFetchTimes = TopicsFetchTimesModule(P0.TopicsFetchTimes, p2),
		MarketplaceFee = MarketplaceFeeModule(P0.MarketplaceFee, p2),
		Sell = SellModule(P0.Sell, p2),
		ResellerCursor = ResellerCursorModule(P0.ResellerCursor, p2),
		UserAssets = UserAssetsModule(P0.UserAssets, p2),
		SortAndFilters = SortAndFiltersModule(P0.SortAndFilters, p2),
		SponsoredItems = SponsoredItemsModule(P0.SponsoredItems, p2),
		Metadata = MetadataModule(P0.Metadata, p2),
		ResultsList = ResultsListModule(P0.ResultsList, p2),
		AvatarsTabSearchInfo = AvatarsTabSearchInfoModule(P0.AvatarsTabSearchInfo, p2)
	}
end