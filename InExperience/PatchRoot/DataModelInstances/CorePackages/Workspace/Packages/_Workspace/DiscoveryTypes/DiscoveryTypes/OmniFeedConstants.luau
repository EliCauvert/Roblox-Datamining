local parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local fFlagLuaAppHeaderButtonText = require(parent.SharedFlags).FFlagLuaAppHeaderButtonText
local fFlagLuaAppRfySignalApportioningIxp = require(parent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppRfyRevealRows = require(parent.SharedFlags).FFlagLuaAppRfyRevealRows
local _ = require(script.Parent.RoduxTypes)

return {
	EventContext = "HomeOmniFeed",
	OmniSortRetrievalStatus = { Exception = "Exception", Success = "Success" },
	GlobalLayoutDataKeys = {
		JYFRefresh = "JYFRefresh",
		ShowBackToTop = if require(parent.SharedFlags).FFlagLuaAppSupportHomeBackToTop then "showBackToTop" else nil
	},
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
		SponsoredUserCohort = "sponsoredUserCohort",
		EnableSponsoredFeedback = "enableSponsoredFeedback",
		EnableCollectionGrid = "enableCollectionGrid",
		IsSponsoredRatingFooterAllowed = "isSponsoredRatingFooterAllowed",
		AmpUpsellFeatureName = "ampUpsellFeatureName",
		AmpUpsellNamespace = "ampUpsellNamespace",
		HeaderButtonText = if fFlagLuaAppHeaderButtonText then "headerButtonText" else nil,
		HasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then "hasPrevalidatedVideoGamePlayability" else nil,
		EnableSignalApportioning = if fFlagLuaAppRfySignalApportioningIxp then "enableSignalApportioning" else nil,
		SortHeaderAnchorTag = if require(parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag then "sortHeaderAnchorTag" else nil,
		InitialFeedVisibleRows = if fFlagLuaAppRfyRevealRows then "initialFeedVisibleRows" else nil,
		VisibleRowsPerReveal = if fFlagLuaAppRfyRevealRows then "visibleRowsPerReveal" else nil,
		EnableReportAd = if fFlagLuaAppEnableSponsoredReportAd then "enableReportAd" else nil,
		EnableInstantPlay = if require(parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay then "enableInstantPlay" else nil
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
		AmpUpsellFeatureGranted = "ampUpsellFeatureGranted",
		OptionSelector = "optionSelector"
	},
	ContentGroupType = { Game = "Game", Text = "Text", User = "User" },
	OmniFeedPageSection = { Header = "Header" }
}