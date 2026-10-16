local DataHydrationTypesModule = require(script.DataHydrationTypes)
local SharedFlagsModule = require(script.Parent.SharedFlags)
local FFlagSduiLeaderboardComponent = SharedFlagsModule.FFlagSduiLeaderboardComponent
local NotificationBadgeModule = require(script.NotificationBadge)
local LeaderboardStatsModule = require(script.LeaderboardStats)

return {
	["jest.config"] = script["jest.config"],
	createDataResolver = require(script.createDataResolver),
	createDataCache = require(script.createDataCache),
	createMutationLayer = require(script.createMutationLayer),
	DataHydrationTypes = DataHydrationTypesModule,
	DataHydrationUtils = require(script.DataHydrationUtils),
	DataStatus = DataHydrationTypesModule.DataStatus,
	Badges = require(script.Badges),
	Game = require(script.Game),
	Creator = require(script.Creator),
	MediaAsset = require(script.MediaAsset),
	MarketplaceCatalogCategory = require(script.MarketplaceCatalogCategory),
	MarketplaceCatalogSort = require(script.MarketplaceCatalogSort),
	SocialLink = require(script.SocialLink),
	ExperienceEvents = require(script.ExperienceEvents),
	TrustedConnections = require(script.TrustedConnections),
	Profile = require(script.Profile),
	Presence = require(script.Presence),
	Friends = require(script.Friends),
	MarketplaceAsset = require(script.MarketplaceAsset),
	MarketplaceBundle = require(script.MarketplaceBundle),
	MarketplaceLook = require(script.MarketplaceLook),
	CollectibleItem = require(script.CollectibleItem),
	Song = require(script.Song),
	UserSettings = require(script.UserSettings),
	UserProfile = require(script.UserProfile),
	Community = require(script.Community),
	CommunityUserMembership = require(script.CommunityUserMembership),
	NotificationBadge = if SharedFlagsModule.FFlagSduiNotificationBadgeHydration then NotificationBadgeModule else nil,
	LeaderboardStats = if FFlagSduiLeaderboardComponent then LeaderboardStatsModule else nil
}