local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local FFlagLuaAppHeaderButtonText = require(Parent.SharedFlags).FFlagLuaAppHeaderButtonText
local FFlagLuaAppRfySignalApportioningIxp = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local FFlagLuaAppEnableReportExperience = require(Parent.SharedFlags).FFlagLuaAppEnableReportExperience
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppRfyRevealRows = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagLuaAppSortHeaderAnchorTag = require(Parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local FFlagLuaAppContinueSortInstantPlay = require(Parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local _ = require(script.Parent.RoduxTypes)

return {
	EventContext = "HomeOmniFeed",
	OmniSortRetrievalStatus = { Exception = "Exception", Success = "Success" },
	GlobalLayoutDataKeys = {
		JYFRefresh = "JYFRefresh",
		ShowBackToTop = if require(Parent.SharedFlags).FFlagLuaAppSupportHomeBackToTop then "showBackToTop" else nil
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
		HeaderButtonText = if FFlagLuaAppHeaderButtonText then "headerButtonText" else nil,
		HideTileMetadata = "hideTileMetadata",
		HideTileTitle = "hideTileTitle",
		ContainedTile = "containedTile",
		HasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then "hasPrevalidatedVideoGamePlayability" else nil,
		EnableExplicitFeedback = "enableExplicitFeedback",
		EnableSignalApportioning = if FFlagLuaAppRfySignalApportioningIxp then "enableSignalApportioning" else nil,
		SponsoredUserCohort = "sponsoredUserCohort",
		EnableSponsoredFeedback = "enableSponsoredFeedback",
		EnableCollectionGrid = "enableCollectionGrid",
		SortHeaderAnchorTag = if FFlagLuaAppSortHeaderAnchorTag then "sortHeaderAnchorTag" else nil,
		InitialFeedVisibleRows = if FFlagLuaAppRfyRevealRows then "initialFeedVisibleRows" else nil,
		VisibleRowsPerReveal = if FFlagLuaAppRfyRevealRows then "visibleRowsPerReveal" else nil,
		EnableReportAd = "enableReportAd",
		EnableReportExperience = if FFlagLuaAppEnableReportExperience then "enableReportExperience" else nil,
		IsSponsoredRatingFooterAllowed = "isSponsoredRatingFooterAllowed",
		AmpUpsellFeatureName = "ampUpsellFeatureName",
		AmpUpsellNamespace = "ampUpsellNamespace",
		EnableInstantPlay = if FFlagLuaAppContinueSortInstantPlay then "enableInstantPlay" else nil,
		InstantPlayTreatment = if FFlagLuaAppContinueSortInstantPlay then "instantPlayTreatment" else nil
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