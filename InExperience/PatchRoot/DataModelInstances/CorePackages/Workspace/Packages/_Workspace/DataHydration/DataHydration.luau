local dataHydrationTypesModule = require(script.DataHydrationTypes)
local fFlagSduiExperienceDetailsSupport = require(script.Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return {
	["jest.config"] = script["jest.config"],
	createDataResolver = require(script.createDataResolver),
	createDataCache = require(script.createDataCache),
	createMutationLayer = require(script.createMutationLayer),
	DataHydrationTypes = dataHydrationTypesModule,
	DataHydrationUtils = require(script.DataHydrationUtils),
	DataStatus = dataHydrationTypesModule.DataStatus,
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
	Song = require(script.Song),
	UserSettings = require(script.UserSettings),
	UserProfile = if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport then require(script.UserProfile) else nil else nil,
	Community = if fFlagSduiExperienceDetailsSupport then require(script.Community) else nil,
	CommunityUserMembership = if fFlagSduiExperienceDetailsSupport then require(script.CommunityUserMembership) else nil
}