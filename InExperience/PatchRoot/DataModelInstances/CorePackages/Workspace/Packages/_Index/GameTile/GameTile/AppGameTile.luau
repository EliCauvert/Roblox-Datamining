local contentProviderService = game:GetService("ContentProvider")
local gameTile = script:FindFirstAncestor("GameTile")
local gridTileIconTextFooterModule = require(gameTile.Footer.GridTileIconTextFooter)
local gridTileFriendFooter = require(gameTile.Footer.GridTileFriendFooter).GridTileFriendFooter
local gridTileTextFooterModule = require(gameTile.Footer.GridTileTextFooter)
local gameStatsModule = require(gameTile.Footer.GameStats)
local gridTileSponsoredFooterModule = require(gameTile.Footer.GridTileSponsoredFooter)
local ratingWithGenreFooterModule = require(gameTile.Footer.RatingWithGenreFooter)
local gameTileThumbnailBadgesModule = require(gameTile.Overlays.GameTileThumbnailBadges)
local sortFriendsByPresenceAndRecencyFactoryModule = require(gameTile.sortFriendsByPresenceAndRecencyFactory)
local openCentralOverlayForPlacesListModule = require(gameTile.OpenCentralOverlayForPlacesList)
local gameTileViewModule = require(gameTile.GameTileView)
local appExperienceActionRowModule = require(gameTile.AppExperienceActionRow)
local gameTileConstantsModule = require(gameTile.GameTileConstants)
local openSponsoredTooltipModule = require(gameTile.OpenSponsoredTooltip)
local gameTileTypesModule = require(gameTile.GameTileTypes)
local useIsHoveredTileModule = require(gameTile.useIsHoveredTile)
local hoverTileCoordinatorModule = require(gameTile.HoverTileCoordinator)
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local gameTileViewConfigModule = require(gameTile.GameTileViewConfig)
local useHasInGameFriendsModule = require(gameTile.useHasInGameFriends)
local useInGameUserIdsModule = require(gameTile.useInGameUserIds)
local useValidTileBadgesModule = require(gameTile.Overlays.useValidTileBadges)
local gameTileVideoThumbnailModule = require(gameTile.GameTileVideoThumbnail)
local videoEndReasonModule = require(gameTile.Video.Analytics.VideoEndReason)
local gameVideoPlaybackDetectorModule = require(gameTile.Video.GameVideoPlaybackDetector)
local useHasVideoThumbnailSelectorModule = require(gameTile.Video.useHasVideoThumbnailSelector)
local formatExperienceIconModule = require(gameTile.formatExperienceIcon)
local formatExperienceRatingModule = require(gameTile.formatExperienceRating)
local formatExperienceThumbnailModule = require(gameTile.formatExperienceThumbnail)
local hiddenTileContentModule = require(gameTile.HiddenGameTile.HiddenTileContent)
local itemLayoutDataParsingUtilsModule = require(gameTile.ItemLayoutDataParsingUtils)
local parent = gameTile.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local appBloxModule = require(parent.AppBlox)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local videoUtilsModule = require(parent.VideoUtils)
local tModule = require(parent.t)
local UIBloxModule = require(parent.UIBlox)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local withStyle = UIBloxModule.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local aspectRatioModeEnum = UIBloxModule.App.Tile.AspectRatioModeEnum
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local uiMode = require(parent.RobloxAppEnums).UiMode
local memoize = require(parent.AppCommonLib).memoize
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local gameIconReducer = require(parent.GameIconRodux).GameIcons.GameIconReducer
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.DataHydration)
local gameHydrationReactModule = require(parent.GameHydrationReact)
local useTokens = require(parent.Foundation).Hooks.useTokens
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local useOverflowMenuOpen = appBloxModule.useOverflowMenuOpen
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate
local discoveryAppLaunchTracker = require(parent.AppLaunchTracker).DiscoveryAppLaunchTracker
local getFFlagEnableNavigationPerformanceIntervals = require(parent.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals
local fFlagLuaAppGameTileInteractionFeedback = require(parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local fFlagLuaAppMigrateGameTileHoverFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local fFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local fFlagLuaAppUnifyPlayButtonTile = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppGameDetailsAttributionFix = require(parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local luaAppUseRatingFormatHelper2 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local fFlagGameTileMigrateOffLegacyPresence = require(parent.SharedFlags).FFlagGameTileMigrateOffLegacyPresence
local var45 = if fFlagGameTileMigrateOffLegacyPresence then require(parent.FriendsHydrationReact).useGetOnlineFriendsByUniverseId else nil
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppNotInterestedReportPlaceId = require(parent.SharedFlags).FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local luaAppKeepTileBadgesDuringVideo = game:DefineFastFlag("LuaAppKeepTileBadgesDuringVideo", false)
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppContinueSortInstantPlay = require(parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppGameTileExtractGameDetailsCallback = require(parent.SharedFlags).FFlagLuaAppGameTileExtractGameDetailsCallback
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local instantPlayLauncherModule = require(gameTile.InstantPlayLauncher)
local fFlagLuaAppGenreRatingFooter = require(parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local fFlagLuaAppHomeThumbnailPrefetch = require(parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local var48 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local gameTileContextualActionsModule = require(gameTile.GameTileContextualActions)
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local getAvailableGameTileOverflowMenuItemsModule = require(gameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _()
	return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000
end

local appGameTile = roactModule.PureComponent:extend("AppGameTile")
appGameTile.validateProps = tModule.strictInterface({
	entry = tModule.table,
	reportGameDetailOpened = tModule.callback,
	reportExperienceLaunched = tModule.optional(tModule.callback),
	Size = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	ZIndex = tModule.optional(tModule.number),
	useHoverTile = tModule.optional(tModule.boolean),
	hasBackground = tModule.boolean,
	useGridTile = tModule.boolean,
	playerCountStyle = tModule.optional(tModule.string),
	isSponsoredFooterAllowed = tModule.optional(tModule.boolean),
	isSponsoredRatingFooterAllowed = tModule.optional(tModule.boolean),
	useExperienceTileMetadata = tModule.boolean,
	hideGameStats = tModule.optional(tModule.boolean),
	gameTileLayoutType = tModule.optional(tModule.string),
	topicId = tModule.optional(tModule.string),
	playButtonStyle = tModule.optional(tModule.string),
	onGuiStateChanged = if fFlagLuaAppGameTileInteractionFeedback then tModule.optional(tModule.callback) else nil,
	isDisabled = tModule.optional(tModule.boolean),
	onActivated = if fFlagLuaAppGameTileInteractionFeedback then tModule.optional(tModule.callback) else nil,
	onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then tModule.callback else tModule.optional(tModule.callback),
	onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then tModule.callback else tModule.optional(tModule.callback),
	friendFooterEnabled = tModule.optional(tModule.boolean),
	index = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.number),
	source = tModule.optional(tModule.string),
	referralSource = tModule.optional(tModule.string),
	onPeekViewClosed = tModule.optional(tModule.callback),
	rowNum = tModule.optional(tModule.number),
	showFriendActivity = tModule.boolean,
	contentTextLineCount = tModule.optional(tModule.number),
	metadataTextLineCount = tModule.optional(tModule.number),
	thumbnailAspectRatioOverride = tModule.optional(tModule.string),
	impressionsTag = tModule.optional(tModule.string),
	launchExperienceEventContext = tModule.optional(tModule.string),
	navigateToGameDetails = tModule.callback,
	isContained = tModule.optional(tModule.boolean),
	hideTitle = tModule.optional(tModule.boolean),
	hideMetadata = tModule.optional(tModule.boolean),
	textSizeOffset = tModule.optional(tModule.number),
	foundationTokens = tModule.optional(tModule.table),
	videoAnalytics = tModule.optional(tModule.table),
	hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then tModule.optional(tModule.boolean) else nil,
	videoPlaybackContext = tModule.optional(tModule.table),
	SelectionOrder = tModule.optional(tModule.number),
	enableExplicitFeedback = tModule.optional(tModule.boolean),
	setGameHidden = tModule.optional(tModule.callback),
	appPage = tModule.optional(tModule.string),
	isHidden = tModule.optional(tModule.boolean),
	isNarrowScreenXSmall = tModule.optional(tModule.boolean),
	onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then tModule.optional(tModule.callback) else nil,
	sponsoredUserCohort = tModule.optional(tModule.string),
	enableSponsoredFeedback = tModule.optional(tModule.boolean),
	availableMenuItems = tModule.optional(tModule.table),
	enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then tModule.optional(tModule.boolean) else nil,
	compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then tModule.optional(tModule.boolean) else nil,
	hideRating = if fFlagLuaAppNarrowTileHideRating then tModule.optional(tModule.boolean) else nil,
	hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then tModule.optional(tModule.boolean) else nil,
	game = tModule.optional(tModule.table),
	universeId = tModule.string,
	navigationUniverseId = tModule.optional(tModule.string),
	name = tModule.string,
	totalUpVotes = tModule.number,
	totalDownVotes = tModule.number,
	friendActivityTitle = tModule.optional(tModule.string),
	friendVisitedString = tModule.optional(tModule.string),
	imageThumbnail = tModule.string,
	wideThumbnail = tModule.optional(tModule.string),
	videoThumbnail = tModule.optional(tModule.string),
	rating = tModule.optional(tModule.string),
	showAgeRating = tModule.optional(tModule.boolean),
	ageRatingText = tModule.optional(tModule.string),
	friendVisits = tModule.table,
	hidePlayButton = tModule.boolean,
	footerLayoutData = tModule.optional(tModule.table),
	openContextualMenu = tModule.callback,
	openSponsoredTooltip = tModule.callback,
	networking = tModule.callback,
	hoverRef = tModule.table,
	isHoverSupported = tModule.optional(tModule.boolean),
	isHovered = tModule.optional(tModule.boolean),
	gameIconUrl = if fFlagMigrateGameIconsToStore then tModule.optional(tModule.string) else nil,
	isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then tModule.boolean else nil,
	isVideoPlaying = tModule.boolean,
	tileBadges = tModule.optional(tModule.table),
	users = tModule.optional(tModule.table),
	inGameUsersByGame = tModule.optional(tModule.table),
	hasInGameFriends = tModule.boolean,
	inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then tModule.table else nil,
	badgeOverride = tModule.optional(tModule.table),
	forceHideAgeRatings = tModule.optional(tModule.boolean),
	onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then tModule.optional(tModule.callback) else nil,
	recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then tModule.optional(tModule.callback) else nil,
	overflowMenuOpen = tModule.optional(tModule.boolean),
	hoverKey = tModule.optional(tModule.string),
	triggerFeedback = tModule.callback,
	videoPlaybackDetector = tModule.optional(tModule.table),
	enableInstantPlay = if fFlagLuaAppContinueSortInstantPlay then tModule.optional(tModule.boolean) else nil
})
local narrow = gameTileTypesModule.GameTileLayoutType.Narrow
appGameTile.defaultProps = {
	useHoverTile = false,
	hasBackground = false,
	useExperienceTileMetadata = false,
	useGridTile = false,
	hideGameStats = false,
	thumbnailAspectRatioOverride = aspectRatioModeEnum.Square,
	gameTileLayoutType = narrow,
	contentTextLineCount = gameTileConstantsModule.TileTextLines[narrow].titleTextLines
}

function appGameTile.init(p0)
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), discoveryAnalyticsModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppUnifyPlayButtonTile (ref), sponsoredGamesRecordClick (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileInit()
	end
	p0.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else false,
		instantPlayRequested = if fFlagLuaAppContinueSortInstantPlay then false else nil
	}
	
	function p0.onMenuOpenChanged(p1, p2)
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.props.appPage,
			universeId = p0.props.universeId,
			sortId = p0.props.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.props.appPage or "Unknown" else nil)
	end
	
	function p0.onTouchLongPress()
		-- upvalues: p0 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), getOverflowMenuSignalStore (copy)
		if next(p0.props.availableMenuItems) ~= nil then
			if p0.props.triggerFeedback and not p0.props.overflowMenuOpen then
				p0.props.triggerFeedback("TileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.props.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = p0.props.universeId,
					sortId = p0.props.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(p0.props.hoverKey)
			local t = {}
			
			for i, v in p0.props.availableMenuItems do
				table.insert(t, i)
			end
			p0.onMenuOpenChanged(false, table.concat(t, ","))
		end
	end
	
	p0.reportExperienceLaunched = if fFlagLuaAppContinueSortInstantPlay then function(...)
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p0 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy)
		if fFlagLuaAppGameDetailsAttributionFix then
			p0.props.recordSponsoredGameClick()
		else
			p0.recordSponsoredGameClick()
		end
		if p0.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.props.reportExperienceLaunched then
			p0.props.reportExperienceLaunched(...)
		end
		if p0.props.videoPlaybackContext and p0.props.videoPlaybackContext.videoPlaybackCoordinator then
			p0.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
			
			return
		end
		videoPlaybackCoordinator.default:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
	end else nil
	p0.reportExperienceLaunchedFromInstantPlay = if fFlagLuaAppContinueSortInstantPlay then function(p3)
		-- upvalues: p0 (ref), discoveryAnalyticsModule (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		p0.reportExperienceLaunched(p0.props.entry, p0.props.referralSource, "ExperienceTile", discoveryAnalyticsModule.Constants.Context.InstantPlay, p0.props.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
	end else nil
	p0.reportExperienceLaunchedFromActionBar = if fFlagLuaAppContinueSortInstantPlay then p0.reportExperienceLaunched else function(...)
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p0 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy)
		if fFlagLuaAppGameDetailsAttributionFix then
			p0.props.recordSponsoredGameClick()
		else
			p0.recordSponsoredGameClick()
		end
		if p0.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.props.reportExperienceLaunched then
			p0.props.reportExperienceLaunched(...)
		end
		if p0.props.videoPlaybackContext and p0.props.videoPlaybackContext.videoPlaybackCoordinator then
			p0.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
			
			return
		end
		videoPlaybackCoordinator.default:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
	end
	
	function p0.renderAppExperienceActionRow(_)
		-- upvalues: roactModule (copy), appExperienceActionRowModule (copy), p0 (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (copy), fFlagLuaAppGameDetailsAttributionFix (copy), fFlagLuaAppUnifyPlayButtonTile (copy)
		return roactModule.createElement(appExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p0.props.navigationUniverseId,
			referralSource = p0.props.referralSource,
			reportExperienceLaunched = p0.reportExperienceLaunchedFromActionBar,
			openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p0.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
				-- upvalues: p0 (copy)
				p0.props.onGameTileActivated(p0.isMounted)
			end else p0.onActivated,
			entry = p0.props.entry,
			launchExperienceEventContext = p0.props.launchExperienceEventContext,
			horizontalPadding = if p0.props.useGridTile then 0 else nil,
			index = p0.props.index,
			isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
			placeIdOverride = p0.props.entry.placeIdOverride,
			launchDataOverride = p0.props.entry.launchDataOverride
		})
	end
	
	p0.onInstantPlayActivated = if fFlagLuaAppContinueSortInstantPlay then function()
		-- upvalues: p0 (ref)
		if p0.props.enableInstantPlay then
			p0:setState({ instantPlayRequested = true })
		end
	end else nil
	p0.onInstantPlayAttemptCompleted = if fFlagLuaAppContinueSortInstantPlay then function()
		-- upvalues: p0 (ref)
		p0:setState({ instantPlayRequested = false })
	end else nil
	
	function p0.onHoverChanged(p4)
		-- upvalues: p0 (ref)
		if p4 and p0.props.triggerFeedback then
			p0.props.triggerFeedback("Default", "Hover")
		end
		p0:setState({ isHovered = p4 })
	end
	
	p0.gameTileRef = roactModule.createRef()
	
	function p0.getTilePosition()
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p0.getTileSize()
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsoluteSize else nil
	end
	
	p0.recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy)
		local networking = p0.props.networking
		local entry = p0.props.entry
		
		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	p0.onActivated = if fFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p0 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy)
		if p0.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.props.videoPlaybackContext and p0.props.videoPlaybackContext.videoPlaybackCoordinator then
			p0.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, p0.props.navigationUniverseId, nil)
		else
			videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, p0.props.navigationUniverseId, nil)
		end
		if p0.isMounted then
			if fFlagLuaAppGameTileInteractionFeedback and p0.props.onActivated then
				p0.props.onActivated()
			end
			local navigationUniverseId = p0.props.navigationUniverseId
			local t = {
				source = p0.props.source,
				index = p0.props.index,
				referralSource = p0.props.referralSource,
				onPeekViewClosed = p0.props.onPeekViewClosed,
				placeIdOverride = p0.props.entry.placeIdOverride,
				experienceJoinData = {
					launchData = if p0.props.entry.launchDataOverride then p0.props.entry.launchDataOverride else nil,
					tileType = p0.props.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
					nativeAdData = p0.props.entry.adId
				}
			}
			
			if getFFlagEnableNavigationPerformanceIntervals() then
				intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
			end
			p0.props.navigateToGameDetails(navigationUniverseId, t)
			p0.props.reportGameDetailOpened(p0.props.index, navigationUniverseId)
			p0.recordSponsoredGameClick()
		end
	end
	p0.onGameDetailsActivated = if fFlagLuaAppGameDetailsAttributionFix then function()
		-- upvalues: p0 (ref)
		p0.props.onGameTileActivated(p0.isMounted)
	end else p0.onActivated
	
	function p0.onFriendFooterActivated()
		-- upvalues: p0 (ref)
		if p0.isMounted then
			p0.props.openContextualMenu(p0.props.game, p0.getTileSize(), p0.getTilePosition())
		end
	end
	
	function p0.onActivateSponsoredTooltip()
		-- upvalues: p0 (ref), responsiveModule (copy)
		if p0.isMounted then
			p0.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p0.loadWideThumbnail()
		-- upvalues: p0 (ref), contentProviderService (copy)
		local wideThumbnail = p0.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function()
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p0.getVisitedFriends()
		-- upvalues: p0 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p0.props.friendVisits
		
		for i = 1, #friendVisits do
			local var59 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var59)
			elseif p0.props.users and p0.props.users[var59] then
				table.insert(t, {
					userId = var59,
					displayName = p0.props.users[var59].displayName
				})
			end
		end
		return t
	end
	
	p0.getSortedFriends = memoize(function(p5, p6)
		-- upvalues: sortFriendsByPresenceAndRecencyFactoryModule (copy)
		if not p5 or not p6 then
			return {}
		end
		local t = {}
		
		for i, v in pairs(p6) do
			local var61 = p5[v]
			
			if var61 and var61.isFriend then
				table.insert(t, { userId = var61.id, displayName = var61.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p0.onSelectionGained()
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = true })
		end
		if p0.props.onSelectionGained or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionGained(p0.props.entry, p0.props.index, p0.props.navigationUniverseId)
		end
	end
	
	function p0.LuaAppGameTileHoverDelayMs()
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = false })
		end
		if p0.props.onSelectionLost or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionLost()
		end
	end
end

local _ = function(p7)
	if p7 == nil then
		return nil
	elseif p7.type ~= "TextLabel" then
		return nil
	end
	local text = p7.text
	
	return if text == nil then nil else text.textLiteral
end

local var54 = if fFlagLuaAppGenreRatingFooter then function(p8)
	if p8 == nil then
		return nil
	elseif p8.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p8.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p9)
	-- upvalues: fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var54 (write), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), reactModule (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var62 = p9.props.useHoverTile or p9.props.useExperienceTileMetadata
	local friendFooterEnabled = p9.props.friendFooterEnabled
	local hasInGameFriends = p9.props.hasInGameFriends
	local var63 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p9.props.inGameUserIds else nil
	local var64 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p9.getSortedFriends(p9.props.users, p9.props.inGameUsersByGame)
	local var65 = friendFooterEnabled
	
	if var65 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var65 = var63
			
			if var65 then
				var65 = #var63 > 0
				var65 = nil
			end
		else
			var65 = hasInGameFriends
		end
	end
	local ageRatingText
	local var66 = p9.props.friendVisits and #p9.props.friendVisits > 0
	local _ = nil
	local footerLayoutData = p9.props.footerLayoutData
	
	if footerLayoutData == nil then
		ageRatingText = nil
	elseif footerLayoutData.type == "TextLabel" then
		local text = footerLayoutData.text
		ageRatingText = if text == nil then nil else text.textLiteral
	else
		ageRatingText = nil
	end
	local var67 = if fFlagLuaAppGenreRatingFooter then var54(p9.props.footerLayoutData) else nil
	local var68 = false
	
	if (p9.props.isHovered or (if fFlagLuaAppGameTileSelectionVideoPlayback then p9.props.isSelected else p9.state.isSelected)) and (p9.props.ageRatingText and not p9.props.hidePlayButton) then
		ageRatingText = p9.props.ageRatingText
		var68 = true
	end
	local var69 = ageRatingText ~= nil
	local var70 = if fFlagLuaAppGenreRatingFooter then var67 ~= nil else nil
	local entry = p9.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p9.props.isSponsoredFooterAllowed or p9.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p9.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p9.props.useExperienceTileMetadata and (isShowSponsoredLabel or var69 or fFlagLuaAppGenreRatingFooter and var70) or fFlagLuaAppNarrowTileSmallerFooterFont and p9.props.compactMetadataFormat then
		var62 = false
	end
	local var72 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = p9.props.totalUpVotes,
			totalDownVotes = p9.props.totalDownVotes,
			playerCount = if p9.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p9.props.entry.playerCount else nil
		},
		isGridTile = p9.props.useGridTile,
		hideGameStats = p9.props.hideGameStats,
		useLargerFont = var62,
		gameTileLayoutType = p9.props.gameTileLayoutType,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p9.props.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p9.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p9.props.hidePlayerCount else nil
	})
	
	if p9.props.hideMetadata then
		return if p9.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var62,
			onActivateSponsoredTooltip = p9.onActivateSponsoredTooltip,
			gameTileLayoutType = p9.props.gameTileLayoutType,
			isNarrowScreenXSmall = p9.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p9.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p9.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var72
		}) elseif var68 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var62
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var62,
			onActivateSponsoredTooltip = p9.onActivateSponsoredTooltip,
			gameTileLayoutType = p9.props.gameTileLayoutType,
			isNarrowScreenXSmall = p9.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p9.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p9.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var72
		}) elseif fFlagLuaAppGenreRatingFooter and var70 and not var68 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var62,
			totalUpVotes = p9.props.totalUpVotes,
			totalDownVotes = p9.props.totalDownVotes,
			genreText = var67
		}) elseif var69 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var62
		}) elseif var65 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var62,
			friendUserIds = var63,
			onFriendFooterActivated = p9.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var64,
			useLargerFont = var62
		}) elseif p9.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p9.props.friendVisitedString,
			iconSize = if var62 then 32 else 24,
			useLargerFont = var62
		}) elseif var66 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p9.getVisitedFriends(),
			useLargerFont = var62
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p9.getVisitedFriends(),
			useLargerFont = var62
		}) else var72
	end
end

function appGameTile.renderContent(p10, p11, p12, p13)
	-- upvalues: gameTileConstantsModule (ref), gameTileViewConfigModule (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), gameTileVideoThumbnailModule (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppGameDetailsAttributionFix (ref), luaAppKeepTileBadgesDuringVideo (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), foundationModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActionsModule (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppEnableSponsoredReportAd (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppGameTileInteractionFeedback (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), instantPlayLauncherModule (ref), discoveryAnalyticsModule (ref)
	local createElement
	local size = p10.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p10.props.imageThumbnail
	local onGameTileActivated = p10.props.onGameTileActivated
	local var74 = if p10.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p10.props.isHovered and p10.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p10.props.gameTileLayoutType)
	local var76 = p10:renderGridTilesFooter()
	local var77 = if p10.props.hideTitle then nil else p10.props.name
	local var78 = if var74 then reactModule.createElement(gameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p10.props.entry.playerCount
		}
	}) else nil
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(p12.Tokens, p10.props.textSizeOffset, p10.props.contentTextLineCount, p10.props.foundationTokens, true).playButtonHeight
	
	if p10.props.isHidden then
		createElement = reactModule.createElement(hiddenTileContentModule, {
			appPage = p10.props.appPage,
			collectionId = p10.props.topicId,
			setGameHidden = p10.props.setGameHidden,
			universeId = p10.props.universeId,
			parentRef = p10.props.hoverRef,
			isSponsored = p10.props.entry.isSponsored
		})
	elseif p10.props.videoThumbnail then
		createElement = reactModule.createElement
		createElement = createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = p10.props.videoThumbnail,
			image = imageThumbnail,
			playing = p10.props.isVideoPlaying,
			Size = UDim2.fromScale(1, 1),
			isTileContained = p10.props.isContained,
			cornerRadius = p12.Tokens.Size.Size_200,
			onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay then p10.onInstantPlayActivated elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameTileExtractGameDetailsCallback then p10.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
				-- upvalues: onGameTileActivated (ref), p10 (ref)
				onGameTileActivated(p10.isMounted)
			end else p10.onActivated else nil,
			itemIndex = p10.props.index,
			videoAnalytics = p10.props.videoAnalytics,
			universeId = p10.props.universeId,
			videoPlaybackCoordinator = if p10.props.videoPlaybackContext then p10.props.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	else
		createElement = nil
	end
	local var79 = if luaAppKeepTileBadgesDuringVideo or not p10.props.isVideoPlaying then if p10.props.tileBadges then roactModule.createFragment({
		SocialFeaturePill = var78,
		Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p10.props.tileBadges })
	}) else var78 else nil
	
	if fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay and not p10.props.isHidden then
		local var80 = reactModule.createElement(foundationModule.View, {
			tag = "align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle",
			backgroundStyle = p13.Color.Extended.Black.Black_70
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.PlayLarge,
				size = foundationModule.Enums.IconSize.XLarge,
				style = p13.Color.Extended.White.White_100
			})
		})
		var79 = if var79 then roactModule.createFragment({ Existing = var79, PlayOverlay = var80 }) else var80
	end
	local createElement_1
	local isHidden = p10.props.isHidden
	
	if next(p10.props.availableMenuItems) == nil or not p10.props.isHovered and not p10.props.overflowMenuOpen and not (if fFlagLuaAppGameTileSelectionVideoPlayback then p10.props.isSelected else p10.state.isSelected) or isHidden then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActionsModule else gameTileOverflowMenuModule, {
			isHovered = p10.props.isHovered,
			isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p10.props.isSelected else p10.state.isSelected,
			universeId = p10.props.universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p10.props.entry.placeId else nil,
			collectionId = p10.props.topicId,
			appPage = p10.props.appPage,
			setGameHidden = p10.props.setGameHidden,
			menuKey = p10.props.hoverKey,
			menuOpen = p10.props.overflowMenuOpen,
			onMenuOpenChanged = p10.onMenuOpenChanged,
			parentRef = p10.props.hoverRef,
			isSponsored = p10.props.entry.isSponsored,
			payerName = p10.props.entry.payerName,
			sponsoredUserCohort = p10.props.sponsoredUserCohort,
			adId = if fFlagLuaAppEnableSponsoredReportAd then p10.props.entry.adId else nil,
			availableMenuItems = p10.props.availableMenuItems,
			onGameDetailsActivated = if fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay then p10.onGameDetailsActivated else nil
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		ZIndex = p10.props.ZIndex,
		LayoutOrder = p10.props.layoutOrder,
		ref = p10.gameTileRef
	}, {
		Tile = reactModule.createElement(gameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p10.props.SelectionOrder,
			Selectable = not isHidden,
			hoverPadding = if fFlagLuaAppMigrateGameTileHoverFixes or p10.props.useGridTile then nil else p12.Tokens.Size.Size_200,
			numLinesForTitle = p10.props.contentTextLineCount,
			numLinesForMetadata = p10.props.metadataTextLineCount,
			imageAspectRatio = imageAspectRatio,
			isContained = p10.props.isContained,
			containmentSidePadding = gameTileViewConfigModule.getContainmentSidePadding(p12.Tokens, p10.props.gameTileLayoutType, p10.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p10.props.onTileImageLoaded else nil,
			thumbnailComponent = createElement,
			title = if isHidden then nil else var77,
			isDisabled = if isHidden then true else p10.props.isDisabled,
			onActivated = if fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay and not isHidden then p10.onInstantPlayActivated elseif fFlagLuaAppGameTileExtractGameDetailsCallback then if not isHidden then p10.onGameDetailsActivated else p10.onActivated elseif fFlagLuaAppGameDetailsAttributionFix and not isHidden then function()
				-- upvalues: onGameTileActivated (ref), p10 (ref)
				onGameTileActivated(p10.isMounted)
			end else p10.onActivated,
			onGuiStateChanged = if fFlagLuaAppGameTileInteractionFeedback then p10.props.onGuiStateChanged else nil,
			onSelectionGained = p10.onSelectionGained,
			onSelectionLost = p10.onSelectionLost,
			onTouchLongPress = if not isHidden then p10.onTouchLongPress else nil,
			reducedMotion = p11,
			isHovered = if isHidden then false else p10.props.isHovered,
			forwardRef = p10.props.hoverRef,
			hidePlayButton = if isHidden then true else p10.props.hidePlayButton,
			hoverActionRow = if p10.props.hidePlayButton or isHidden or fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay then nil else reactModule.createElement(appExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p10.props.navigationUniverseId,
				referralSource = p10.props.referralSource,
				reportExperienceLaunched = p10.reportExperienceLaunchedFromActionBar,
				openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p10.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
					-- upvalues: onGameTileActivated (ref), p10 (ref)
					onGameTileActivated(p10.isMounted)
				end else p10.onActivated,
				entry = p10.props.entry,
				launchExperienceEventContext = p10.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p10.props.index,
				height = playButtonHeight,
				showButtonText = imageAspectRatio > 1,
				isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p10.props.entry.placeIdOverride,
				launchDataOverride = p10.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if isHidden then nil else var79,
			overflowMenu = createElement_1,
			footerMetadata = if isHidden then nil else var76,
			textSizeOffset = p10.props.textSizeOffset,
			hideMetadata = p10.props.hideMetadata
		}),
		VideoPlaybackDetector = p10.props.videoPlaybackDetector,
		InstantPlayLauncher = if fFlagLuaAppContinueSortInstantPlay and p10.props.enableInstantPlay and p10.state.instantPlayRequested then reactModule.createElement(instantPlayLauncherModule, {
			launchSource = "ExperienceTile",
			universeId = p10.props.navigationUniverseId,
			referralSource = p10.props.referralSource,
			eventContext = discoveryAnalyticsModule.Constants.Context.InstantPlay,
			launchData = p10.props.entry.launchDataOverride,
			placeId = p10.props.entry.placeIdOverride,
			reportExperienceLaunched = p10.reportExperienceLaunchedFromInstantPlay,
			openGameDetails = p10.onGameDetailsActivated,
			onLaunchAttemptCompleted = p10.onInstantPlayAttemptCompleted
		}) else nil
	})
end

function appGameTile.render(p14)
	-- upvalues: discoveryAppLaunchTracker (ref), withStyle (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p14.props.game == nil then nil else withStyle(function(p15)
		-- upvalues: p14 (ref)
		return p14:renderContent(p15.Settings.ReducedMotion, p15, p14.props.foundationTokens)
	end)
end

function appGameTile.didMount(p16)
	-- upvalues: impressionsTagUtility (ref)
	p16.isMounted = true
	impressionsTagUtility.AddTag(p16.gameTileRef, p16.props.impressionsTag, p16.props.index)
	
	if not p16.props.useGridTile and p16.props.friendFooterEnabled and p16.props.hasInGameFriends then
		p16:setState({ canDisplayFriendFooter = true })
	end
	if p16.props.useGridTile then
		p16.loadWideThumbnail()
	end
end

function appGameTile.willUnmount(p17)
	-- upvalues: impressionsTagUtility (ref)
	p17.isMounted = false
	impressionsTagUtility.RemoveTag(p17.gameTileRef, p17.props.impressionsTag, p17.props.index)
end

function appGameTile.didUpdate(p18, p19)
	-- upvalues: impressionsTagUtility (ref)
	if p19.impressionsTag ~= p18.props.impressionsTag or p19.index ~= p18.props.index then
		impressionsTagUtility.RemoveTag(p18.gameTileRef, p19.impressionsTag, p19.index)
		impressionsTagUtility.AddTag(p18.gameTileRef, p18.props.impressionsTag, p18.props.index)
	end
	if p18.props.useGridTile and p19.universeId ~= p18.props.universeId then
		p18.loadWideThumbnail()
	end
	if not p18.props.useGridTile and (p19.friendFooterEnabled ~= p18.props.friendFooterEnabled or p19.hasInGameFriends ~= p18.props.hasInGameFriends) and (p18.props.friendFooterEnabled and p18.props.hasInGameFriends) then
		p18:setState({ canDisplayFriendFooter = true })
	end
end

local _ = function(p20, p21)
	return if p20 + p21 == 0 then "--" else tostring(math.floor(p20 / (p20 + p21) * 100 + 0.5)) .. "%"
end

appGameTile = roactRoduxModule.connect(function(p22, p23)
	-- upvalues: fFlagLuaAppGameDetailsAttributionFix (ref), gameInfosReducer (ref), gameTileConstantsModule (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var48 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref), luaAppUseRatingFormatHelper2 (ref), formatExperienceRatingModule (ref), fFlagLuaAppHomeReduceRenders (ref), t (ref)
	local universeId = p23.entry.universeId
	local var81 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var81 = if p23.entry.navigationUniverseId and p23.entry.navigationUniverseId ~= "" and p23.entry.navigationUniverseId ~= "0" then p23.entry.navigationUniverseId else p23.entry.universeId
	end
	local var89
	local var82 = p22.Personalization[gameInfosReducer.key][universeId]
	local var83 = if var82 then var82.totalUpVotes else 0
	local var84 = if var82 then var82.totalDownVotes else 0
	local var85 = if var82 then var82.friendActivityTitle else nil
	local _ = nil
	local var86 = nil
	local var87 = if var82 then var82.minimumAge else 0
	local var88 = if var82 then var82.ageRecommendationDisplayName else ""
	local _ = nil
	
	if p23.gameTileLayoutType == "Event" then
		local _ = p23.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p23.gameTileLayoutType == "Wide" then
		var89 = p23.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var89 = nil
	else
		var89 = false
	end
	local var90
	if var89 or p23.forceHideAgeRatings then
		var90 = false
	elseif var87 == 0 or var88 == "" then
		var90 = false
	else
		var90 = true
		var86 = var88
	end
	local var94, var93
	local var91 = getGameTileLayoutDataModule(var82, p23.topicId)
	local _ = nil
	local var92 = if fFlagMigrateGameIconsToStore then p23.gameIconUrl elseif p22[gameIconReducer.key][universeId] then p22[gameIconReducer.key][universeId].url else nil
	local _ = nil
	
	if fFlagLuaAppHomeThumbnailPrefetch then
		local function _(p24)
			-- upvalues: var48 (copy), var92 (write), universeId (ref), p23 (ref), var82 (ref)
			return var48({
				iconUrl = var92,
				universeId = universeId,
				placeId = p23.entry.placeId,
				useGridTile = p24,
				perEntryWideAssetId = p23.entry.primaryWideImageAssetId,
				game = var82,
				topicId = p23.topicId
			})
		end
		
		var94 = var48({
			iconUrl = var92,
			universeId = universeId,
			placeId = p23.entry.placeId,
			useGridTile = p23.useGridTile == true,
			perEntryWideAssetId = p23.entry.primaryWideImageAssetId,
			game = var82,
			topicId = p23.topicId
		})
		var93 = if p23.useGridTile then var94 else var48({
			useGridTile = true,
			iconUrl = var92,
			universeId = universeId,
			placeId = p23.entry.placeId,
			perEntryWideAssetId = p23.entry.primaryWideImageAssetId,
			game = var82,
			topicId = p23.topicId
		})
	else
		var93 = formatExperienceThumbnailModule((if p23.entry.primaryWideImageAssetId then p23.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var91)) or (if var82 then var82.primaryWideAssetId else nil), p23.entry.placeId)
		var94 = if p23.useGridTile then var93 else formatExperienceIconModule(var92, universeId)
	end
	local var95 = if p23.entry.primaryWideVideoAssetId then p23.entry.primaryWideVideoAssetId else var91 and (var91.primaryMediaAsset and var91.primaryMediaAsset.wideVideoAssetId)
	
	return {
		game = var82,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var81 else nil,
		name = if var91 then var91.title elseif var82 then var82.name else "",
		totalUpVotes = var83,
		totalDownVotes = var84,
		imageThumbnail = var94,
		wideThumbnail = var93,
		videoThumbnail = if var95 then `rbxassetid://{var95}` else nil,
		friendActivityTitle = var85,
		rating = if p23.useHoverTile or p23.useExperienceTileMetadata then if luaAppUseRatingFormatHelper2 then formatExperienceRatingModule(var83, var84, nil, true) elseif var83 + var84 == 0 then "--" else tostring(math.floor(var83 / (var83 + var84) * 100 + 0.5)) .. "%" else nil,
		showAgeRating = var90,
		ageRatingText = var86,
		friendVisits = if var82 then var82.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var82 and var82.friendVisitedString ~= "" then var82.friendVisitedString else nil,
		hidePlayButton = var89,
		footerLayoutData = if var91 then var91.footer else nil
	}
end, function(p25)
	-- upvalues: openCentralOverlayForPlacesListModule (ref), openSponsoredTooltipModule (ref)
	return {
		openContextualMenu = function(p26, p27, p28)
			-- upvalues: p25 (ref), openCentralOverlayForPlacesListModule (copy)
			p25(openCentralOverlayForPlacesListModule(p26, p27, p28))
		end,
		openSponsoredTooltip = function(p29)
			-- upvalues: p25 (ref), openSponsoredTooltipModule (copy)
			return p25(openSponsoredTooltipModule(p29))
		end
	}
end)(appGameTile)

if not fFlagLuaAppGameDetailsAttributionFix then
	appGameTile = roactServices.connect({ networking = roactNetworking })(appGameTile)
end
local var55 = function(p30)
	-- upvalues: reactModule (ref), useTokens (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), fFlagGameTileMigrateOffLegacyPresence (ref), var45 (ref), cryoModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), appGameTile (write)
	local var96 = reactModule.useRef(nil)
	local var97 = useTokens()
	local useHoverTile = p30.useHoverTile
	local var98 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useGameIcon(p30.entry.universeId) else nil
	local var99 = `{p30.impressionsTag or ""}_{p30.index or "0"}_{p30.gameTileLayoutType or "Narrow"}`
	
	if p30.impressionsTag == nil or p30.index == nil then
		useHoverTile = false
	end
	local var118
	var99 = useIsHoveredTileModule(var96, var99, useHoverTile)
	local var100 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var101 = if var100 then true else p30.useHoverTile
	local var102 = if p30.useExperienceTileMetadata ~= nil then var100 else p30.useExperienceTileMetadata
	local var103 = useValidTileBadgesModule(p30.entry.universeId, p30.topicId, p30.badgeOverride)
	local var104 = useSelector(function(p31)
		return p31.LocalUserId
	end)
	local var105 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p32)
		return p32.Users
	end) else nil
	local var106 = useSelector(function(p33)
		-- upvalues: p30 (ref)
		return p33.InGameUsersByGame[p30.entry.universeId]
	end)
	local var107 = useHasInGameFriendsModule(var104, var105, var106)
	local var108 = if fFlagGameTileMigrateOffLegacyPresence then var45(p30.entry.universeId) else nil
	local var109 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then if fFlagGameTileMigrateOffLegacyPresence then if fFlagGameTileMigrateOffLegacyPresence then reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var108 (ref)
		return cryoModule.List.map(var108 or {}, function(p34)
			return p34.id
		end)
	end, { var108 }) else nil else useInGameUserIdsModule(var104, var106) else nil
	local var110, var111 = reactModule.useState(false)
	local var112 = nil
	local _ = nil
	local var113 = nil
	local var114 = nil
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		local var115, var116 = reactModule.useState(false)
		var112 = var115
		local var117 = var116
		var113 = reactModule.useCallback(function(p35, p36, p37)
			-- upvalues: var117 (write), p30 (ref)
			var117(true)
			
			if p30.onSelectionGained then
				p30.onSelectionGained(p35, p36, p37)
			end
		end, { p30.onSelectionGained })
		var114 = reactModule.useCallback(function()
			-- upvalues: var117 (write), p30 (ref)
			var117(false)
			
			if p30.onSelectionLost then
				p30.onSelectionLost()
			end
		end, { p30.onSelectionLost })
	end
	if not fFlagLuaAppSearchResultsPageGameTileVideo then
		var118 = fFlagLuaAppGateVideoPlaybackOnNavigationFocus
		
		if var118 then
			var118 = p30.videoPlaybackContext ~= nil and p30.videoPlaybackContext.disablePlayback == true
		end
		if fFlagLuaAppFixHiddenTileVideoCleanup or fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
			reactModule.useEffect(function()
				-- upvalues: fFlagLuaAppFixHiddenTileVideoCleanup (copy), p30 (ref), fFlagLuaAppSearchResultsPageGameTileVideo (copy), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), var118 (ref), var111 (ref)
				if fFlagLuaAppFixHiddenTileVideoCleanup and p30.isHidden or (fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus) and var118 then
					var111(false)
				end
			end, {
				p30.isHidden,
				if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then var118 else nil
			})
		end
		local var119 = nil
		local var120 = nil
		local var121 = nil
		local var122 = nil
		
		if fFlagLuaAppGameDetailsAttributionFix then
			var119 = useRoactService(roactNetworking)
			var120 = if p30.entry.navigationUniverseId and p30.entry.navigationUniverseId ~= "" and p30.entry.navigationUniverseId ~= "0" then p30.entry.navigationUniverseId else p30.entry.universeId
			var122 = reactModule.useCallback(function()
				-- upvalues: p30 (ref), sponsoredGamesRecordClick (copy), var119 (write)
				local entry = p30.entry
				
				if entry.isSponsored then
					sponsoredGamesRecordClick(var119, entry.adId)
				end
			end, { var119, p30.entry.isSponsored, p30.entry.adId })
			var121 = reactModule.useCallback(function(p38)
				-- upvalues: p30 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), var120 (write), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var122 (write)
				if p30.isHovered then
					hoverTileCoordinatorModule.default:reset()
				end
				if p30.videoPlaybackContext and p30.videoPlaybackContext.videoPlaybackCoordinator then
					p30.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var120, nil)
				else
					videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var120, nil)
				end
				if p38 then
					if fFlagLuaAppGameTileInteractionFeedback and p30.onActivated then
						p30.onActivated()
					end
					local t = {
						source = p30.source,
						index = p30.index,
						referralSource = p30.referralSource,
						onPeekViewClosed = p30.onPeekViewClosed,
						placeIdOverride = p30.entry.placeIdOverride,
						experienceJoinData = {
							launchData = if p30.entry.launchDataOverride then p30.entry.launchDataOverride else nil,
							tileType = p30.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
							nativeAdData = p30.entry.adId
						}
					}
					
					if getFFlagEnableNavigationPerformanceIntervals() then
						intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
					end
					p30.navigateToGameDetails(var120, t)
					p30.reportGameDetailOpened(p30.index, var120)
					var122()
				end
			end, {
				p30.isHovered, p30.index, p30.videoAnalytics, p30.onActivated, p30.source,
				p30.referralSource, p30.onPeekViewClosed, p30.navigateToGameDetails,
				p30.reportGameDetailOpened, var120, var122, p30.entry.placeIdOverride,
				p30.entry.launchDataOverride,
				if p30.videoPlaybackContext then p30.videoPlaybackContext.videoPlaybackCoordinator else nil
			})
		end
		local createElement
		local var123 = useOverflowMenuOpen(var99)
		local var124 = useTriggerFeedback()
		local var125 = reactModule.useMemo(function()
			-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p30 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), fFlagLuaAppContinueSortInstantPlay (copy)
			return getAvailableGameTileOverflowMenuItemsModule({
				isSponsored = p30.entry.isSponsored,
				enableExplicitFeedback = p30.enableExplicitFeedback,
				enableSponsoredFeedback = p30.enableSponsoredFeedback,
				enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p30.enableReportAd else nil,
				enableGameDetails = if fFlagLuaAppContinueSortInstantPlay then p30.enableInstantPlay else nil
			})
		end, {
			p30.entry.isSponsored,
			p30.enableExplicitFeedback,
			p30.enableSponsoredFeedback,
			if fFlagLuaAppEnableSponsoredReportAd then p30.enableReportAd else nil,
			if fFlagLuaAppContinueSortInstantPlay then p30.enableInstantPlay else nil
		})
		local var126 = if p30.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p30.entry.universeId, p30.topicId) else true
		useTagAsViewportAutoplayCandidate(var96, p30.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var126 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p30.isHidden else nil)
		local var127 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
		
		if var126 and not p30.isHidden then
			local var128 = if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then not var118 else true
			
			if var128 then
				local var130
				createElement = reactModule.createElement
				var128 = gameVideoPlaybackDetectorModule
				local t = {
					videoKey = var99,
					itemIndex = p30.index,
					universeId = p30.entry.universeId,
					tileRef = var96,
					isHoverSupported = useHoverTile,
					isHovered = var99,
					isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var112 else nil
				}
				
				if fFlagLuaAppGameTileSelectionVideoPlayback then
					var130 = nil
				elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
					var130 = var127 == responsiveModule.Input.Touch
					var130 = nil
				else
					var130 = nil
				end
				t.autoplay = var130
				t.onPlaybackChange = var111
				t.videoAnalytics = p30.videoAnalytics
				t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
				t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
				t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p30.hasPrevalidatedVideoGamePlayability else nil
				t.pageContext = p30.appPage
				t.videoPlaybackContext = p30.videoPlaybackContext
				createElement = createElement(var128, t)
			else
				createElement = nil
			end
			return reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p30, {
				useExperienceTileMetadata = var102,
				hasBackground = var101,
				gameIconUrl = if fFlagMigrateGameIconsToStore then var98 else nil,
				hoverRef = var96,
				isHoverSupported = useHoverTile,
				isHovered = var99,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var112 else nil,
				isVideoPlaying = var110,
				tileBadges = var103,
				foundationTokens = var97,
				users = var105,
				inGameUsersByGame = var106,
				hasInGameFriends = var107,
				inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var109 else nil,
				networking = if fFlagLuaAppGameDetailsAttributionFix then var119 else nil,
				navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var120 else nil,
				onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var121 else nil,
				recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var122 else nil,
				overflowMenuOpen = var123,
				hoverKey = var99,
				triggerFeedback = var124,
				availableMenuItems = var125,
				onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then var113 else p30.onSelectionGained,
				onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then var114 else p30.onSelectionLost,
				videoPlaybackDetector = createElement
			}))
		end
	end
end

return if fFlagSignalsNavP3fGameDetails then reactModule.memo(var55) else var55