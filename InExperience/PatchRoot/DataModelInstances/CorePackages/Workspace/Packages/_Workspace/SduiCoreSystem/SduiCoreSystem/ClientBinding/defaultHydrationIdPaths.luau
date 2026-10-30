local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiDataBindingContentTypeModule = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SharedFlagsModule = require(SduiCoreSystem.Parent.SharedFlags)
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagSduiAddCollectibleItemDataHydration = SharedFlagsModule.FFlagSduiAddCollectibleItemDataHydration
local FFlagSduiLeaderboardComponent = SharedFlagsModule.FFlagSduiLeaderboardComponent
local FFlagSduiBuyRobuxHydration = SharedFlagsModule.FFlagSduiBuyRobuxHydration

return {
	[SduiDataBindingContentTypeModule.badge] = { "badge_id" },
	[SduiDataBindingContentTypeModule.creator] = { "creator_key" },
	[SduiDataBindingContentTypeModule.universe] = { "universe_id" },
	[SduiDataBindingContentTypeModule.ageRecommendation] = { "universe_id" },
	[SduiDataBindingContentTypeModule.socialLink] = { "social_link_id" },
	[SduiDataBindingContentTypeModule.marketplaceCatalogCategory] = if SharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport then { "marketplace_catalog_category_item_id" } else nil,
	[SduiDataBindingContentTypeModule.song] = { "song_id" },
	[SduiDataBindingContentTypeModule.marketplaceCatalogSort] = if FFlagSduiMarketplaceCatalogSortSupport then { "catalog_sort_id" } else nil,
	[SduiDataBindingContentTypeModule.gamePass] = { "game_pass_id" },
	[SduiDataBindingContentTypeModule.gameDeveloperProduct] = if FFlagSduiDevStoreSeeAllSupport then { "developer_product_id" } else nil,
	[SduiDataBindingContentTypeModule.gameSubscription] = if FFlagSduiDevStoreSeeAllSupport then { "subscription_id" } else nil,
	[SduiDataBindingContentTypeModule.playability] = { "universe_id" },
	[SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata] = { "root_place_id" },
	[SduiDataBindingContentTypeModule.userProfile] = { "user_id" },
	[SduiDataBindingContentTypeModule.collectibleItem] = if FFlagSduiAddCollectibleItemDataHydration then { "collectible_item_id" } else nil,
	[SduiDataBindingContentTypeModule.leaderboardStats] = if FFlagSduiLeaderboardComponent then { "stats_id" } else nil,
	[SduiDataBindingContentTypeModule.buyRobuxOneTimeProduct] = if FFlagSduiBuyRobuxHydration then { "product_id" } else nil,
	[SduiDataBindingContentTypeModule.buyRobuxSubscriptionProduct] = if FFlagSduiBuyRobuxHydration then { "product_id" } else nil,
	[SduiDataBindingContentTypeModule.buyRobuxPendingTransfer] = if FFlagSduiBuyRobuxHydration then { "transfer_request_id" } else nil,
	[SduiDataBindingContentTypeModule.buyRobuxBonusItem] = if FFlagSduiBuyRobuxHydration then { "bonus_id" } else nil
}