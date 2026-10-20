local LocalizationService = game:GetService("LocalizationService")
local IXPService = game:GetService("IXPService")
local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local LuaAppRemoveEDPLoadingState = game:DefineFastFlag("LuaAppRemoveEDPLoadingState", false)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(CorePackages.Packages.Promise)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ButtonSize = FoundationModule.Enums.ButtonSize
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local DetailsPageSelector = require(CorePackages.Workspace.Packages.AppBlox).DetailsPageSelector
local ContentPosition = require(CorePackages.Workspace.Packages.AppBlox).ContentPosition
local UseCloseWithBackButtonFunction = require(CorePackages.Workspace.Packages.AppBlox).useCloseWithBackButton
local Images = UIBloxModule.App.ImageSet.Images
local PlayerCount = UIBloxModule.App.Indicator.PlayerCount
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local DeviceType = RobloxAppEnumsModule.DeviceType
local UiMode = RobloxAppEnumsModule.UiMode
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local AbbreviateCountFunction = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local GameStats = require(CorePackages.Workspace.Packages.GameTile).GameStats
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local ExperienceDetailsExperimentationModule = require(script.Parent.ExperienceDetailsExperimentation)
local MediaGalleryVideoItemModule = require(script.Parent.MediaGalleryVideoItem)
local VideoPlaybackCoordinator = require(CorePackages.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ExperienceCommunityLink = require(CorePackages.Workspace.Packages.CommunityLinks).Components.ExperienceCommunityLink
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local AgeRecommendationDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails
local ExperienceDetailsNoticeType = require(CorePackages.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType
local EnumGameDetailErrorTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local ExperienceRatings = Modules.LuaApp.Components.ExperienceDetails.ExperienceRatings
local GetPlayButtonPropsFunction = Modules.LuaApp.Common.Experience.getPlayButtonProps
local GamePlayButtonModule = require(CorePackages.Workspace.Packages.GamePlayButton)
local PlayButton = GamePlayButtonModule.PlayButton
local PlayWithRewardComponent = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).PlayWithRewardComponent
local CheckAndFormatPossibleLinkFunction = require(CorePackages.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink
local RetrievalStatus1 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules1.LuaApp.Constants)
local TransitionAnimationModule = require(Modules1.LuaApp.Enum.TransitionAnimation)
local OpenExternalBrowserModule = require(Modules1.LuaApp.openExternalBrowser)
local EventsListWrapperModule = require(Modules1.LuaApp.Components.VirtualEvents.EventsListWrapper)
local GameRefundPolicyModule = require(Modules1.LuaApp.Components.GameDetails.GameRefundPolicy)
local GameDetailNotificationsButtonHintModule = require(Modules1.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint)
local ExperienceDescriptionModule = require(script.Parent.ExperienceDescription)
local IgrsRatingLabelModule = require(script.Parent.IgrsRatingLabel)
local ExperienceLogoTrayModule = require(script.Parent.ExperienceLogoTray)
local ExperienceInfoTableModule = require(script.Parent.ExperienceInfoTable)
local ExperienceDetailsLoadingStatePageModule = require(script.Parent.ExperienceDetailsLoadingStatePage)
local ExperienceMediaGalleryModule = require(script.Parent.ExperienceMediaGallery)
local ExperienceTagsContainerModule = require(script.Parent.ExperienceTagsContainer)
local RecommendedExperienceCarouselModule = require(script.Parent.RecommendedExperienceCarousel)
local ExperienceSongsCarouselModule = require(script.Parent.ExperienceSongsCarousel)
local ApiFetchExperienceDetailsPageCountersModule = require(Modules1.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local EdpSduiUtilsModule = require(script.Parent.EdpSduiUtils)
local UseEdpServerIxpVariablesModule = require(script.Parent.Hooks.useEdpServerIxpVariables)
local UseEdpPerUniverseVisibilityVariablesForUniverseModule = require(script.Parent.Hooks.useEdpPerUniverseVisibilityVariablesForUniverse)
local EdpSocialLinksImpressionsDetectorModule = require(Modules1.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector)
local PlayButtonContextualMessageImpressionsDetector = GamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector
local GameDetailTelemetryModule = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local EDPTTIConstants = GameDetailTelemetryModule.EDPTTIConstants
local FFlagEDPTTITrackingEnabled = GameDetailTelemetryModule.FFlagEDPTTITrackingEnabled
local UseEDPTTITrackingModule = require(script.Parent.useEDPTTITracking)
local UseFirstMediaCarouselImageUriFunction = require(script.Parent.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri
local UseSelectedGameMediaEntriesModule = require(script.Parent.Hooks.useSelectedGameMediaEntries)
local UseMediaGalleryVideoAnalyticsFunction = require(CorePackages.Workspace.Packages.MediaGallery).useMediaGalleryVideoAnalytics
local GetFFlagEnableTenftUiDetailsMoreDropupMenuFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu
local GetFFlagExpDetailsUseSelectionBumpersFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers
local FFlagExperienceDetailsTextUseTokensModule = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local GetFFlagLuaAppEnableNotificationsEDPTooltipModule = require(Modules1.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip)
local GetFIntNotificationsEDPTooltipTimeLimitModule = require(Modules1.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit)
local GetFFlagConsoleApplyTokenizationEdpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpFixDefaultBanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagLuaAppExperienceDetailsLayoutOrderConfig = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEnableConsolidatedGameRefundPolicy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagEnableCreatorSubtitleNavigationModule = require(Modules1.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation)
local FFlagCreatorSubtitleNavigationIXPEnabledModule = require(Modules1.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled)
local FStringCreatorSubtitleNavigationExperimentLayerModule = require(Modules1.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer)
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppUnifyPlayButtonNonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable
local FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local FFlagLuaAppGameStatsFallbackRendering = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGameStatsFallbackRendering
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagEnablePlayWithRewardNonPeekviewEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardNonPeekviewEdp
local GetFFlagUIBloxUseFoundationButtonFunction = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppEdpConsoleMediaGalleryVideo = SharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppEdpConsoleMediaGalleryVideoMute = SharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideoMute
local PlayWithRewardNonPeekviewEdpLayoutOrder = game:DefineFastInt("PlayWithRewardNonPeekviewEdpLayoutOrder", 75)
local v1 = if FFlagLuaAppGameStatsFallbackRendering then "--" else nil
local PortraitLayoutConfig = {
	MediaGalleryMediaFirst = 100,
	EventsListRedesign = 200,
	Description = 300,
	MediaGallery = 400,
	IgrsRatingLabel = 450,
	ExperienceRatings = 500,
	PlaysAndVisits = 600,
	CommunityLink = 700,
	ExperienceInfoTable = 800,
	RefundPolicy = 900,
	LogoTraySection = 1000,
	Notice = 1200,
	RecommendedExperiences = 1300,
	ExperienceSongsCarousel = 1400,
	SduiFeedItemsDefault = 1500,
	PlayWithReward = if FFlagEnablePlayWithRewardNonPeekviewEdp then PlayWithRewardNonPeekviewEdpLayoutOrder else nil
}
local LandscapeLayoutConfig = {
	MediaGallery = 100,
	EventsListRedesign = 200,
	Description = 300,
	IgrsRatingLabel = 350,
	RecommendedExperiences = 500,
	ExperienceSongsCarousel = 600,
	ExperienceRatings = 700,
	PlaysAndVisits = 800,
	CommunityLink = 900,
	ExperienceInfoTable = 1000,
	RefundPolicy = 1100,
	LogoTraySection = 1200,
	Notice = 1300,
	SduiFeedItemsDefault = 1500,
	PlayWithReward = if FFlagEnablePlayWithRewardNonPeekviewEdp then PlayWithRewardNonPeekviewEdpLayoutOrder else nil
}
local ExperienceDetailsPage = RoactModule.PureComponent:extend("ExperienceDetailsPage")
ExperienceDetailsPage.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	referralSource = TModule.optional(TModule.string),
	experienceJoinData = if FFlagLuaAppUnifyPlayButtonNonMobileEdp or FFlagEnablePlayWithRewardNonPeekviewEdp then TModule.optional(TModule.table) else nil,
	placeIdOverride = TModule.optional(TModule.string),
	onClose = TModule.callback,
	thumbnail = TModule.optional(TModule.table),
	bannerImageId = TModule.optional(TModule.string),
	defaultBannerUrl = if FFlagLuaAppEdpFixDefaultBanner then TModule.optional(TModule.string) else nil,
	gameInfo = TModule.optional(TModule.table),
	gameDetail = TModule.optional(TModule.table),
	gameDetailError = TModule.optional(TModule.table),
	creatorVerified = TModule.optional(TModule.boolean),
	gameDetailsPageDataStatus = TModule.optional(TModule.string),
	gameProductInfo = TModule.optional(TModule.table),
	socialLinks = TModule.optional(TModule.table),
	ageRecommendations = TModule.optional(AgeRecommendationDetails.validateModel),
	communityLink = TModule.optional(TModule.table),
	gameFollowings = TModule.optional(TModule.table),
	sduiFeedItemConfigs = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then TModule.optional(TModule.table) else nil,
	playWithRewardData = if FFlagEnablePlayWithRewardNonPeekviewEdp then TModule.optional(TModule.table) else nil,
	showPlayWithReward = if FFlagEnablePlayWithRewardNonPeekviewEdp then TModule.optional(TModule.boolean) else nil,
	isPlayable = if FFlagEnablePlayWithRewardNonPeekviewEdp then TModule.optional(TModule.boolean) else nil,
	communityLinksEnabled = TModule.optional(TModule.boolean),
	communityLinkVariant = TModule.optional(TModule.string),
	enableNotificationsDiscoverability = TModule.optional(TModule.boolean),
	mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then TModule.optional(TModule.boolean) else nil,
	mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then TModule.optional(TModule.boolean) else nil,
	showSongCarousel = if FFlagSongEdpCarouselIxp then TModule.optional(TModule.boolean) else nil,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	shouldInterleaveSduiIxp = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then TModule.optional(TModule.boolean) else nil,
	edpServerIxpVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then TModule.optional(TModule.table) else nil,
	edpPerUniverseVisibilityVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then TModule.optional(TModule.table) else nil,
	hideCloseButton = TModule.optional(TModule.boolean),
	hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil,
	unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil,
	fetchGameDetailsPageData = TModule.callback,
	openLeaveRobloxAlertUIBlox = TModule.callback,
	openMoreContextualMenu = TModule.callback,
	openShareContextualMenu = TModule.callback,
	closeAlert = TModule.callback,
	openVerifiedBadgeModal = TModule.optional(TModule.callback),
	openCreatorPage = if FFlagEnableCreatorSubtitleNavigationModule then nil else TModule.callback,
	openCommunityProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then TModule.optional(TModule.callback) else nil,
	openUserProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then TModule.optional(TModule.callback) else nil,
	openExperienceGuidelinesExplained = TModule.callback,
	toggleFollowExperience = TModule.optional(TModule.callback),
	openRefundPolicyLearnMorePage = TModule.callback,
	openWebview = TModule.callback,
	onMediaGalleryPreviewActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	onMediaGalleryThumbnailActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	onMediaGalleryEnterFullscreen = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	onMediaGalleryExitFullscreen = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	videoAnalytics = if FFlagLuaAppEdpConsoleMediaGalleryVideo then TModule.optional(TModule.table) else nil,
	linking = TModule.table,
	playabilityStatus = TModule.optional(TModule.table),
	playButtonState = TModule.string,
	onPlayButtonActivated = TModule.callback,
	onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then TModule.callback else nil,
	playButtonContextualMessage = TModule.optional(TModule.string),
	deviceType = TModule.optional(TModule.string),
	detailsPageConfiguration = TModule.optional(TModule.table),
	viewWidth = TModule.optional(TModule.number),
	viewHeight = TModule.optional(TModule.number),
	setControllerBarNavigation = TModule.optional(TModule.callback),
	uiModeInfo = TModule.optional(TModule.any),
	focusGuiObject = TModule.optional(TModule.callback),
	tokens = TModule.strictInterface({
		thumbnailSize = TModule.optional(TModule.number),
		thumbnailMargin = TModule.optional(TModule.number),
		thumbnailShadowHeight = TModule.optional(TModule.number),
		sideMargin = TModule.optional(TModule.number),
		headerItemPadding = TModule.optional(TModule.number),
		headerDescriptionMaxRows = TModule.optional(TModule.number),
		headerDescriptionLineHeight = TModule.optional(TModule.number),
		actionBarButtonBackgroundColor = TModule.optional(TModule.table),
		actionBarTextButtonPadding = TModule.optional(TModule.Vector2),
		headerGradientHeight = TModule.optional(TModule.number),
		headerBarBackgroundHeight = TModule.optional(TModule.number),
		headerBottomMargin = TModule.optional(TModule.number),
		animationConfig = TModule.optional(TModule.table),
		itemPadding = TModule.optional(TModule.number),
		safeAreaSize = TModule.optional(TModule.Vector2),
		trailingWhitespace = TModule.optional(TModule.number),
		iconSize = TModule.optional(TModule.number),
		expandableAreaHeightOffset = if GetFFlagConsoleApplyTokenizationEdpFunction() then TModule.optional(TModule.number) else nil,
		actionBarHeight = TModule.optional(TModule.number)
	}),
	webViewSupport = TModule.boolean,
	notificationsCanEnableExperience = TModule.optional(TModule.boolean),
	experienceDetailsNoticeType = TModule.optional(TModule.string),
	iconButtonSize = TModule.optional(TModule.UDim2),
	textButtonSize = TModule.optional(TModule.UDim2),
	playButtonSize = TModule.optional(TModule.UDim2),
	actionBarHeight = TModule.optional(TModule.number),
	statsAndInfoRef = TModule.optional(TModule.table),
	playButtonRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	containerRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	foundationTokens = TModule.optional(TModule.table),
	disableStickyActionBar = TModule.optional(TModule.boolean)
})

local function _(Text): string
	return if Text then "rbxassetid://" .. Text else ""
end

local config = {
	showEventsList = true,
	showLogoTraySection = true,
	showCornerGradientPropEnabled = false,
	showCommunityLink = false
}

function ExperienceDetailsPage.init(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), AbbreviateCountFunction (copy), UiMode (copy), GetFFlagEnableTenftUiDetailsMoreDropupMenuFunction (copy), FFlagEnableLeftNavOnConsole (copy), DisplayModule (copy), MemoizeFunction (copy), Text (copy), FFlagLuaAppGameStatsFallbackRendering (copy), RoactModule (copy), StyledTextLabel (copy), GetFFlagLuaAppEnableNotificationsEDPTooltipModule (copy), WithStyleFunction (copy), FFlagExperienceDetailsTextUseTokensModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagCreatorSubtitleNavigationIXPEnabledModule (copy), IXPServiceWrapper (copy), FStringCreatorSubtitleNavigationExperimentLayerModule (copy), AppPage (copy), UrlBuilder (copy), TransitionAnimationModule (copy), FFlagEnableCreatorSubtitleNavigationModule (copy), VerifiedBadgesModule (copy), ReactModule (copy), ExperienceTagsContainerModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameStats (copy), PlayerCount (copy), v1 (copy), Images (copy), ExperienceDescriptionModule (copy), RetrievalStatus (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), WithLocalizationFunction (copy), PlayButtonContextualMessageImpressionsDetector (copy), IgrsRatingLabelModule (copy), ConstantsModule (copy), OpenExternalBrowserModule (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), AppCommonLibModule (copy), ExperienceLogoTrayModule (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), EdpSocialLinksImpressionsDetectorModule (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), ExperienceMediaGalleryModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), ExperienceRatings (copy), ExperienceInfoTableModule (copy), EventsListWrapperModule (copy), RecommendedExperienceCarouselModule (copy), FFlagSongEdpCarouselIxp (copy), ExperienceSongsCarouselModule (copy), ExperienceCommunityLink (copy), CheckAndFormatPossibleLinkFunction (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), GameRefundPolicyModule (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), PlayWithRewardComponent (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), PortraitLayoutConfig (copy), LandscapeLayoutConfig (copy), ContentPosition (copy), GetFFlagExpDetailsUseSelectionBumpersFunction (copy), ExperienceDetailsExperimentationModule (copy), ExperienceDetailsNoticeType (copy), FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), MediaGalleryVideoItemModule (copy), IXPService (copy), AppUserLayers (copy), VideoPlaybackCoordinator (copy), AppStorageService (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	function p1.applyTokenScaling(p2)
		-- upvalues: p1 (copy)
		return p2 * p1.props.foundationTokens.Stroke.Standard
	end
	
	function p1.getAbbreviateCount(Price)
		-- upvalues: AbbreviateCountFunction (upval), NewLocalization (copy)
		return AbbreviateCountFunction(Price, NewLocalization:GetLocale())
	end
	
	function p1.upperString(p2): string
		-- upvalues: NewLocalization (copy)
		return string.upper(NewLocalization:Format(p2))
	end
	
	function p1.onPlayButtonActivated()
		-- upvalues: p1 (copy)
		return p1.props.onPlayButtonActivated()
	end
	
	function p1.openMoreContextualMenu(Frame: Frame)
		-- upvalues: p1 (copy), UiMode (upval), GetFFlagEnableTenftUiDetailsMoreDropupMenuFunction (upval), FFlagEnableLeftNavOnConsole (upval), DisplayModule (upval)
		local UniverseId = p1.props.universeId
		local v2: Vector2? = nil
		local IsUiModeMatch: boolean = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		local _UDim2 = nil
		
		if GetFFlagEnableTenftUiDetailsMoreDropupMenuFunction() and IsUiModeMatch then
			local DeviceSafePadding = if FFlagEnableLeftNavOnConsole then DisplayModule.GetDisplayStore().getDeviceSafePadding() else nil
			v2 = Vector2.new(0, 1)
			_UDim2 = UDim2.fromOffset(Frame.AbsolutePosition.X, Frame.AbsolutePosition.Y - 12 + (if FFlagEnableLeftNavOnConsole then DeviceSafePadding.top else 0))
		else
			_UDim2 = UDim2.fromOffset(Frame.AbsolutePosition.X + Frame.AbsoluteSize.X - 300, Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y + 12)
		end
		return p1.props.openMoreContextualMenu(UniverseId, _UDim2, v2, p1.props.hideCloseButton)
	end
	
	p1.getTextHeight = MemoizeFunction(function(p2, p3, p4, p5)
		-- upvalues: Text (upval)
		return Text.GetTextHeight(p2, p3, p4, p5)
	end)
	
	function p1.openShareContextualMenu(Frame: Frame)
		-- upvalues: p1 (copy)
		return p1.props.openShareContextualMenu(p1.props.universeId, UDim2.fromOffset(Frame.AbsolutePosition.X + Frame.AbsoluteSize.X - 300, Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y + 12), p1.props.hideCloseButton)
	end
	
	function p1.getPlaysAnsVisitsInfo(GameDetail, PlaysAnsVisitsInfo)
		-- upvalues: FFlagLuaAppGameStatsFallbackRendering (upval)
		return {
			plays = GameDetail and GameDetail.playing or (PlaysAnsVisitsInfo and PlaysAnsVisitsInfo.playerCount or (if FFlagLuaAppGameStatsFallbackRendering then nil else 0)),
			visits = GameDetail and GameDetail.visits or (if FFlagLuaAppGameStatsFallbackRendering then nil else 0),
			totalUpVotes = PlaysAnsVisitsInfo and PlaysAnsVisitsInfo.totalUpVotes or 0,
			totalDownVotes = PlaysAnsVisitsInfo and PlaysAnsVisitsInfo.totalDownVotes or 1
		}
	end
	
	function p1.getStyledTextLabel(Text, TitleLarge, ColorStyle)
		-- upvalues: RoactModule (upval), StyledTextLabel (upval)
		return if Text then RoactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			richText = false,
			lineHeight = 1,
			text = Text,
			fontStyle = TitleLarge,
			colorStyle = ColorStyle,
			automaticSize = Enum.AutomaticSize.XY
		}) else nil
	end
	
	function p1.toggleFollowExperience()
		-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltipModule (upval), p1 (copy)
		if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then
			p1:setState({ isNotificationsTooltipActive = false })
		end
		if not p1.props.gameFollowings then return end
		local UniverseId = p1.props.universeId
		local IsFollowed = p1.props.gameFollowings.isFollowed
		
		if p1.props.toggleFollowExperience then
			p1.props.toggleFollowExperience(UniverseId, not IsFollowed)
		end
	end
	
	function p1.renderSubtitleTextOverride(Text, CreatorId, CreatorType, _, p2, IsNotUiModeMatch)
		-- upvalues: WithStyleFunction (upval), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), AppPage (upval), UrlBuilder (upval), NewLocalization (copy), TransitionAnimationModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), p1 (copy), VerifiedBadgesModule (upval)
		local function _(Text)
			-- upvalues: WithStyleFunction (upval), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), IsNotUiModeMatch (copy), AppPage (upval), UrlBuilder (upval), CreatorType (copy), CreatorId (copy), NewLocalization (upval), TransitionAnimationModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), p1 (upval)
			return WithStyleFunction(function(p3)
				-- upvalues: FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), Text (copy), IsNotUiModeMatch (upval), AppPage (upval), UrlBuilder (upval), CreatorType (upval), CreatorId (upval), NewLocalization (upval), TransitionAnimationModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), p1 (upval)
				local TitleLarge = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.TitleLarge else p3.Tokens.Semantic.Typography.Subheader else p3.Font.Header2
				local FontSize = if FFlagExperienceDetailsTextUseTokensModule then TitleLarge.FontSize else TitleLarge.RelativeSize * p3.Font.BaseSize
				local TextMuted = p3.Theme.TextMuted
				
				if FFlagCreatorSubtitleNavigationIXPEnabledModule then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringCreatorSubtitleNavigationExperimentLayerModule)
				end
				if Text and IsNotUiModeMatch then
					local config = {
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.game.info.creator({ creatorType = CreatorType, creatorId = CreatorId }),
						extraProps = {
							title = NewLocalization:Format("Feature.GameDetails.Label.Developer"),
							transitionAnimation = TransitionAnimationModule.SlideInFromRight
						}
					}
					
					return RoactModule.createElement("TextButton", {
						Text = Text,
						Font = TitleLarge.Font,
						TextColor3 = TextMuted.Color,
						LayoutOrder = 2,
						AutoButtonColor = false,
						LineHeight = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextSize = FontSize,
						BackgroundTransparency = 1,
						[RoactModule.Event.Activated] = function()
							-- upvalues: FFlagEnableCreatorSubtitleNavigationModule (upval), CreatorType (upval), p1 (upval), CreatorId (upval), config (copy)
							if not FFlagEnableCreatorSubtitleNavigationModule then
								p1.props.openCreatorPage(config)
							elseif CreatorType == "User" then
								p1.props.openUserProfilePage(CreatorId, "ExperienceDetailsPage:SubTitle")
								
								return
							else
								if CreatorType == "Group" then
									p1.props.openCommunityProfilePage(CreatorId, "ExperienceDetailsPage:SubTitle")
									
									return
								end
							end
						end
					})
				else
					return p1.getStyledTextLabel(Text, TitleLarge, TextMuted)
				end
			end)
		end
		
		return RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
			layoutOrder = 2,
			emoji = if p2 then VerifiedBadgesModule.emoji.verified else "",
			onActivated = if p2 and IsNotUiModeMatch then p1.props.openVerifiedBadgeModal else nil
		}, {
			userText = WithStyleFunction(function(p3)
				-- upvalues: FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), Text (copy), IsNotUiModeMatch (copy), AppPage (upval), UrlBuilder (upval), CreatorType (copy), CreatorId (copy), NewLocalization (upval), TransitionAnimationModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), p1 (upval)
				local TitleLarge = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.TitleLarge else p3.Tokens.Semantic.Typography.Subheader else p3.Font.Header2
				local FontSize = if FFlagExperienceDetailsTextUseTokensModule then TitleLarge.FontSize else TitleLarge.RelativeSize * p3.Font.BaseSize
				local TextMuted = p3.Theme.TextMuted
				
				if FFlagCreatorSubtitleNavigationIXPEnabledModule then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringCreatorSubtitleNavigationExperimentLayerModule)
				end
				if Text and IsNotUiModeMatch then
					local config = {
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.game.info.creator({ creatorType = CreatorType, creatorId = CreatorId }),
						extraProps = {
							title = NewLocalization:Format("Feature.GameDetails.Label.Developer"),
							transitionAnimation = TransitionAnimationModule.SlideInFromRight
						}
					}
					
					return RoactModule.createElement("TextButton", {
						Text = Text,
						Font = TitleLarge.Font,
						TextColor3 = TextMuted.Color,
						LayoutOrder = 2,
						AutoButtonColor = false,
						LineHeight = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextSize = FontSize,
						BackgroundTransparency = 1,
						[RoactModule.Event.Activated] = function()
							-- upvalues: FFlagEnableCreatorSubtitleNavigationModule (upval), CreatorType (upval), p1 (upval), CreatorId (upval), config (copy)
							if not FFlagEnableCreatorSubtitleNavigationModule then
								p1.props.openCreatorPage(config)
							elseif CreatorType == "User" then
								p1.props.openUserProfilePage(CreatorId, "ExperienceDetailsPage:SubTitle")
								
								return
							else
								if CreatorType == "Group" then
									p1.props.openCommunityProfilePage(CreatorId, "ExperienceDetailsPage:SubTitle")
									
									return
								end
							end
						end
					})
				else
					return p1.getStyledTextLabel(Text, TitleLarge, TextMuted)
				end
			end)
		})
	end
	
	function p1.renderTextOverride(p2, _, _, p3)
		-- upvalues: WithStyleFunction (upval), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (copy), RoactModule (upval), VerifiedBadgesModule (upval)
		local function _(p4)
			-- upvalues: WithStyleFunction (upval), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval)
			return WithStyleFunction(function(p5)
				-- upvalues: FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval), p4 (copy)
				return p1.getStyledTextLabel(p4, if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p5.Tokens.Typography.TitleLarge else p5.Tokens.Semantic.Typography.Subheader else p5.Font.Header2, p5.Theme.TextEmphasis)
			end)
		end
		
		return RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
			layoutOrder = 0,
			emoji = if p3 then VerifiedBadgesModule.emoji.verified else "",
			size = UDim2.fromScale(0, 1)
		}, {
			userText = WithStyleFunction(function(p4)
				-- upvalues: FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval), p2 (copy)
				return p1.getStyledTextLabel(p2, if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p4.Tokens.Typography.TitleLarge else p4.Tokens.Semantic.Typography.Subheader else p4.Font.Header2, p4.Theme.TextEmphasis)
			end)
		})
	end
	
	p1.renderExperienceGuidelines = MemoizeFunction(function(UniverseId)
		-- upvalues: ReactModule (upval), ExperienceTagsContainerModule (upval), p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		return ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ExperienceTagsContainer = ReactModule.createElement(ExperienceTagsContainerModule, {
				areTagsInteractable = true,
				includeAgeRecommendations = true,
				LayoutOrder = 1,
				universeId = UniverseId,
				hideCloseButton = p1.props.hideCloseButton,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			})
		})
	end)
	p1.renderInlinePlayerCountAndLikes = MemoizeFunction(function(PlayerCount, TotalUpVotes, TotalDownVotes)
		-- upvalues: RoactModule (upval), GameStats (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, 120, 0, 20)
		}, {
			GameStats = RoactModule.createElement(GameStats, {
				stats = {
					playerCount = PlayerCount,
					totalUpVotes = TotalUpVotes,
					totalDownVotes = TotalDownVotes
				}
			})
		})
	end)
	
	function p1.renderBriefDescription(p2, Text)
		-- upvalues: WithStyleFunction (upval), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (copy), RoactModule (upval), StyledTextLabel (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval), Text (copy), RoactModule (upval), StyledTextLabel (upval)
			local _Font = p3.Font
			local HeaderDescriptionLineHeight = p2.headerDescriptionLineHeight
			local ScaledHeaderDescriptionLineHeight = HeaderDescriptionLineHeight * math.floor(_Font.BaseSize * _Font.Body.RelativeSize) * p2.headerDescriptionMaxRows
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, (math.min(p1.getTextHeight(Text, if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.BodyLarge.Font else p3.Tokens.Semantic.Typography.Body.Font else _Font.Body.Font, if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.BodyLarge.FontSize else p3.Tokens.Semantic.Typography.Body.FontSize else _Font.BaseSize * _Font.Body.RelativeSize, UDim2.new(1, 0, 0, ScaledHeaderDescriptionLineHeight)), ScaledHeaderDescriptionLineHeight)))
			}, {
				GameDescriptionText = RoactModule.createElement(StyledTextLabel, {
					richText = false,
					fluidSizing = false,
					text = Text,
					fontStyle = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.BodyLarge else p3.Tokens.Semantic.Typography.Body else _Font.Body,
					colorStyle = p3.Theme.TextEmphasis,
					size = UDim2.fromScale(1, 1),
					lineHeight = HeaderDescriptionLineHeight
				})
			})
		end)
	end
	
	function p1.renderInfoContent(Tokens, UniverseId, Name, CreatorId, CreatorType, CreatorVerified, Description, Plays, TotalUpVotes, TotalDownVotes)
		-- upvalues: p1 (copy), UiMode (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), RoactModule (upval)
		local IsUiModeMatch: boolean = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		local HeaderItemPadding = Tokens and Tokens.headerItemPadding or 0
		local v2: boolean = IsUiModeMatch and (Description ~= nil and #Description > 0)
		local NoIsUiModeMatch = not IsUiModeMatch
		
		return function()
			-- upvalues: FFlagEnableCreatorSubtitleNavigationModule (upval), p1 (upval), Name (copy), CreatorId (copy), CreatorType (copy), UniverseId (copy), CreatorVerified (copy), UiMode (upval), RoactModule (upval), HeaderItemPadding (copy), IsUiModeMatch (copy), Plays (copy), TotalUpVotes (copy), TotalDownVotes (copy), v2 (copy), Tokens (copy), Description (copy), NoIsUiModeMatch (copy)
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, HeaderItemPadding)
				}),
				SubtitleText = if FFlagEnableCreatorSubtitleNavigationModule then p1.renderSubtitleTextOverride(Name, CreatorId, CreatorType, UniverseId, CreatorVerified, p1.props.uiModeInfo.uiMode ~= UiMode.TenFoot) else p1.renderSubtitleTextOverride(Name, CreatorId, CreatorType, UniverseId, CreatorVerified),
				Padding = if HeaderItemPadding then RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, HeaderItemPadding) }) else nil,
				PlayStats = if IsUiModeMatch then p1.renderInlinePlayerCountAndLikes(Plays, TotalUpVotes, TotalDownVotes) else nil,
				Description = if v2 then p1.renderBriefDescription(Tokens, Description) else nil,
				ExperienceGuidelinesComponent = if NoIsUiModeMatch then p1.renderExperienceGuidelines(UniverseId) else nil
			})
		end
	end
	
	p1.renderPlaysAndVisits = MemoizeFunction(function(p2, p3)
		-- upvalues: RoactModule (upval), PlayerCount (upval), FFlagLuaAppGameStatsFallbackRendering (upval), v1 (upval), p1 (copy), Images (upval)
		return function()
			-- upvalues: RoactModule (upval), PlayerCount (upval), FFlagLuaAppGameStatsFallbackRendering (upval), p2 (copy), v1 (upval), p1 (upval), Images (upval), p3 (copy)
			return RoactModule.createElement(PlayerCount, {
				layoutOrder = 1,
				countLeft = {
					countText = if FFlagLuaAppGameStatsFallbackRendering and p2 == nil then v1 else p1.getAbbreviateCount(p2),
					labelText = p1.upperString("Feature.GameDetails.Label.Playing"),
					icon = Images["icons/status/games/people-playing_large"]
				},
				countRight = {
					countText = if FFlagLuaAppGameStatsFallbackRendering and p3 == nil then v1 else p1.getAbbreviateCount(p3),
					labelText = p1.upperString("Feature.GameDetails.Label.Visits"),
					icon = Images["icons/status/games/sessions_large"]
				}
			})
		end
	end)
	
	function p1.onFocusChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.setControllerBarNavigation then
			p1.props.setControllerBarNavigation(not p2)
		end
	end
	
	p1.renderDescription = MemoizeFunction(function(p2, DescriptionText)
		-- upvalues: RoactModule (upval), ExperienceDescriptionModule (upval), RetrievalStatus (upval), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval)
		return function()
			-- upvalues: RoactModule (upval), ExperienceDescriptionModule (upval), RetrievalStatus (upval), p2 (copy), DescriptionText (copy), p1 (upval), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval)
			return RoactModule.createElement(ExperienceDescriptionModule, {
				dataStatus = RetrievalStatus.fromRawValue(p2),
				descriptionText = DescriptionText,
				onFocusChanged = p1.onFocusChanged,
				universeId = if FFlagLuaAppExpandableTextImpressionsEnabled then p1.props.universeId else nil,
				pageContext = if FFlagLuaAppExpandableTextImpressionsEnabled then AppPage.ExperienceDetail else nil,
				componentType = if FFlagLuaAppExpandableTextImpressionsEnabled then "gameDescription" else nil
			})
		end
	end)
	p1.renderNotice = MemoizeFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), RoactModule (upval), ExperienceDescriptionModule (upval), RetrievalStatus (upval), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval)
		return function()
			-- upvalues: WithLocalizationFunction (upval), RoactModule (upval), ExperienceDescriptionModule (upval), RetrievalStatus (upval), p2 (copy), p1 (upval), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval)
			return WithLocalizationFunction({
				noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle",
				noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase"
			})(function(p3)
				-- upvalues: RoactModule (upval), ExperienceDescriptionModule (upval), RetrievalStatus (upval), p2 (upval), p1 (upval), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval)
				return RoactModule.createElement(ExperienceDescriptionModule, {
					dataStatus = RetrievalStatus.fromRawValue(p2),
					headerText = p3.noticeHeader,
					descriptionText = p3.noticeText,
					onFocusChanged = p1.onFocusChanged,
					universeId = if FFlagLuaAppExpandableTextImpressionsEnabled then p1.props.universeId else nil,
					pageContext = if FFlagLuaAppExpandableTextImpressionsEnabled then AppPage.ExperienceDetail else nil,
					componentType = if FFlagLuaAppExpandableTextImpressionsEnabled then "gameNotice" else nil
				})
			end)
		end
	end)
	
	function p1.renderActionBarLabelImpressionsDetector(ContainerRef, ScrollViewPositionChangedSignal)
		-- upvalues: RoactModule (upval), PlayButtonContextualMessageImpressionsDetector (upval), p1 (copy), AppPage (upval)
		return RoactModule.createElement(PlayButtonContextualMessageImpressionsDetector, {
			containerRef = ContainerRef,
			universeId = p1.props.universeId,
			playabilityStatus = p1.props.playabilityStatus,
			contextualMessage = p1.props.playButtonContextualMessage,
			pageContext = AppPage.ExperienceDetail,
			scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal
		})
	end
	
	p1.renderIgrsRatingLabel = MemoizeFunction(function(IgrsRating, IgrsRatingDisplayMessage, p2, Callback, p3)
		-- upvalues: ReactModule (upval), IgrsRatingLabelModule (upval), ConstantsModule (upval), NewLocalization (copy), OpenExternalBrowserModule (upval)
		return function()
			-- upvalues: ReactModule (upval), IgrsRatingLabelModule (upval), IgrsRating (copy), IgrsRatingDisplayMessage (copy), p2 (copy), Callback (copy), ConstantsModule (upval), NewLocalization (upval), OpenExternalBrowserModule (upval), p3 (copy)
			return ReactModule.createElement(IgrsRatingLabelModule, {
				igrsRating = IgrsRating,
				igrsRatingDisplayMessage = IgrsRatingDisplayMessage,
				onActivated = if p2 then function()
					-- upvalues: Callback (upval), ConstantsModule (upval), NewLocalization (upval)
					Callback(ConstantsModule.INDONESIAN_CONTENT_MATURITY_URL, NewLocalization:Format("Feature.GameDetails.Label.ContentMaturity"))
				end else function()
					-- upvalues: OpenExternalBrowserModule (upval), p3 (upval), ConstantsModule (upval)
					OpenExternalBrowserModule(p3, ConstantsModule.INDONESIAN_CONTENT_MATURITY_URL)
				end
			})
		end
	end)
	p1.renderLogoTray = MemoizeFunction(function(SocialLinks, Linking)
		-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (upval), p1 (copy), ReactModule (upval), AppCommonLibModule (upval), RoactModule (upval), ExperienceLogoTrayModule (upval), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), EdpSocialLinksImpressionsDetectorModule (upval), AppPage (upval)
		return function()
			-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (upval), p1 (upval), ReactModule (upval), AppCommonLibModule (upval), RoactModule (upval), ExperienceLogoTrayModule (upval), SocialLinks (copy), Linking (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), EdpSocialLinksImpressionsDetectorModule (upval), AppPage (upval)
			if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then
				local EXPERIENCEName: string = `EXPERIENCE_SOCIAL_LINKS_{p1.props.universeId}`
				local Ref = ReactModule.createRef()
				local NewResult = AppCommonLibModule.Signal.new()
				
				return ReactModule.createElement(ReactModule.Fragment, nil, {
					ExperienceLogoTray = RoactModule.createElement(ExperienceLogoTrayModule, {
						socialLinks = SocialLinks,
						linking = Linking,
						openLeaveRobloxAlertUIBlox = p1.props.openLeaveRobloxAlertUIBlox,
						closeAlert = p1.props.closeAlert,
						impressionsTag = EXPERIENCEName,
						forwardRef = Ref,
						onAbsolutePositionChanged = function(_)
							-- upvalues: NewResult (copy)
							NewResult:fire()
						end,
						universeId = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then p1.props.universeId else nil
					}),
					EdpSocialLinksImpressionsDetector = RoactModule.createElement(EdpSocialLinksImpressionsDetectorModule, {
						parentRef = Ref,
						scrollViewPositionChangedSignal = NewResult,
						pageContext = AppPage.ExperienceDetail,
						impressionsTag = EXPERIENCEName,
						socialLinks = SocialLinks,
						universeId = p1.props.universeId
					})
				})
			else
				return RoactModule.createElement(ExperienceLogoTrayModule, {
					socialLinks = SocialLinks,
					linking = Linking,
					openLeaveRobloxAlertUIBlox = p1.props.openLeaveRobloxAlertUIBlox,
					closeAlert = p1.props.closeAlert,
					universeId = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then p1.props.universeId else nil
				})
			end
		end
	end)
	
	local function _(p2)
		-- upvalues: p1 (copy)
		if p1.props.setControllerBarNavigation then
			p1.props.setControllerBarNavigation(p2)
		end
	end
	
	function p1.onMediaGalleryPreviewActivated(MediaGalleryShowIndex, p2)
		-- upvalues: p1 (copy), UiMode (upval), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppDesktopMediaGalleryTelemetry (upval)
		local IsUiModeMatch: boolean = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		
		if not p1.state.isFullscreen and IsUiModeMatch and p1.props.setControllerBarNavigation then
			p1.props.setControllerBarNavigation(false)
		end
		p1:setState({
			isFullscreen = true,
			mediaGalleryShowIndex = MediaGalleryShowIndex,
			currentIndex = if IsUiModeMatch then MediaGalleryShowIndex else nil
		})
		
		if FFlagLuaAppEdpMediaGalleryRedesignTelemetry and p1.props.onMediaGalleryEnterFullscreen then
			p1.props.onMediaGalleryEnterFullscreen(MediaGalleryShowIndex, p2)
			
			return
		end
		if FFlagLuaAppDesktopMediaGalleryTelemetry and p1.props.onMediaGalleryPreviewActivated then
			p1.props.onMediaGalleryPreviewActivated(MediaGalleryShowIndex)
		end
	end
	
	p1.renderMediaGallery = MemoizeFunction(function(UniverseId, IsFullscreenState)
		-- upvalues: p1 (copy), UiMode (upval), RoactModule (upval), ExperienceMediaGalleryModule (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppDesktopMediaGalleryTelemetry (upval), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval)
		local IsUiModeMatch: boolean = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		
		return if IsUiModeMatch then function()
			-- upvalues: RoactModule (upval), ExperienceMediaGalleryModule (upval), p1 (upval), UniverseId (copy), IsFullscreenState (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement(ExperienceMediaGalleryModule, {
				tokens = p1.props.tokens,
				deviceType = p1.props.deviceType,
				universeId = UniverseId,
				onPreviewActivated = p1.onMediaGalleryPreviewActivated,
				isFullscreenState = IsFullscreenState,
				exitFullscreen = p1.onClose,
				onSelectionGained = p1.onSelectionGained,
				mediaGalleryGainFocused = p1.mediaGalleryGainFocused,
				uiMode = p1.props.uiModeInfo.uiMode,
				toggleMuteSignal = if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then p1.consoleVideoMuteSignal else nil,
				videoAnalytics = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p1.props.videoAnalytics else nil,
				videoPlaybackCoordinator = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p1.videoPlaybackCoordinator else nil,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			})
		end else function()
			-- upvalues: RoactModule (upval), ExperienceMediaGalleryModule (upval), p1 (upval), UniverseId (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppDesktopMediaGalleryTelemetry (upval), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), IsFullscreenState (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement(ExperienceMediaGalleryModule, {
				deviceType = p1.props.deviceType,
				universeId = UniverseId,
				startIndex = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.state.mediaGalleryShowIndex else nil,
				onPreviewActivated = p1.onMediaGalleryPreviewActivated,
				onThumbnailActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.props.onMediaGalleryThumbnailActivated else nil,
				onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.props.onMediaGalleryMediaChanged else nil,
				isOccluded = if FFlagLuaAppEdpMediaGalleryFullScreen and (FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryVideoPreview) then IsFullscreenState else nil,
				mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
				mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			})
		end
	end)
	p1.renderExperienceRating = MemoizeFunction(function(UniverseId)
		-- upvalues: RoactModule (upval), ExperienceRatings (upval), p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		return function()
			-- upvalues: RoactModule (upval), ExperienceRatings (upval), UniverseId (copy), p1 (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement(ExperienceRatings, {
				universeId = UniverseId,
				height = math.floor((p1.applyTokenScaling(72))),
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil,
				styleProps = {
					statWidgetIconSize = math.floor((p1.applyTokenScaling(48)))
				}
			})
		end
	end)
	p1.renderExperienceInfoTable = MemoizeFunction(function(UniverseId)
		-- upvalues: RoactModule (upval), p1 (copy), ExperienceInfoTableModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		return function()
			-- upvalues: RoactModule (upval), p1 (upval), ExperienceInfoTableModule (upval), UniverseId (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement("Folder", { [RoactModule.Ref] = p1.props.statsAndInfoRef }, RoactModule.createElement(ExperienceInfoTableModule, {
				key = "ExperienceInfoTable",
				renderTextOverride = p1.renderTextOverride,
				universeId = UniverseId,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil,
				hideCloseButton = p1.props.hideCloseButton
			}))
		end
	end)
	p1.renderEventsList = MemoizeFunction(function(UniverseId, p2)
		-- upvalues: RoactModule (upval), EventsListWrapperModule (upval)
		return function()
			-- upvalues: RoactModule (upval), EventsListWrapperModule (upval), UniverseId (copy), p2 (copy)
			return RoactModule.createElement(EventsListWrapperModule, {
				referralSource = "expDetailsPage",
				universeId = UniverseId,
				defaultThumbnail = if p2 then "rbxassetid://" .. p2 else nil
			})
		end
	end)
	p1.renderRecommendedExperiencesCarousel = MemoizeFunction(function(UniverseId)
		-- upvalues: RoactModule (upval), RecommendedExperienceCarouselModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy), AppPage (upval)
		return function()
			-- upvalues: RoactModule (upval), RecommendedExperienceCarouselModule (upval), UniverseId (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (upval), AppPage (upval)
			return RoactModule.createElement(RecommendedExperienceCarouselModule, {
				universeId = UniverseId,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil,
				pageContext = AppPage.ExperienceDetail
			})
		end
	end)
	
	if FFlagSongEdpCarouselIxp then
		p1.renderExperienceSongsCarousel = MemoizeFunction(function(UniverseId, p2)
			-- upvalues: ReactModule (upval), ExperienceSongsCarouselModule (upval)
			return function()
				-- upvalues: ReactModule (upval), ExperienceSongsCarouselModule (upval), UniverseId (copy), p2 (copy)
				return ReactModule.createElement(ExperienceSongsCarouselModule, {
					fractionalItemAmount = 0,
					collectionOrder = 2,
					clipsDescendants = true,
					universeId = UniverseId,
					universeTitle = p2 or ""
				})
			end
		end)
	end
	p1.renderCommunityLink = MemoizeFunction(function(CommunityInfo, p2, UniverseId)
		-- upvalues: ReactModule (upval), ExperienceCommunityLink (upval)
		return function()
			-- upvalues: ReactModule (upval), ExperienceCommunityLink (upval), CommunityInfo (copy), p2 (copy), UniverseId (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
				ExperienceCommunityLink = ReactModule.createElement(ExperienceCommunityLink, {
					communityInfo = CommunityInfo,
					experienceName = p2 or "",
					universeId = UniverseId
				})
			})
		end
	end)
	p1.linkStartStyle = MemoizeFunction(function(p2): string
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
		local _Color3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Link else p2.Tokens.Semantic.Color.Text.Link).Color3
		
		return `<font color="{string.format("rgb(%d, %d, %d)", math.round(_Color3.R * 255), math.round(_Color3.G * 255), (math.round(_Color3.B * 255)))}"><b>`
	end)
	p1.checkAndFormatPossibleLink = MemoizeFunction(function(p2, p3)
		-- upvalues: CheckAndFormatPossibleLinkFunction (upval), p1 (copy)
		return CheckAndFormatPossibleLinkFunction(p3, nil, nil, p1.linkStartStyle(p2), "</b></font>")
	end)
	p1.renderRefundPolicy = MemoizeFunction(function(RefundPolicy)
		-- upvalues: FFlagLuaAppEnableConsolidatedGameRefundPolicy (upval), WithStyleFunction (upval), RoactModule (upval), GameRefundPolicyModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (copy), ReactModule (upval)
		return function()
			-- upvalues: FFlagLuaAppEnableConsolidatedGameRefundPolicy (upval), WithStyleFunction (upval), RoactModule (upval), GameRefundPolicyModule (upval), RefundPolicy (copy), FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval), ReactModule (upval)
			return if FFlagLuaAppEnableConsolidatedGameRefundPolicy then WithStyleFunction(function(p2)
				-- upvalues: RoactModule (upval), GameRefundPolicyModule (upval), RefundPolicy (upval), FFlagRenameDeprecatedUIBloxTokens (upval)
				return RoactModule.createElement(GameRefundPolicyModule, {
					refundPolicy = RefundPolicy,
					paddingTop = if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_600 else p2.Tokens.Global.Space_300
				})
			end) else WithStyleFunction(function(p2)
				-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval), p1 (upval), RefundPolicy (upval), ReactModule (upval)
				local BodyLarge = if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.BodyLarge else p2.Tokens.Semantic.Typography.Body
				local Muted = if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Muted else p2.Tokens.Semantic.Color.Text.Muted
				local CheckAndFormatPossibleLinkResult, CheckAndFormatPossibleLinkResult2 = p1.checkAndFormatPossibleLink(p2, RefundPolicy.policyText)
				
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_600 else p2.Tokens.Global.Space_300)
					}),
					RefundPolicy = ReactModule.createElement("TextButton", {
						BackgroundTransparency = 1,
						Text = CheckAndFormatPossibleLinkResult2,
						AutomaticSize = Enum.AutomaticSize.XY,
						Font = BodyLarge.Font,
						TextSize = BodyLarge.FontSize,
						TextColor3 = Muted.Color3,
						TextTransparency = Muted.Transparency,
						TextWrapped = true,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = CheckAndFormatPossibleLinkResult,
						[ReactModule.Event.Activated] = function(_)
							-- upvalues: p1 (upval), RefundPolicy (upval)
							p1.props.openRefundPolicyLearnMorePage(RefundPolicy.learnMoreUrl)
						end
					})
				})
			end)
		end
	end)
	
	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		p1.renderPlayWithReward = MemoizeFunction(function(UniverseId, PlaceId, p2, PlaceIdOverride, ExperienceJoinData)
			-- upvalues: RoactModule (upval), PlayWithRewardComponent (upval)
			return function()
				-- upvalues: RoactModule (upval), PlayWithRewardComponent (upval), UniverseId (copy), PlaceId (copy), PlaceIdOverride (copy), ExperienceJoinData (copy), p2 (copy)
				return RoactModule.createElement(PlayWithRewardComponent, {
					useLargerStyles = true,
					universeId = UniverseId,
					placeId = PlaceId,
					placeIdOverride = PlaceIdOverride,
					experienceJoinData = ExperienceJoinData,
					flowId = p2.flowId,
					fetchedUniverseId = p2.universeId,
					isAdDataExpected = p2.isAdDataExpected,
					playWithRewardAdData = p2.adData
				})
			end
		end)
	end
	p1.getBodyComponentListProps = MemoizeFunction(function(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, InExperiencePurchase, List, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27)
		-- upvalues: p1 (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), FFlagEnablePlayWithRewardNonPeekviewEdp (upval), FFlagLuaAppExperienceDetailsLayoutOrderConfig (upval), PortraitLayoutConfig (upval), LandscapeLayoutConfig (upval), ContentPosition (upval), GetFFlagExpDetailsUseSelectionBumpersFunction (upval), ExperienceDetailsExperimentationModule (upval), ExperienceDetailsNoticeType (upval), FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex (upval), FFlagSongEdpCarouselIxp (upval)
		local P97 = p12.showCommunityLink and (p10 and (p11 == "banner" and p9))
		local ShowEventsList = p12.showEventsList
		local v2: boolean = p1.props.webViewSupport and p16 ~= nil
		local IsHidePlayWithReward: boolean = FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable and (if FFlagLuaAppEdpBackendV2SduiInterleaveDefault then p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true else FFlagLuaAppEdpBackendV2SduiInterleaveIxp and (p1.props.shouldInterleaveSduiIxp and (p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true)))
		local NoIsHidePlayWithReward = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then FFlagEnablePlayWithRewardNonPeekviewEdp and (p24 and (p23 and (p22 and not IsHidePlayWithReward))) else nil
		local Description = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.Description else 20
		local MediaGallery = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.MediaGallery else 40
		local MediaGallery1 = if p14 then MediaGallery else Description
		local EventsListRedesign = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.EventsListRedesign else MediaGallery1 - 10
		local EventsListRedesign1 = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.EventsListRedesign else 10
		local Left = ContentPosition.Left
		local NoIsHidePlayWithReward1 = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then NoIsHidePlayWithReward else FFlagEnablePlayWithRewardNonPeekviewEdp and (p24 and (p23 and p22))
		local config = {
			MediaGallery = {
				portraitLayoutOrder = if p14 then Description elseif FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.MediaGalleryMediaFirst else 5,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.MediaGallery else 10,
				landscapePosition = ContentPosition.Right,
				showCornerGradient = not p12.showCornerGradientPropEnabled and nil,
				useSelectionBumper = if GetFFlagExpDetailsUseSelectionBumpersFunction() then true else nil,
				renderComponent = p1.renderMediaGallery(p2, p13)
			},
			Description = {
				portraitLayoutOrder = MediaGallery1,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.Description else 20,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderDescription(p3, p4)
			},
			IgrsRatingLabel = if p17 then {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.IgrsRatingLabel else 45,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.IgrsRatingLabel else 30,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderIgrsRatingLabel(p17, p18, p19, p20, p21)
			} else nil,
			ExperienceRatings = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.hideGameRatings == true) then nil else {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.ExperienceRatings else 50,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.ExperienceRatings else 40,
				landscapePosition = ContentPosition.Left,
				useSelectionBumper = if GetFFlagExpDetailsUseSelectionBumpersFunction() then true else nil,
				renderComponent = p1.renderExperienceRating(p2)
			},
			PlaysAndVisits = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.showVisitsInInfoList == true) then nil else {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.PlaysAndVisits else 60,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.PlaysAndVisits else 50,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderPlaysAndVisits(p6, p7)
			},
			CommunityLink = if P97 then {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.CommunityLink else 70,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.CommunityLink else 60,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderCommunityLink(p9, p5, p2)
			} else nil,
			ExperienceInfoTable = {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.ExperienceInfoTable else 80,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.ExperienceInfoTable else 70,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderExperienceInfoTable(p2)
			},
			RefundPolicy = if v2 then {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.RefundPolicy else 85,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.RefundPolicy else 75,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderRefundPolicy(p16)
			} else nil,
			LogoTraySection = p12.showLogoTraySection and (p8 and next(p8)) and {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.LogoTraySection else 90,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.LogoTraySection else 80,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderLogoTray(p8, p21)
			} or nil,
			EventsList = if ShowEventsList then {
				portraitLayoutOrder = EventsListRedesign,
				landscapeLayoutOrder = EventsListRedesign1,
				landscapePosition = Left,
				renderComponent = p1.renderEventsList(p2, p15)
			} else nil,
			Notice = if InExperiencePurchase == ExperienceDetailsNoticeType.InExperiencePurchase then {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.Notice else 100,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.Notice else 100,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderNotice(p3)
			} else nil,
			RecommendedExperiences = {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.RecommendedExperiences else 110,
				portraitZIndex = if FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then 2 else nil,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.RecommendedExperiences else 30,
				landscapePosition = ContentPosition.Right,
				useSelectionBumper = if GetFFlagExpDetailsUseSelectionBumpersFunction() then true else nil,
				renderComponent = p1.renderRecommendedExperiencesCarousel(p2)
			},
			ExperienceSongsCarousel = if FFlagSongEdpCarouselIxp and p1.props.showSongCarousel then {
				portraitLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then PortraitLayoutConfig.ExperienceSongsCarousel else 120,
				portraitZIndex = if FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then 1 else nil,
				landscapeLayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.ExperienceSongsCarousel else 35,
				landscapePosition = ContentPosition.Right,
				renderComponent = p1.renderExperienceSongsCarousel(p2, p5)
			} else nil,
			PlayWithReward = if NoIsHidePlayWithReward1 then {
				portraitLayoutOrder = PortraitLayoutConfig.PlayWithReward,
				landscapeLayoutOrder = LandscapeLayoutConfig.PlayWithReward,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderPlayWithReward(p2, p25, p22, p26, p27)
			} else nil
		}
		
		if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p1.props.shouldInterleaveSduiIxp) and List then
			for i, value in List do
				config[`SduiFeedItem_{i}`] = {
					portraitLayoutOrder = value.portraitLayoutOrder,
					landscapeLayoutOrder = value.landscapeLayoutOrder,
					landscapePosition = ContentPosition.Left,
					renderComponent = value.renderComponent
				}
			end
		end
		return config
	end)
	
	function p1.onClose()
		-- upvalues: p1 (copy), UiMode (upval)
		if p1.state.isFullscreen then
			p1:setState({ isFullscreen = false })
			
			if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot and p1.props.setControllerBarNavigation then
				p1.props.setControllerBarNavigation(true)
				
				return
			end
		else
			p1.props.onClose()
		end
	end
	
	p1.exitFullscreen = if FFlagLuaAppEdpMediaGalleryFullScreen then function(MediaGalleryShowIndex, p28)
		-- upvalues: p1 (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval)
		if not p1.state.isFullscreen then return end
		if FFlagLuaAppEdpMediaGalleryRedesignTelemetry and p1.props.onMediaGalleryExitFullscreen then
			p1.props.onMediaGalleryExitFullscreen(MediaGalleryShowIndex, p28)
		end
		p1:setState({
			isFullscreen = false,
			mediaGalleryShowIndex = MediaGalleryShowIndex
		})
	end else nil
	p1.focusEventHandlers = {
		[FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlersModule.onRelease(function(p28)
				-- upvalues: p1 (copy)
				p1.onClose()
				p28:cancel()
			end)
		}
	}
	p1.renderFullscreenContent = MemoizeFunction(function(UniverseId, FullscreenShowIndex, IsFullscreenState, IsCrossFade, CurrentIndex, NextIndex)
		-- upvalues: p1 (copy), UiMode (upval), RoactModule (upval), ExperienceMediaGalleryModule (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval)
		local IsUiModeMatch: boolean = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		
		return if IsUiModeMatch then function()
			-- upvalues: RoactModule (upval), ExperienceMediaGalleryModule (upval), p1 (upval), UniverseId (copy), FullscreenShowIndex (copy), IsFullscreenState (copy), IsCrossFade (copy), NextIndex (copy), CurrentIndex (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement(ExperienceMediaGalleryModule, {
				isFullscreen = true,
				tokens = p1.props.tokens,
				universeId = UniverseId,
				fullscreenShowIndex = FullscreenShowIndex,
				deviceType = p1.props.deviceType,
				isFullscreenState = IsFullscreenState,
				isCrossFade = IsCrossFade,
				setCrossFade = p1.setCrossFade,
				nextIndex = NextIndex,
				currentIndex = CurrentIndex,
				setCurrentIndex = p1.setCurrentIndex,
				uiMode = p1.props.uiModeInfo.uiMode,
				toggleMuteSignal = if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then p1.consoleVideoMuteSignal else nil,
				videoAnalytics = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p1.props.videoAnalytics else nil,
				videoPlaybackCoordinator = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p1.videoPlaybackCoordinator else nil,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			})
		end else function()
			-- upvalues: RoactModule (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), p1 (upval), ExperienceMediaGalleryModule (upval), UniverseId (copy), FullscreenShowIndex (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return RoactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = p1.focusEventHandlers
			}, {
				ExperienceMediaGallery = RoactModule.createElement(ExperienceMediaGalleryModule, {
					isFullscreen = true,
					universeId = UniverseId,
					fullscreenShowIndex = FullscreenShowIndex,
					onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.props.onMediaGalleryMediaChanged else nil,
					startIndex = if FFlagLuaAppEdpMediaGalleryFullScreen then FullscreenShowIndex else nil,
					exitFullscreen = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.exitFullscreen else nil,
					mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
					mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil,
					shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
				})
			})
		end
	end)
	p1.renderBackgroundContent = if FFlagLuaAppEdpConsoleMediaGalleryVideo then function(p28, p29, UniverseId)
		-- upvalues: p1 (copy), RoactModule (upval), MediaGalleryVideoItemModule (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval)
		return if p29 and p1.state.selectedVideoId ~= nil and not p28 then RoactModule.createElement(MediaGalleryVideoItemModule, {
			cornerRadius = 0,
			ZIndex = 1,
			isFullscreen = false,
			video = p1.state.selectedVideoId,
			thumbnail = p1.state.selectedVideoThumbnail or "",
			Size = UDim2.fromScale(1, 1),
			itemIndex = p1.state.nextIndex,
			universeId = UniverseId,
			videoAnalytics = p1.props.videoAnalytics,
			hideMuteButton = not FFlagLuaAppEdpConsoleMediaGalleryVideoMute or nil,
			toggleMuteSignal = if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then p1.consoleVideoMuteSignal else nil,
			videoPlaybackCoordinator = p1.videoPlaybackCoordinator
		}) else nil
	end else nil
	
	function p1.resolveTitleText(GameDetail, GameInfo)
		return GameDetail and GameDetail.name or (GameInfo and GameInfo.name or nil)
	end
	
	function p1.checkCommunityLinkExposureLogging()
		-- upvalues: p1 (copy), IXPService (upval), AppUserLayers (upval)
		if p1.props.communityLink then
			IXPService:LogUserLayerExposure(AppUserLayers.EDPCommunityLinksLayer)
		end
	end
	
	if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
		p1.state = {
			isCrossFade = false,
			currentIndex = 1,
			nextIndex = 1,
			bannerImageId = p1.props.bannerImageId
		}
		
		if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then
			p1.consoleVideoMuteSignal = AppCommonLibModule.Signal.new()
		end
		if FFlagLuaAppEdpConsoleMediaGalleryVideo then
			p1.videoPlaybackCoordinator = VideoPlaybackCoordinator.new()
		end
		function p1.setCurrentIndex(CurrentIndex)
			-- upvalues: p1 (copy)
			p1:setState({ currentIndex = CurrentIndex })
		end
		
		function p1.setCrossFade(IsCrossFade)
			-- upvalues: p1 (copy)
			p1:setState({ isCrossFade = IsCrossFade })
		end
		
		function p1.onSelectionGained(NextIndex, BannerImageId, p28, p29)
			-- upvalues: p1 (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), RoactModule (upval)
			if p1.state.nextIndex ~= NextIndex and p1.state.isCrossFade == false then
				p1.setCrossFade(true)
			end
			p1:setState({
				bannerImageId = BannerImageId,
				nextIndex = NextIndex,
				selectedVideoId = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p28 or RoactModule.None else nil,
				selectedVideoThumbnail = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p29 or RoactModule.None else nil
			})
		end
		
		function p1.mediaGalleryGainFocused(p28)
			-- upvalues: p1 (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), RoactModule (upval)
			if not p28 then
				p1:setState({
					bannerImageId = p1.props.bannerImageId,
					selectedVideoId = if FFlagLuaAppEdpConsoleMediaGalleryVideo then RoactModule.None else nil,
					selectedVideoThumbnail = if FFlagLuaAppEdpConsoleMediaGalleryVideo then RoactModule.None else nil
				})
			end
		end
	end
	if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then
		p1.isMounted = false
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("ShowNotificationsOptInTooltip")
		end)
		p1.showTooltip = if Success then Result == "true" else false
		p1:setState({ isNotificationsTooltipActive = p1.showTooltip })
	end
end

function ExperienceDetailsPage.didMount(p2)
	-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltipModule (copy), AppStorageService (copy), PromiseModule (copy), GetFIntNotificationsEDPTooltipTimeLimitModule (copy)
	p2.checkCommunityLinkExposureLogging()
	
	if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then
		p2.isMounted = true
		
		if p2.showTooltip then
			pcall(function()
				-- upvalues: AppStorageService (upval)
				AppStorageService:SetItem("ShowNotificationsOptInTooltip", "false")
				AppStorageService:Flush()
			end)
		end
		PromiseModule.delay(GetFIntNotificationsEDPTooltipTimeLimitModule()):andThen(function()
			-- upvalues: p2 (copy)
			if p2.isMounted then
				p2:setState({ isNotificationsTooltipActive = false })
			end
		end)
	end
end

function ExperienceDetailsPage.didUpdate(p2, p3)
	if not p3.communityLink then
		p2.checkCommunityLinkExposureLogging()
	end
end

function ExperienceDetailsPage.render(p2)
	-- upvalues: LuaAppRemoveEDPLoadingState (copy), RetrievalStatus1 (copy), RoactModule (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	return if LuaAppRemoveEDPLoadingState then if p2.props.gameDetailsPageDataStatus == RetrievalStatus1.Failed and not p2.props.gameInfo then p2:renderOnFailed() else p2:renderOnLoaded() else RoactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(p2.props.gameDetailsPageDataStatus),
		renderOnFailed = function()
			-- upvalues: p2 (copy)
			return if p2.props.gameInfo then p2:renderOnLoaded() else p2:renderOnFailed()
		end,
		renderOnLoaded = function()
			-- upvalues: p2 (copy)
			return p2:renderOnLoaded()
		end,
		renderOnLoading = function()
			-- upvalues: p2 (copy)
			return p2:renderOnLoading()
		end
	})
end

function ExperienceDetailsPage:renderOnLoading()
	-- upvalues: RoactModule (copy), ExperienceDetailsLoadingStatePageModule (copy)
	return RoactModule.createElement(ExperienceDetailsLoadingStatePageModule)
end

function ExperienceDetailsPage.renderOnFailed(p2)
	-- upvalues: WithLocalizationFunction (copy), EnumGameDetailErrorTypes (copy), RoactModule (copy), EmptyState (copy)
	return WithLocalizationFunction({
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
		experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable"
	})(function(p3)
		-- upvalues: p2 (copy), EnumGameDetailErrorTypes (upval), RoactModule (upval), EmptyState (upval)
		local IsErrorTypeMatch: boolean = p2.props.gameDetailError and p2.props.gameDetailError.errorType == EnumGameDetailErrorTypes.ExperienceUnavailable
		
		return RoactModule.createElement(EmptyState, {
			onActivated = if IsErrorTypeMatch then nil else p2.props.fetchGameDetailsPageData,
			text = if IsErrorTypeMatch then p3.experienceUnavailableMessage else p3.failedMessage
		})
	end)
end

function ExperienceDetailsPage.willUnmount(p2)
	-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltipModule (copy)
	if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then
		p2.isMounted = false
	end
end

function ExperienceDetailsPage.renderOnLoaded(p2)
	-- upvalues: UiMode (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), GetPlayButtonPropsFunction (copy), GetFFlagLuaAppEnableNotificationsEDPTooltipModule (copy), DeviceType (copy), GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), CryoModule (copy), Images (copy), RoactModule (copy), ReactModule (copy), GameDetailNotificationsButtonHintModule (copy), TooltipOrientation (copy), WithLocalizationFunction (copy), FFlagLuaAppEdpFixDefaultBanner (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppEnablePlaySquadButton (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy), PlayButton (copy), ButtonSize (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), config (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), DetailsPageSelector (copy)
	local DeviceType1 = p2.props.deviceType
	local UniverseId = p2.props.universeId
	local GameInfo = p2.props.gameInfo
	local Thumbnail = p2.props.thumbnail
	local Tokens = p2.props.tokens
	local IsUiModeMatch: boolean = p2.props.uiModeInfo and p2.props.uiModeInfo.uiMode == UiMode.TenFoot
	local Url = Thumbnail and Thumbnail.url
	local GameDetail = p2.props.gameDetail
	local RootPlaceId = if FFlagEnablePlayWithRewardNonPeekviewEdp then GameDetail and GameDetail.rootPlaceId or GameInfo and GameInfo.placeId else nil
	local Description = GameDetail and GameDetail.description or nil
	local Name = GameDetail and GameDetail.name or nil
	local ResolveTitleTextResult = p2.resolveTitleText(GameDetail, GameInfo)
	local Name1 = GameDetail and GameDetail.creator.name or nil
	local Id = GameDetail and GameDetail.creator.id or nil
	local Type = GameDetail and GameDetail.creator.type or nil
	local Text = nil
	local IgrsRating = nil
	local IgrsRatingDisplayMessage = nil
	
	if p2.props.ageRecommendations then
		local Summary = p2.props.ageRecommendations.summary
		Text = if Summary and Summary.ageRecommendation then if Summary.ageRecommendation.displayNameWithHeaderShort then Summary.ageRecommendation.displayNameWithHeaderShort else Summary.ageRecommendation.displayName else nil
		IgrsRating = if Summary and Summary.ageRecommendation and Summary.ageRecommendation.igrsRating and Summary.ageRecommendation.igrsRating ~= "" then Summary.ageRecommendation.igrsRating else nil
		IgrsRatingDisplayMessage = if Summary and Summary.ageRecommendation and Summary.ageRecommendation.igrsRatingDisplayMessage then Summary.ageRecommendation.igrsRatingDisplayMessage else nil
	end
	local PlaysAnsVisitsInfo = p2.getPlaysAnsVisitsInfo(GameDetail, GameInfo)
	local SocialLinks = p2.props.socialLinks
	local CommunityLink = p2.props.communityLink
	local PlayButtonProps = GetPlayButtonPropsFunction(p2.props.playButtonState, p2.props.gameProductInfo)
	local TextKey = PlayButtonProps.textKey
	local Price = PlayButtonProps.price
	local Icon = PlayButtonProps.icon
	local IsNotificationsTooltipActive = if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then p2.state.isNotificationsTooltipActive else false
	local IsFullscreen = p2.state.isFullscreen
	local IsCrossFade = p2.state.isCrossFade
	local CurrentIndex = p2.state.currentIndex
	local NextIndex = p2.state.nextIndex
	local MediaGalleryShowIndex = p2.state.mediaGalleryShowIndex
	local ThumbnailSize = nil
	local SideMargin = nil
	local HeaderBarBackgroundHeight = nil
	
	if Tokens then
		ThumbnailSize = Tokens.thumbnailSize
		SideMargin = Tokens.sideMargin
		HeaderBarBackgroundHeight = Tokens.headerBarBackgroundHeight
	end
	local Smallest: number? = nil
	
	if DeviceType1 == DeviceType.Tablet then
		Smallest = math.min(p2.props.viewHeight / 3, 500)
		ThumbnailSize = 200
	elseif not IsUiModeMatch then
		Smallest = 208
	end
	local NoIsUiModeMatch = not IsUiModeMatch
	local Text1 = IsUiModeMatch and Text
	local EnableNotificationsDiscoverability = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else p2.props.enableNotificationsDiscoverability
	local NotificationsCanEnableExperience = p2.props.notificationsCanEnableExperience
	
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p2.props.edpServerIxpVariables and p2.props.edpServerIxpVariables.hideNotifyButton == true) then
		EnableNotificationsDiscoverability = false
	end
	local FilterResult = CryoModule.List.filter({
		NoIsUiModeMatch and {
			props = {
				userInteractionEnabled = true,
				showBackground = true,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = Images["icons/actions/friends/friendsplaying"],
				onActivated = p2.openShareContextualMenu,
				size = p2.props.iconButtonSize,
				backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil
			}
		} or nil,
		{
			props = {
				userInteractionEnabled = true,
				showBackground = true,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = Images["icons/common/more"],
				onActivated = p2.openMoreContextualMenu,
				size = p2.props.iconButtonSize,
				backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil
			}
		},
		EnableNotificationsDiscoverability and NotificationsCanEnableExperience and {
			props = {
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = if p2.props.gameFollowings and p2.props.gameFollowings.isFollowed then Images["icons/common/notificationOn"] else Images["icons/common/notificationOff"],
				userInteractionEnabled = true,
				showBackground = true,
				onActivated = p2.toggleFollowExperience,
				size = p2.props.iconButtonSize,
				backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil,
				[RoactModule.Children] = if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then {
					Tooltip = ReactModule.createElement(GameDetailNotificationsButtonHintModule, {
						isActive = IsNotificationsTooltipActive,
						preferredOrientation = TooltipOrientation.Bottom
					})
				} else nil
			}
		} or nil
	}, function(p3): boolean
		return p3 ~= nil
	end)
	local List = nil
	
	if IsUiModeMatch then
		local LicenseDescription = p2.props.gameDetail and p2.props.gameDetail.licenseDescription or nil
		
		if Text1 or LicenseDescription then
			List = {}
		end
		if Text1 then
			table.insert(List, {
				props = {
					userInteractionEnabled = true,
					showBackground = true,
					anchorPoint = Vector2.new(0, 0.5),
					position = UDim2.fromScale(0, 0.5),
					text = Text,
					horizontalPadding = Tokens.actionBarTextButtonPadding.X,
					verticalPadding = Tokens.actionBarTextButtonPadding.Y,
					size = p2.props.textButtonSize,
					onActivated = function()
						-- upvalues: p2 (copy), UniverseId (copy)
						p2.props.openExperienceGuidelinesExplained(UniverseId, true)
					end,
					backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil
				}
			})
		end
		if LicenseDescription then
			table.insert(List, {
				props = {
					userInteractionEnabled = false,
					showBackground = true,
					anchorPoint = Vector2.new(0, 0.5),
					position = UDim2.fromScale(0, 0.5),
					text = LicenseDescription,
					horizontalPadding = Tokens.actionBarTextButtonPadding.X,
					verticalPadding = Tokens.actionBarTextButtonPadding.Y,
					size = p2.props.textButtonSize,
					backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil
				}
			})
		end
	else
		List = if Text1 then {
			{
				props = {
					userInteractionEnabled = true,
					showBackground = true,
					anchorPoint = Vector2.new(0, 0.5),
					position = UDim2.fromScale(0, 0.5),
					text = Text,
					horizontalPadding = Tokens.actionBarTextButtonPadding.X,
					verticalPadding = Tokens.actionBarTextButtonPadding.Y,
					size = p2.props.textButtonSize,
					onActivated = function()
						-- upvalues: p2 (copy), UniverseId (copy)
						p2.props.openExperienceGuidelinesExplained(UniverseId, true)
					end,
					backgroundColor = Tokens and Tokens.actionBarButtonBackgroundColor or nil
				}
			}
		} else nil
	end
	return WithLocalizationFunction({ buttonText = TextKey })(function(p3)
		-- upvalues: PlayButtonProps (copy), Price (copy), p2 (copy), DeviceType1 (copy), Url (ref), ResolveTitleTextResult (copy), Tokens (copy), UniverseId (copy), Name1 (copy), Id (copy), Type (copy), Description (copy), PlaysAnsVisitsInfo (copy), FFlagLuaAppEdpFixDefaultBanner (upval), FFlagLuaAppUnifyPlayButtonNonMobileEdp (upval), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (upval), FFlagLuaAppEnablePlaySquadButton (upval), Icon (copy), Images (upval), GetFFlagUIBloxUseFoundationButtonFunction (upval), FFlagLuaAppPlayButtonOptOutFoundationButton (upval), RoactModule (upval), PlayButton (upval), IsUiModeMatch (copy), ButtonSize (upval), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (upval), MenuDirection (upval), FilterResult (copy), List (ref), Name (copy), SocialLinks (copy), CommunityLink (copy), config (upval), IsFullscreen (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), IgrsRating (ref), IgrsRatingDisplayMessage (ref), FFlagEnablePlayWithRewardNonPeekviewEdp (upval), RootPlaceId (copy), MediaGalleryShowIndex (copy), IsCrossFade (copy), CurrentIndex (copy), NextIndex (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), SideMargin (ref), Smallest (ref), ThumbnailSize (ref), HeaderBarBackgroundHeight (ref), DetailsPageSelector (upval)
		local LocalizedFiatPrice = if PlayButtonProps.localizedFiatPrice then PlayButtonProps.localizedFiatPrice elseif Price then p2.getAbbreviateCount(Price) else p3.buttonText
		local DetailsPageProps = {
			dualPanelBreakpoint = 1e999,
			maxContentWidth = 850,
			deviceType = DeviceType1,
			thumbnailImageUrl = Url,
			titleText = ResolveTitleTextResult,
			hideCloseButton = p2.props.hideCloseButton,
			actionBarLabelText = p2.props.playButtonContextualMessage,
			renderActionBarLabelImpressionsDetector = if p2.props.playButtonContextualMessage then p2.renderActionBarLabelImpressionsDetector else nil,
			renderInfoContent = p2.renderInfoContent(Tokens, UniverseId, Name1, Id, Type, p2.props.creatorVerified or false, Description, PlaysAnsVisitsInfo.plays, PlaysAnsVisitsInfo.totalUpVotes, PlaysAnsVisitsInfo.totalDownVotes),
			onClose = p2.onClose
		}
		local DefaultBannerUrl = nil
		
		if FFlagLuaAppEdpFixDefaultBanner then
			DefaultBannerUrl = p2.props.defaultBannerUrl
			
			if not DefaultBannerUrl then
				local BannerImageId = p2.state.bannerImageId or p2.props.bannerImageId
				DefaultBannerUrl = if BannerImageId then "rbxassetid://" .. BannerImageId else ""
			end
		else
			local BannerImageId = p2.state.bannerImageId or p2.props.bannerImageId
			DefaultBannerUrl = if BannerImageId then "rbxassetid://" .. BannerImageId else ""
		end
		DetailsPageProps.bannerImageUrl = DefaultBannerUrl
		DetailsPageProps.actionBarProps = {
			iconSize = p2.props.tokens.iconSize,
			buttonHeight = p2.props.actionBarHeight,
			buttonPadding = Tokens.headerItemPadding,
			button = if FFlagLuaAppUnifyPlayButtonNonMobileEdp and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p2.props.hasUnifiedPlayButtonIxp) then nil else {
				props = if FFlagLuaAppEnablePlaySquadButton and PlayButtonProps.showSquadButton then {
					button = {
						onActivated = p2.onPlayButtonActivated,
						icon = if Icon then Images[Icon] else nil,
						text = LocalizedFiatPrice,
						isDisabled = PlayButtonProps.isDisabled
					},
					overflow = {
						isDisabled = PlayButtonProps.isSquadButtonDisabled,
						onActivated = p2.props.onPlaySquadButtonActivated
					},
					size = p2.props.playButtonSize
				} else {
					onActivated = p2.onPlayButtonActivated,
					icon = if Icon then Images[Icon] else nil,
					text = LocalizedFiatPrice,
					isDisabled = PlayButtonProps.isDisabled,
					isLoading = PlayButtonProps.isLoading,
					buttonType = PlayButtonProps.buttonType,
					size = p2.props.playButtonSize,
					buttonRef = p2.props.playButtonRef,
					DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
				}
			},
			buttonOverride = if FFlagLuaAppUnifyPlayButtonNonMobileEdp and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p2.props.hasUnifiedPlayButtonIxp) then RoactModule.createElement(PlayButton, {
				launchSource = "ExperienceDetailsPage",
				fillBehavior = "Fill",
				testId = "--experience-details--play-button",
				universeId = UniverseId,
				referralSource = p2.props.referralSource,
				experienceJoinData = p2.props.experienceJoinData,
				placeId = p2.props.placeIdOverride,
				buttonSize = if IsUiModeMatch then ButtonSize.Medium else ButtonSize.Large,
				squadButtonHeight = UDim.new(0, p2.props.actionBarHeight),
				squadButtonMenuDirection = if FFlagLuaAppUnifiedPlayButtonSquadMenuDirection then MenuDirection.Down else nil,
				useUIBloxButton = p2.props.unifyToUIBloxIxp
			}) else nil,
			icons = FilterResult,
			textButtons = List
		}
		DetailsPageProps.actionBarWidth = if FFlagLuaAppEnablePlaySquadButton and PlayButtonProps.showSquadButton then p2.applyTokenScaling(420) else p2.applyTokenScaling(380)
		DetailsPageProps.actionBarHeight = p2.props.actionBarHeight
		DetailsPageProps.componentList = p2.getBodyComponentListProps(UniverseId, p2.props.gameDetailsPageDataStatus, Description, Name, PlaysAnsVisitsInfo.plays, PlaysAnsVisitsInfo.visits, SocialLinks, CommunityLink, p2.props.communityLinksEnabled, p2.props.communityLinkVariant, p2.props.detailsPageConfiguration or config, IsFullscreen, IsUiModeMatch, p2.props.bannerImageId, if p2.props.gameDetail then p2.props.gameDetail.refundPolicy else nil, p2.props.experienceDetailsNoticeType, if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() then p2.props.sduiFeedItemConfigs else nil, IgrsRating, IgrsRatingDisplayMessage, p2.props.webViewSupport, p2.props.openWebview, p2.props.linking, if FFlagEnablePlayWithRewardNonPeekviewEdp then p2.props.playWithRewardData else nil, if FFlagEnablePlayWithRewardNonPeekviewEdp then p2.props.showPlayWithReward else nil, if FFlagEnablePlayWithRewardNonPeekviewEdp then p2.props.isPlayable else nil, if FFlagEnablePlayWithRewardNonPeekviewEdp then RootPlaceId else nil, if FFlagEnablePlayWithRewardNonPeekviewEdp then p2.props.placeIdOverride else nil, if FFlagEnablePlayWithRewardNonPeekviewEdp then p2.props.experienceJoinData else nil)
		DetailsPageProps.isFullscreen = IsFullscreen
		DetailsPageProps.renderFullscreenContent = p2.renderFullscreenContent(UniverseId, MediaGalleryShowIndex, IsFullscreen, IsCrossFade, CurrentIndex, NextIndex)
		DetailsPageProps.backgroundContentOverride = if FFlagLuaAppEdpConsoleMediaGalleryVideo then p2.renderBackgroundContent(IsFullscreen, IsUiModeMatch, UniverseId) else nil
		DetailsPageProps.sideMargin = SideMargin
		DetailsPageProps.startingOffsetPosition = Smallest
		DetailsPageProps.thumbnailHeight = ThumbnailSize
		DetailsPageProps.headerBarBackgroundHeight = HeaderBarBackgroundHeight
		DetailsPageProps.tokens = if Tokens then {
			thumbnailMargin = Tokens.thumbnailMargin,
			thumbnailShadowHeight = Tokens.thumbnailShadowHeight,
			headerGradientHeight = Tokens.headerGradientHeight,
			headerBottomMargin = Tokens.headerBottomMargin,
			animationConfig = Tokens.animationConfig,
			itemPadding = Tokens.itemPadding,
			safeAreaSize = Tokens.safeAreaSize,
			trailingWhitespace = Tokens.trailingWhitespace,
			actionBarHeight = p2.props.actionBarHeight
		} else nil
		DetailsPageProps.disableStickyActionBar = p2.props.disableStickyActionBar
		DetailsPageProps.containerRef = p2.props.containerRef
		
		return RoactModule.createElement(DetailsPageSelector, {
			deviceType = DeviceType1,
			detailsPageProps = DetailsPageProps
		})
	end)
end

return function(p2)
	-- upvalues: FFlagEDPTTITrackingEnabled (copy), UseFirstMediaCarouselImageUriFunction (copy), UseEDPTTITrackingModule (copy), EDPTTIConstants (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), ServerDrivenUiModule (copy), EdpSduiUtilsModule (copy), PortraitLayoutConfig (copy), LandscapeLayoutConfig (copy), ApiFetchExperienceDetailsPageCountersModule (copy), UseEdpServerIxpVariablesModule (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), UseEdpPerUniverseVisibilityVariablesForUniverseModule (copy), UseUiModeInfoFunction (copy), ReactFocusNavigationModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), UseSelectedGameMediaEntriesModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), UseMediaGalleryVideoAnalyticsFunction (copy), ReactModule (copy), UiMode (copy), UseTokensFunction (copy), ResponsiveModule (copy), UseCloseWithBackButtonFunction (copy), RoactModule (copy), ExperienceDetailsPage (copy), CryoModule (copy)
	if FFlagEDPTTITrackingEnabled then
		UseEDPTTITrackingModule(EDPTTIConstants.EDP_IMPLEMENTATION.LEGACY_FULL_PAGE, p2.universeId, (UseFirstMediaCarouselImageUriFunction(p2.universeId)))
	end
	local ShouldHydrateLegacy = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ExperienceDetailsExperimentationModule.getShouldHydrateLegacy() else nil
	local ShouldInterleaveSdui = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() else nil
	local UseSduiEdpFeedItemConfigsResult = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		UseSduiEdpFeedItemConfigsResult = ServerDrivenUiModule.useSduiEdpFeedItemConfigs({
			sduiContext = ServerDrivenUiModule.useSduiContextFromSignalAndProcessConfigs(EdpSduiUtilsModule.getUnprocessedEdpStoreKey((tostring(p2.universeId))), EdpSduiUtilsModule.getEdpStoreKey((tostring(p2.universeId))), FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ShouldInterleaveSdui),
			storeKey = EdpSduiUtilsModule.getEdpStoreKey((tostring(p2.universeId))),
			portraitLayoutConfig = PortraitLayoutConfig,
			landscapeLayoutConfig = LandscapeLayoutConfig,
			defaultLayoutOrder = PortraitLayoutConfig.SduiFeedItemsDefault,
			logLayoutConflictFn = ApiFetchExperienceDetailsPageCountersModule.logSduiLayoutOrderConflict,
			shouldInterleaveSdui = FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ShouldInterleaveSdui
		})
		v2 = UseEdpServerIxpVariablesModule()
		v3 = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then UseEdpPerUniverseVisibilityVariablesForUniverseModule(p2.universeId) else nil
	end
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local v4 = nil
	
	if FFlagLuaAppEdpConsoleMediaGalleryVideo then
		local RootPlaceId = p2.gameDetail and p2.gameDetail.rootPlaceId or p2.gameInfo and p2.gameInfo.placeId
		v4 = UseMediaGalleryVideoAnalyticsFunction(p2.universeId, RootPlaceId, (UseSelectedGameMediaEntriesModule(p2.universeId, RootPlaceId, true, if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p2.mediaGalleryVideoPreviewEnabledIxp else nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil)))
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local IconSize = if p2.tokens then p2.tokens.iconSize else 0
	local IsUiModeMatch = UseUiModeInfoResult.uiMode == UiMode.TenFoot
	local _UDim2 = if IsUiModeMatch then UDim2.fromOffset(IconSize, IconSize) else nil
	local _UDim2_1 = UDim2.fromOffset(0, IconSize)
	local ActionBarHeight = p2.tokens and p2.tokens.actionBarHeight or IconSize
	local _UDim2_2 = UDim2.new(1, 0, 0, ActionBarHeight)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local Current = UseRefResult.current
	local UseCloseWithBackButtonResult = UseCloseWithBackButtonFunction(UseStateResult2, p2.onClose)
	local UseStateResult1 = nil
	local UseStateResult2_1
	UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (ref), UseRefResult1 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if UseStateResult1 == nil then
			UseRefResult1.current = false
			
			return
		end
		if UseStateResult1 and UseRefResult.current and not UseRefResult1.current then
			UseFocusGuiObjectResult(UseStateResult1)
			UseRefResult1.current = true
		end
	end, { UseStateResult1, UseFocusGuiObjectResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy)
		local SelectionOrder = -1
		local SelectionChangedConnection = if UseStateResult then UseStateResult.SelectionChanged:Connect(function(_, Object, Object1)
			-- upvalues: UseStateResult (upval), SelectionOrder (ref)
			if Object1 ~= nil and Object ~= nil and Object1:IsDescendantOf(UseStateResult) and Object:IsDescendantOf(UseStateResult) then
				Object1.SelectionOrder = SelectionOrder
				SelectionOrder -= 1
				
				return
			end
		end) else nil
		
		return function()
			-- upvalues: SelectionChangedConnection (ref)
			if SelectionChangedConnection then
				SelectionChangedConnection:Disconnect()
			end
		end
	end, { UseStateResult })
	
	return RoactModule.createElement(ExperienceDetailsPage, CryoModule.Dictionary.join({
		foundationTokens = UseTokensResult,
		uiModeInfo = UseUiModeInfoResult,
		focusGuiObject = UseFocusGuiObjectResult,
		iconButtonSize = _UDim2,
		textButtonSize = _UDim2_1,
		playButtonSize = _UDim2_2,
		actionBarHeight = ActionBarHeight,
		playButtonRef = UseStateResult2_1,
		containerRef = UseCloseWithBackButtonResult,
		sduiFeedItemConfigs = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ShouldInterleaveSdui then UseSduiEdpFeedItemConfigsResult else nil,
		disableStickyActionBar = Current,
		hideCloseButton = Current,
		videoAnalytics = if FFlagLuaAppEdpConsoleMediaGalleryVideo then v4 else nil,
		shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil,
		shouldInterleaveSduiIxp = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ShouldInterleaveSdui else nil,
		edpServerIxpVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ShouldInterleaveSdui then v2 else nil,
		edpPerUniverseVisibilityVariables = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable and (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ShouldInterleaveSdui) then v3 else nil
	}, p2))
end