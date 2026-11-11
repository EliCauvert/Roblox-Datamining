local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagLuaAppRfySignalApportioningIxp = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppChartsStickyHeader = require(Parent.SharedFlags).FFlagLuaAppChartsStickyHeader
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppRfyRevealRows = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagLuaAppSortHeaderAnchorTag = require(Parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local FFlagSduiGenreSelector = require(Parent.SharedFlags).FFlagSduiGenreSelector
local _ = require(script.Parent.RoduxTypes)

return {
	EventContext = "HomeOmniFeed",
	OmniSortRetrievalStatus = { Exception = "Exception", Success = "Success" },
	GlobalLayoutDataKeys = { JYFRefresh = "JYFRefresh" },
	TopicLayoutDataKeys = {
		PYMKFindFriendsEnabled = "PYMKFindFriendsEnabled",
		PYMKSeeAllEnabled = "PYMKSeeAllEnabled",
		JYFFindFriendsEnabled = "JYFFindFriendsEnabled",
		ComponentType = "componentType",
		PlayerCountStyle = "playerCountStyle",
		IsSponsoredFooterAllowed = "isSponsoredFooterAllowed",
		LinkPath = "linkPath",
		SubtitleLinkPath = "subtitleLinkPath",
		HideSeeAll = "hideSeeAll",
		InfoText = "infoText",
		EndTimestamp = "endTimestamp",
		CountdownString = "countdownString",
		PlayButtonStyle = "playButtonStyle",
		BackgroundImageAssetId = "backgroundImageAssetId",
		HideTileMetadata = "hideTileMetadata",
		HideTileTitle = "hideTileTitle",
		ContainedTile = "containedTile",
		EnableExplicitFeedback = "enableExplicitFeedback",
		EnableSponsoredFeedback = "enableSponsoredFeedback",
		EnableCollectionGrid = "enableCollectionGrid",
		IsSponsoredRatingFooterAllowed = "isSponsoredRatingFooterAllowed",
		HeaderButtonText = if require(Parent.SharedFlags).FFlagLuaAppHeaderButtonText then "headerButtonText" else nil,
		HasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then "hasPrevalidatedVideoGamePlayability" else nil,
		EnableSignalApportioning = if FFlagLuaAppRfySignalApportioningIxp then "enableSignalApportioning" else nil,
		SponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then "sponsoredUserCohort" else nil,
		SortHeaderAnchorTag = if FFlagLuaAppSortHeaderAnchorTag then "sortHeaderAnchorTag" else nil,
		InitialVisibleRows = if FFlagLuaAppRfyRevealRows then "initialVisibleRows" else nil,
		VisibleRowsPerReveal = if FFlagLuaAppRfyRevealRows then "visibleRowsPerReveal" else nil,
		EnableReportAd = if FFlagLuaAppEnableSponsoredReportAd then "enableReportAd" else nil,
		AmpUpsellFeatureName = if FFlagLuaAppGameCarouselAmpUpsellAction then "ampUpsellFeatureName" else nil,
		AmpUpsellNamespace = if FFlagLuaAppGameCarouselAmpUpsellAction then "ampUpsellNamespace" else nil
	},
	ComponentTypeDataKeys = {
		EventTile = "EventTile",
		GridTile = "GridTile",
		AppGameTileNoMetadata = "AppGameTileNoMetadata"
	},
	ItemLayoutDataKeys = { Footer = "Footer" },
	OmniRecommendationsRequestIntent = {
		ManualRefresh = "manualRefresh",
		AutoRefresh = "autoRefresh",
		FriendPresenceChange = "friendPresenceChange",
		LogIn = "logIn",
		LoadMore = "loadMore",
		GameExit = "gameExit",
		AmpUpsellFeatureGranted = if FFlagLuaAppGameCarouselAmpUpsellAction then "ampUpsellFeatureGranted" else nil,
		OptionSelector = if FFlagSduiGenreSelector then "optionSelector" else nil
	},
	ContentGroupType = { Game = "Game", Text = "Text", User = "User" },
	OmniFeedPageSection = if FFlagLuaAppChartsStickyHeader then { Header = "Header" } else nil
}