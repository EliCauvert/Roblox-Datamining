local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sharedFlagsModule = require(sduiCoreSystem.Parent.SharedFlags)
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport

return {
	[sduiDataBindingContentTypeModule.badge] = { "badge_id" },
	[sduiDataBindingContentTypeModule.creator] = { "creator_key" },
	[sduiDataBindingContentTypeModule.universe] = { "universe_id" },
	[sduiDataBindingContentTypeModule.ageRecommendation] = { "universe_id" },
	[sduiDataBindingContentTypeModule.socialLink] = { "social_link_id" },
	[sduiDataBindingContentTypeModule.marketplaceCatalogCategory] = if sharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport then { "marketplace_catalog_category_item_id" } else nil,
	[sduiDataBindingContentTypeModule.song] = { "song_id" },
	[sduiDataBindingContentTypeModule.marketplaceCatalogSort] = if sharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport then { "catalog_sort_id" } else nil,
	[sduiDataBindingContentTypeModule.gamePass] = { "game_pass_id" },
	[sduiDataBindingContentTypeModule.gameDeveloperProduct] = if fFlagSduiDevStoreSeeAllSupport then { "developer_product_id" } else nil,
	[sduiDataBindingContentTypeModule.gameSubscription] = if fFlagSduiDevStoreSeeAllSupport then { "subscription_id" } else nil,
	[sduiDataBindingContentTypeModule.playability] = { "universe_id" },
	[sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata] = { "root_place_id" },
	[sduiDataBindingContentTypeModule.userProfile] = { "user_id" },
	[sduiDataBindingContentTypeModule.collectibleItem] = if sharedFlagsModule.FFlagSduiAddCollectibleItemDataHydration then { "collectible_item_id" } else nil,
	[sduiDataBindingContentTypeModule.leaderboardStats] = if sharedFlagsModule.FFlagSduiLeaderboardComponent then { "stats_id" } else nil
}