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
local none = reactModule.None
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
local toLegacyGameInfoModel = require(parent.GameInfosRodux).toLegacyGameInfoModel
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
local fFlagLuaAppMigrateGameTileHoverFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local fFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local fFlagLuaAppUnifyPlayButtonTile = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppGameDetailsAttributionFix = require(parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local luaAppUseRatingFormatHelper2 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local fFlagGameTileMigrateOffLegacyPresence = require(parent.SharedFlags).FFlagGameTileMigrateOffLegacyPresence
local var1 = if fFlagGameTileMigrateOffLegacyPresence then require(parent.FriendsHydrationReact).useGetOnlineFriendsByUniverseId else nil
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
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
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var2 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil
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
	onGuiStateChanged = tModule.optional(tModule.callback),
	isDisabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
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
	name = if fFlagMigrateGameInfoToStore then tModule.optional(tModule.string) else tModule.string,
	totalUpVotes = if fFlagMigrateGameInfoToStore then nil else tModule.number,
	totalDownVotes = if fFlagMigrateGameInfoToStore then nil else tModule.number,
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

function appGameTile.init(p1)
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), none (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), discoveryAnalyticsModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppUnifyPlayButtonTile (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), toLegacyGameInfoModel (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileInit()
	end
	p1.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else false,
		instantPlayRequested = if fFlagLuaAppContinueSortInstantPlay then false else nil
	}
	
	if fFlagMigrateGameInfoToStore then
		p1.gameInfoSubscription = gameHydrationReactModule.subscribeGameInfo({
			universeId = p1.props.entry.universeId,
			onChange = function(p2)
				-- upvalues: p1 (ref), none (copy)
				p1:setState({
					gameInfo = p2.gameInfo or none,
					storeVotes = p2.votes or none
				})
			end
		})
	end
	function p0.onMenuOpenChanged(p2, p3)
		-- upvalues: p1 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			universeId = p1.props.universeId,
			sortId = p1.props.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p3
		}, p1.props.appPage or "Unknown")
	end
	
	function p0.onTouchLongPress()
		-- upvalues: p1 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), getOverflowMenuSignalStore (copy)
		if next(p1.props.availableMenuItems) ~= nil then
			if p1.props.triggerFeedback and not p1.props.overflowMenuOpen then
				p1.props.triggerFeedback("TileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.props.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = p1.props.universeId,
					sortId = p1.props.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(p1.props.hoverKey)
			local t = {}
			
			for i, v in p1.props.availableMenuItems do
				table.insert(t, i)
			end
			p1.onMenuOpenChanged(false, table.concat(t, ","))
		end
	end
	
	p1.reportExperienceLaunched = if fFlagLuaAppContinueSortInstantPlay then function(...)
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p1 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy)
		if fFlagLuaAppGameDetailsAttributionFix then
			p1.props.recordSponsoredGameClick()
		else
			p1.recordSponsoredGameClick()
		end
		if p1.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p1.props.reportExperienceLaunched then
			p1.props.reportExperienceLaunched(...)
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
			
			return
		end
		videoPlaybackCoordinator.default:reset(videoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
	end else nil
	p1.reportExperienceLaunchedFromInstantPlay = if fFlagLuaAppContinueSortInstantPlay then function(p2)
		-- upvalues: p1 (ref), discoveryAnalyticsModule (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		p1.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, "ExperienceTile", discoveryAnalyticsModule.Constants.Context.InstantPlay, p1.props.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
	end else nil
	p1.reportExperienceLaunchedFromActionBar = if fFlagLuaAppContinueSortInstantPlay then p1.reportExperienceLaunched else function(...)
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p1 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy)
		if fFlagLuaAppGameDetailsAttributionFix then
			p1.props.recordSponsoredGameClick()
		else
			p1.recordSponsoredGameClick()
		end
		if p1.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p1.props.reportExperienceLaunched then
			p1.props.reportExperienceLaunched(...)
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
			
			return
		end
		videoPlaybackCoordinator.default:reset(videoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
	end
	
	function p0.renderAppExperienceActionRow(_)
		-- upvalues: roactModule (copy), appExperienceActionRowModule (copy), p1 (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (copy), fFlagLuaAppGameDetailsAttributionFix (copy), fFlagLuaAppUnifyPlayButtonTile (copy)
		return roactModule.createElement(appExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p1.props.navigationUniverseId,
			referralSource = p1.props.referralSource,
			reportExperienceLaunched = p1.reportExperienceLaunchedFromActionBar,
			openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p1.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
				-- upvalues: p1 (copy)
				p1.props.onGameTileActivated(p1.isMounted)
			end else p1.onActivated,
			entry = p1.props.entry,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			horizontalPadding = if p1.props.useGridTile then 0 else nil,
			index = p1.props.index,
			isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
			placeIdOverride = p1.props.entry.placeIdOverride,
			launchDataOverride = p1.props.entry.launchDataOverride
		})
	end
	
	p1.onInstantPlayActivated = if fFlagLuaAppContinueSortInstantPlay then function()
		-- upvalues: p1 (ref)
		if p1.props.enableInstantPlay then
			p1:setState({ instantPlayRequested = true })
		end
	end else nil
	p1.onInstantPlayAttemptCompleted = if fFlagLuaAppContinueSortInstantPlay then function()
		-- upvalues: p1 (ref)
		p1:setState({ instantPlayRequested = false })
	end else nil
	
	function p0.onHoverChanged(p2)
		-- upvalues: p1 (ref)
		if p2 and p1.props.triggerFeedback then
			p1.props.triggerFeedback("Default", "Hover")
		end
		p1:setState({ isHovered = p2 })
	end
	
	p1.gameTileRef = roactModule.createRef()
	
	function p0.getTilePosition()
		-- upvalues: p1 (ref)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p0.getTileSize()
		-- upvalues: p1 (ref)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsoluteSize else nil
	end
	
	p1.recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p1 (ref), sponsoredGamesRecordClick (copy)
		local networking = p1.props.networking
		local entry = p1.props.entry
		
		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	p1.onActivated = if fFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p1 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy)
		if p1.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		else
			videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		end
		if p1.isMounted then
			if p1.props.onActivated then
				p1.props.onActivated()
			end
			local navigationUniverseId = p1.props.navigationUniverseId
			local t = {
				source = p1.props.source,
				index = p1.props.index,
				referralSource = p1.props.referralSource,
				onPeekViewClosed = p1.props.onPeekViewClosed,
				placeIdOverride = p1.props.entry.placeIdOverride,
				experienceJoinData = {
					launchData = if p1.props.entry.launchDataOverride then p1.props.entry.launchDataOverride else nil,
					tileType = p1.props.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
					nativeAdData = p1.props.entry.adId
				}
			}
			
			if getFFlagEnableNavigationPerformanceIntervals() then
				intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
			end
			p1.props.navigateToGameDetails(navigationUniverseId, t)
			p1.props.reportGameDetailOpened(p1.props.index, navigationUniverseId)
			p1.recordSponsoredGameClick()
		end
	end
	p1.onGameDetailsActivated = if fFlagLuaAppGameDetailsAttributionFix then function()
		-- upvalues: p1 (ref)
		p1.props.onGameTileActivated(p1.isMounted)
	end else p1.onActivated
	
	function p0.onFriendFooterActivated()
		-- upvalues: p1 (ref), fFlagMigrateGameInfoToStore (copy), toLegacyGameInfoModel (copy)
		if p1.isMounted then
			local var3
			local _ = nil
			
			if fFlagMigrateGameInfoToStore then
				local gameInfo = p1.state.gameInfo
				var3 = p1.props.game or (if gameInfo then toLegacyGameInfoModel(gameInfo) else nil)
			else
				var3 = p1.props.game
			end
			p1.props.openContextualMenu(var3, p1.getTileSize(), p1.getTilePosition())
		end
	end
	
	function p0.onActivateSponsoredTooltip()
		-- upvalues: p1 (ref), responsiveModule (copy)
		if p1.isMounted then
			p1.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p0.loadWideThumbnail()
		-- upvalues: p1 (ref), contentProviderService (copy)
		local wideThumbnail = p1.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function()
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p0.getVisitedFriends()
		-- upvalues: p1 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p1.props.friendVisits
		
		for i = 1, #friendVisits do
			local var3 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var3)
			elseif p1.props.users and p1.props.users[var3] then
				table.insert(t, {
					userId = var3,
					displayName = p1.props.users[var3].displayName
				})
			end
		end
		return t
	end
	
	p1.getSortedFriends = memoize(function(p2, p3)
		-- upvalues: sortFriendsByPresenceAndRecencyFactoryModule (copy)
		if not p2 or not p3 then
			return {}
		end
		local t = {}
		
		for i, v in pairs(p3) do
			local var4 = p2[v]
			
			if var4 and var4.isFriend then
				table.insert(t, { userId = var4.id, displayName = var4.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p0.onSelectionGained()
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p1 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = true })
		end
		if p1.props.onSelectionGained or fFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionGained(p1.props.entry, p1.props.index, p1.props.navigationUniverseId)
		end
	end
	
	function p0.LuaAppGameTileHoverDelayMs()
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p1 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = false })
		end
		if p1.props.onSelectionLost or fFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionLost()
		end
	end
end

local _ = function(p2)
	if p2 == nil then
		return nil
	elseif p2.type ~= "TextLabel" then
		return nil
	end
	local text = p2.text
	
	return if text == nil then nil else text.textLiteral
end

local var4 = if fFlagLuaAppGenreRatingFooter then function(p2)
	if p2 == nil then
		return nil
	elseif p2.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p2.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p2)
	-- upvalues: fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var4 (write), fFlagMigrateGameInfoToStore (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), reactModule (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var5 = p2.props.useHoverTile or p2.props.useExperienceTileMetadata
	local friendFooterEnabled = p2.props.friendFooterEnabled
	local hasInGameFriends = p2.props.hasInGameFriends
	local var6 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p2.props.inGameUserIds else nil
	local var7 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p2.getSortedFriends(p2.props.users, p2.props.inGameUsersByGame)
	local var8 = friendFooterEnabled
	
	if var8 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var8 = var6
			
			if var8 then
				var8 = #var6 > 0
				var8 = nil
			end
		else
			var8 = hasInGameFriends
		end
	end
	local var9
	local var10 = p2.props.friendVisits and #p2.props.friendVisits > 0
	local _ = nil
	local footerLayoutData = p2.props.footerLayoutData
	
	if footerLayoutData == nil then
		var9 = nil
	elseif footerLayoutData.type == "TextLabel" then
		local text = footerLayoutData.text
		var9 = if text == nil then nil else text.textLiteral
	else
		var9 = nil
	end
	local gameInfo
	local var11 = if fFlagLuaAppGenreRatingFooter then var4(p2.props.footerLayoutData) else nil
	local var12 = false
	local var13 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var13 = p2.props.ageRatingText
	elseif not p2.props.hidePlayButton and not p2.props.forceHideAgeRatings then
		gameInfo = p2.state.gameInfo
		local var14 = if gameInfo then gameInfo.gameAgeDisplayName else ""
		var13 = if (if gameInfo then gameInfo.gameMinimumAge else 0) == 0 or var14 == "" then nil else var14
	end
	if (p2.props.isHovered or (if fFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected)) and (var13 and not p2.props.hidePlayButton) then
		var9 = var13
		var12 = true
	end
	gameInfo = var9 ~= nil
	local var15 = if fFlagLuaAppGenreRatingFooter then var11 ~= nil else nil
	local entry = p2.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p2.props.isSponsoredFooterAllowed or p2.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p2.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p2.props.useExperienceTileMetadata and (isShowSponsoredLabel or gameInfo or fFlagLuaAppGenreRatingFooter and var15) or fFlagLuaAppNarrowTileSmallerFooterFont and p2.props.compactMetadataFormat then
		var5 = false
	end
	local var16, var17
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local storeVotes = p2.state.storeVotes
		var16 = if storeVotes then storeVotes.upVotes else 0
		var17 = if storeVotes then storeVotes.downVotes else 0
	else
		var16 = p2.props.totalUpVotes
		var17 = p2.props.totalDownVotes
	end
	local var18 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = var16,
			totalDownVotes = var17,
			playerCount = if p2.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p2.props.entry.playerCount else nil
		},
		isGridTile = p2.props.useGridTile,
		hideGameStats = p2.props.hideGameStats,
		useLargerFont = var5,
		gameTileLayoutType = p2.props.gameTileLayoutType,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p2.props.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p2.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p2.props.hidePlayerCount else nil
	})
	
	if p2.props.hideMetadata then
		return if p2.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var5,
			onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
			gameTileLayoutType = p2.props.gameTileLayoutType,
			isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var18
		}) elseif var12 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var9,
			useLargerFont = var5
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var5,
			onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
			gameTileLayoutType = p2.props.gameTileLayoutType,
			isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var18
		}) elseif fFlagLuaAppGenreRatingFooter and var15 and not var12 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var5,
			totalUpVotes = var16,
			totalDownVotes = var17,
			genreText = var11
		}) elseif gameInfo then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var9,
			useLargerFont = var5
		}) elseif var8 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var5,
			friendUserIds = var6,
			onFriendFooterActivated = p2.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var7,
			useLargerFont = var5
		}) elseif p2.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p2.props.friendVisitedString,
			iconSize = if var5 then 32 else 24,
			useLargerFont = var5
		}) elseif var10 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p2.getVisitedFriends(),
			useLargerFont = var5
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p2.getVisitedFriends(),
			useLargerFont = var5
		}) else var18
	end
end

function appGameTile.renderContent(p2, p3, p4, p5)
	-- upvalues: gameTileConstantsModule (ref), gameTileViewConfigModule (ref), fFlagMigrateGameInfoToStore (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), gameTileVideoThumbnailModule (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppGameDetailsAttributionFix (ref), luaAppKeepTileBadgesDuringVideo (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), foundationModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActionsModule (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppEnableSponsoredReportAd (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), instantPlayLauncherModule (ref), discoveryAnalyticsModule (ref)
	local createElement
	local size = p2.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p2.props.imageThumbnail
	local onGameTileActivated = p2.props.onGameTileActivated
	local var5 = if p2.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p2.props.isHovered and p2.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p2.props.gameTileLayoutType)
	local var6 = p2:renderGridTilesFooter()
	local var7 = if p2.props.hideTitle then nil elseif fFlagMigrateGameInfoToStore then p2.props.name or (if p2.state.gameInfo then p2.state.gameInfo.name else "") else p2.props.name
	local var8 = if var5 then reactModule.createElement(gameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p2.props.entry.playerCount
		}
	}) else nil
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(p4.Tokens, p2.props.textSizeOffset, p2.props.contentTextLineCount, p2.props.foundationTokens, true).playButtonHeight
	
	if p2.props.isHidden then
		createElement = reactModule.createElement(hiddenTileContentModule, {
			appPage = p2.props.appPage,
			collectionId = p2.props.topicId,
			setGameHidden = p2.props.setGameHidden,
			universeId = p2.props.universeId,
			parentRef = p2.props.hoverRef,
			isSponsored = p2.props.entry.isSponsored
		})
	elseif p2.props.videoThumbnail then
		createElement = reactModule.createElement
		createElement = createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = p2.props.videoThumbnail,
			image = imageThumbnail,
			playing = p2.props.isVideoPlaying,
			Size = UDim2.fromScale(1, 1),
			isTileContained = p2.props.isContained,
			cornerRadius = p4.Tokens.Size.Size_200,
			onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay then p2.onInstantPlayActivated elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameTileExtractGameDetailsCallback then p2.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
				-- upvalues: onGameTileActivated (ref), p2 (ref)
				onGameTileActivated(p2.isMounted)
			end else p2.onActivated else nil,
			itemIndex = p2.props.index,
			videoAnalytics = p2.props.videoAnalytics,
			universeId = p2.props.universeId,
			videoPlaybackCoordinator = if p2.props.videoPlaybackContext then p2.props.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	else
		createElement = nil
	end
	local var9 = if luaAppKeepTileBadgesDuringVideo or not p2.props.isVideoPlaying then if p2.props.tileBadges then roactModule.createFragment({
		SocialFeaturePill = var8,
		Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p2.props.tileBadges })
	}) else var8 else nil
	
	if fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay and not p2.props.isHidden then
		local var10 = reactModule.createElement(foundationModule.View, {
			tag = "align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle",
			backgroundStyle = p5.Color.Extended.Black.Black_70
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.PlayLarge,
				size = foundationModule.Enums.IconSize.XLarge,
				style = p5.Color.Extended.White.White_100
			})
		})
		var9 = if var9 then roactModule.createFragment({ Existing = var9, PlayOverlay = var10 }) else var10
	end
	local createElement_1
	local isHidden = p2.props.isHidden
	
	if next(p2.props.availableMenuItems) == nil or not p2.props.isHovered and not p2.props.overflowMenuOpen and not (if fFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected) or isHidden then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActionsModule else gameTileOverflowMenuModule, {
			isHovered = p2.props.isHovered,
			isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected,
			universeId = p2.props.universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p2.props.entry.placeId else nil,
			collectionId = p2.props.topicId,
			appPage = p2.props.appPage,
			setGameHidden = p2.props.setGameHidden,
			menuKey = p2.props.hoverKey,
			menuOpen = p2.props.overflowMenuOpen,
			onMenuOpenChanged = p2.onMenuOpenChanged,
			parentRef = p2.props.hoverRef,
			isSponsored = p2.props.entry.isSponsored,
			payerName = p2.props.entry.payerName,
			sponsoredUserCohort = p2.props.sponsoredUserCohort,
			adId = if fFlagLuaAppEnableSponsoredReportAd then p2.props.entry.adId else nil,
			availableMenuItems = p2.props.availableMenuItems,
			onGameDetailsActivated = if fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay then p2.onGameDetailsActivated else nil
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		ZIndex = p2.props.ZIndex,
		LayoutOrder = p2.props.layoutOrder,
		ref = p2.gameTileRef
	}, {
		Tile = reactModule.createElement(gameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p2.props.SelectionOrder,
			Selectable = not isHidden,
			hoverPadding = if fFlagLuaAppMigrateGameTileHoverFixes or p2.props.useGridTile then nil else p4.Tokens.Size.Size_200,
			numLinesForTitle = p2.props.contentTextLineCount,
			numLinesForMetadata = p2.props.metadataTextLineCount,
			imageAspectRatio = imageAspectRatio,
			isContained = p2.props.isContained,
			containmentSidePadding = gameTileViewConfigModule.getContainmentSidePadding(p4.Tokens, p2.props.gameTileLayoutType, p2.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p2.props.onTileImageLoaded else nil,
			thumbnailComponent = createElement,
			title = if isHidden then nil else var7,
			isDisabled = if isHidden then true else p2.props.isDisabled,
			onActivated = if fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay and not isHidden then p2.onInstantPlayActivated elseif fFlagLuaAppGameTileExtractGameDetailsCallback then if not isHidden then p2.onGameDetailsActivated else p2.onActivated elseif fFlagLuaAppGameDetailsAttributionFix and not isHidden then function()
				-- upvalues: onGameTileActivated (ref), p2 (ref)
				onGameTileActivated(p2.isMounted)
			end else p2.onActivated,
			onGuiStateChanged = p2.props.onGuiStateChanged,
			onSelectionGained = p2.onSelectionGained,
			onSelectionLost = p2.onSelectionLost,
			onTouchLongPress = if not isHidden then p2.onTouchLongPress else nil,
			reducedMotion = p3,
			isHovered = if isHidden then false else p2.props.isHovered,
			forwardRef = p2.props.hoverRef,
			hidePlayButton = if isHidden then true else p2.props.hidePlayButton,
			hoverActionRow = if p2.props.hidePlayButton or isHidden or fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay then nil else reactModule.createElement(appExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p2.props.navigationUniverseId,
				referralSource = p2.props.referralSource,
				reportExperienceLaunched = p2.reportExperienceLaunchedFromActionBar,
				openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p2.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
					-- upvalues: onGameTileActivated (ref), p2 (ref)
					onGameTileActivated(p2.isMounted)
				end else p2.onActivated,
				entry = p2.props.entry,
				launchExperienceEventContext = p2.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p2.props.index,
				height = playButtonHeight,
				showButtonText = imageAspectRatio > 1,
				isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p2.props.entry.placeIdOverride,
				launchDataOverride = p2.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if isHidden then nil else var9,
			overflowMenu = createElement_1,
			footerMetadata = if isHidden then nil else var6,
			textSizeOffset = p2.props.textSizeOffset,
			hideMetadata = p2.props.hideMetadata
		}),
		VideoPlaybackDetector = p2.props.videoPlaybackDetector,
		InstantPlayLauncher = if fFlagLuaAppContinueSortInstantPlay and p2.props.enableInstantPlay and p2.state.instantPlayRequested then reactModule.createElement(instantPlayLauncherModule, {
			launchSource = "ExperienceTile",
			universeId = p2.props.navigationUniverseId,
			referralSource = p2.props.referralSource,
			eventContext = discoveryAnalyticsModule.Constants.Context.InstantPlay,
			launchData = p2.props.entry.launchDataOverride,
			placeId = p2.props.entry.placeIdOverride,
			reportExperienceLaunched = p2.reportExperienceLaunchedFromInstantPlay,
			openGameDetails = p2.onGameDetailsActivated,
			onLaunchAttemptCompleted = p2.onInstantPlayAttemptCompleted
		}) else nil
	})
end

function appGameTile.render(p2)
	-- upvalues: discoveryAppLaunchTracker (ref), withStyle (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p2.props.game == nil then nil else withStyle(function(p3)
		-- upvalues: p2 (ref)
		return p2:renderContent(p3.Settings.ReducedMotion, p3, p2.props.foundationTokens)
	end)
end

function appGameTile.didMount(p2)
	-- upvalues: impressionsTagUtility (ref)
	p2.isMounted = true
	impressionsTagUtility.AddTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	
	if not p2.props.useGridTile and p2.props.friendFooterEnabled and p2.props.hasInGameFriends then
		p2:setState({ canDisplayFriendFooter = true })
	end
	if p2.props.useGridTile then
		p2.loadWideThumbnail()
	end
end

function appGameTile.willUnmount(p2)
	-- upvalues: impressionsTagUtility (ref), fFlagMigrateGameInfoToStore (ref)
	p2.isMounted = false
	impressionsTagUtility.RemoveTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	
	if fFlagMigrateGameInfoToStore then
		p2.gameInfoSubscription.dispose()
	end
end

function appGameTile.didUpdate(p2, p3)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), impressionsTagUtility (ref)
	if fFlagMigrateGameInfoToStore then
		p2.gameInfoSubscription.update(p2.props.entry.universeId)
	end
	if p3.impressionsTag ~= p2.props.impressionsTag or p3.index ~= p2.props.index then
		impressionsTagUtility.RemoveTag(p2.gameTileRef, p3.impressionsTag, p3.index)
		impressionsTagUtility.AddTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	end
	if p2.props.useGridTile and p3.universeId ~= p2.props.universeId then
		p2.loadWideThumbnail()
	end
	if not p2.props.useGridTile and (p3.friendFooterEnabled ~= p2.props.friendFooterEnabled or p3.hasInGameFriends ~= p2.props.hasInGameFriends) and (p2.props.friendFooterEnabled and p2.props.hasInGameFriends) then
		p2:setState({ canDisplayFriendFooter = true })
	end
end

local _ = function(p2, p3)
	return if p2 + p3 == 0 then "--" else tostring(math.floor(p2 / (p2 + p3) * 100 + 0.5)) .. "%"
end

appGameTile = roactRoduxModule.connect(function(p2, p3)
	-- upvalues: fFlagLuaAppGameDetailsAttributionFix (ref), gameInfosReducer (ref), fFlagMigrateGameInfoToStore (ref), gameTileConstantsModule (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var2 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref), luaAppUseRatingFormatHelper2 (ref), formatExperienceRatingModule (ref), fFlagLuaAppHomeReduceRenders (ref), t (ref)
	local universeId = p3.entry.universeId
	local var5 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var5 = if p3.entry.navigationUniverseId and p3.entry.navigationUniverseId ~= "" and p3.entry.navigationUniverseId ~= "0" then p3.entry.navigationUniverseId else p3.entry.universeId
	end
	local var6 = p2.Personalization[gameInfosReducer.key][universeId]
	local var7 = nil
	local var8 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var7 = if var6 then var6.totalUpVotes else 0
		var8 = if var6 then var6.totalDownVotes else 0
	end
	local var9 = if var6 then var6.friendActivityTitle else nil
	local var10 = nil
	local var11 = nil
	local var12 = nil
	local var13 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var12 = if var6 then var6.minimumAge else 0
		var13 = if var6 then var6.ageRecommendationDisplayName else ""
	end
	local var14
	local _ = nil
	
	if p3.gameTileLayoutType == "Event" then
		local _ = p3.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p3.gameTileLayoutType == "Wide" then
		var14 = p3.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var14 = nil
	else
		var14 = false
	end
	if not fFlagMigrateGameInfoToStore then
		if var14 or p3.forceHideAgeRatings then
			var10 = false
		elseif var12 == 0 or var13 == "" then
			var10 = false
		else
			var10 = true
			var11 = var13
		end
	end
	local var15, var16
	local var17 = getGameTileLayoutDataModule(var6, p3.topicId)
	local _ = nil
	local var18 = if fFlagMigrateGameIconsToStore then p3.gameIconUrl elseif p2[gameIconReducer.key][universeId] then p2[gameIconReducer.key][universeId].url else nil
	local _ = nil
	
	if fFlagLuaAppHomeThumbnailPrefetch then
		local function _(p4)
			-- upvalues: var2 (copy), var18 (write), universeId (ref), p3 (ref), var6 (ref)
			return var2({
				iconUrl = var18,
				universeId = universeId,
				placeId = p3.entry.placeId,
				useGridTile = p4,
				perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
				game = var6,
				topicId = p3.topicId
			})
		end
		
		var15 = var2({
			iconUrl = var18,
			universeId = universeId,
			placeId = p3.entry.placeId,
			useGridTile = p3.useGridTile == true,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = var6,
			topicId = p3.topicId
		})
		var16 = if p3.useGridTile then var15 else var2({
			useGridTile = true,
			iconUrl = var18,
			universeId = universeId,
			placeId = p3.entry.placeId,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = var6,
			topicId = p3.topicId
		})
	else
		var16 = formatExperienceThumbnailModule((if p3.entry.primaryWideImageAssetId then p3.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var17)) or (if var6 then var6.primaryWideAssetId else nil), p3.entry.placeId)
		var15 = if p3.useGridTile then var16 else formatExperienceIconModule(var18, universeId)
	end
	local var19 = if p3.entry.primaryWideVideoAssetId then p3.entry.primaryWideVideoAssetId else var17 and (var17.primaryMediaAsset and var17.primaryMediaAsset.wideVideoAssetId)
	local var20 = if var19 then `rbxassetid://{var19}` else nil
	local var21 = nil
	
	if not fFlagMigrateGameInfoToStore then
		if not p3.useHoverTile and not p3.useExperienceTileMetadata then
			var21 = nil
		elseif luaAppUseRatingFormatHelper2 then
			var21 = formatExperienceRatingModule(var7, var8, nil, true)
		else
			local var22 = var7
			local var23 = var8
			var21 = if var22 + var23 == 0 then "--" else tostring(math.floor(var22 / (var22 + var23) * 100 + 0.5)) .. "%"
		end
	end
	local _ = nil
	
	return {
		game = var6,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var5 else nil,
		name = if fFlagMigrateGameInfoToStore then var17 and var17.title elseif var17 then var17.title elseif var6 then var6.name else "",
		totalUpVotes = var7,
		totalDownVotes = var8,
		imageThumbnail = var15,
		wideThumbnail = var16,
		videoThumbnail = var20,
		friendActivityTitle = var9,
		rating = var21,
		showAgeRating = var10,
		ageRatingText = var11,
		friendVisits = if var6 then var6.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var6 and var6.friendVisitedString ~= "" then var6.friendVisitedString else nil,
		hidePlayButton = var14,
		footerLayoutData = if var17 then var17.footer else nil
	}
end, function(p2)
	-- upvalues: openCentralOverlayForPlacesListModule (ref), openSponsoredTooltipModule (ref)
	return {
		openContextualMenu = function(p3, p4, p5)
			-- upvalues: p2 (ref), openCentralOverlayForPlacesListModule (copy)
			p2(openCentralOverlayForPlacesListModule(p3, p4, p5))
		end,
		openSponsoredTooltip = function(p3)
			-- upvalues: p2 (ref), openSponsoredTooltipModule (copy)
			return p2(openSponsoredTooltipModule(p3))
		end
	}
end)(appGameTile)

if not fFlagLuaAppGameDetailsAttributionFix then
	appGameTile = roactServices.connect({ networking = roactNetworking })(appGameTile)
end
local var5 = function(p2)
	-- upvalues: reactModule (ref), useTokens (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), fFlagGameTileMigrateOffLegacyPresence (ref), var1 (ref), cryoModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), appGameTile (write)
	local var6 = reactModule.useRef(nil)
	local var7 = useTokens()
	local useHoverTile = p2.useHoverTile
	local var8 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useGameIcon(p2.entry.universeId) else nil
	local var9 = `{p2.impressionsTag or ""}_{p2.index or "0"}_{p2.gameTileLayoutType or "Narrow"}`
	
	if p2.impressionsTag == nil or p2.index == nil then
		useHoverTile = false
	end
	local var10
	local var11 = useIsHoveredTileModule(var6, var9, useHoverTile)
	local var12 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var13 = if var12 then true else p2.useHoverTile
	local var14 = if p2.useExperienceTileMetadata ~= nil then var12 else p2.useExperienceTileMetadata
	local var15 = useValidTileBadgesModule(p2.entry.universeId, p2.topicId, p2.badgeOverride)
	local var16 = useSelector(function(p3)
		return p3.LocalUserId
	end)
	local var17 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p3)
		return p3.Users
	end) else nil
	local var18 = useSelector(function(p3)
		-- upvalues: p2 (ref)
		return p3.InGameUsersByGame[p2.entry.universeId]
	end)
	local var19 = useHasInGameFriendsModule(var16, var17, var18)
	local var20 = if fFlagGameTileMigrateOffLegacyPresence then var1(p2.entry.universeId) else nil
	local var21 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then if fFlagGameTileMigrateOffLegacyPresence then if fFlagGameTileMigrateOffLegacyPresence then reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var20 (ref)
		return cryoModule.List.map(var20 or {}, function(p3)
			return p3.id
		end)
	end, { var20 }) else nil else useInGameUserIdsModule(var16, var18) else nil
	local var22, var23 = reactModule.useState(false)
	local var24 = nil
	local _ = nil
	local var25 = nil
	local var26 = nil
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		local var27, var28 = reactModule.useState(false)
		var24 = var27
		local var29 = var28
		var25 = reactModule.useCallback(function(p3, p4, p5)
			-- upvalues: var29 (write), p2 (ref)
			var29(true)
			
			if p2.onSelectionGained then
				p2.onSelectionGained(p3, p4, p5)
			end
		end, { p2.onSelectionGained })
		var26 = reactModule.useCallback(function()
			-- upvalues: var29 (write), p2 (ref)
			var29(false)
			
			if p2.onSelectionLost then
				p2.onSelectionLost()
			end
		end, { p2.onSelectionLost })
	end
	if not fFlagLuaAppSearchResultsPageGameTileVideo then
		var10 = fFlagLuaAppGateVideoPlaybackOnNavigationFocus
		
		if var10 then
			var10 = p2.videoPlaybackContext ~= nil and p2.videoPlaybackContext.disablePlayback == true
		end
		if fFlagLuaAppFixHiddenTileVideoCleanup or fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
			reactModule.useEffect(function()
				-- upvalues: fFlagLuaAppFixHiddenTileVideoCleanup (copy), p2 (ref), fFlagLuaAppSearchResultsPageGameTileVideo (copy), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), var10 (ref), var23 (ref)
				if fFlagLuaAppFixHiddenTileVideoCleanup and p2.isHidden or (fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus) and var10 then
					var23(false)
				end
			end, {
				p2.isHidden,
				if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then var10 else nil
			})
		end
		local var30 = nil
		local var31 = nil
		local var32 = nil
		local var33 = nil
		
		if fFlagLuaAppGameDetailsAttributionFix then
			var30 = useRoactService(roactNetworking)
			var31 = if p2.entry.navigationUniverseId and p2.entry.navigationUniverseId ~= "" and p2.entry.navigationUniverseId ~= "0" then p2.entry.navigationUniverseId else p2.entry.universeId
			var33 = reactModule.useCallback(function()
				-- upvalues: p2 (ref), sponsoredGamesRecordClick (copy), var30 (write)
				local entry = p2.entry
				
				if entry.isSponsored then
					sponsoredGamesRecordClick(var30, entry.adId)
				end
			end, { var30, p2.entry.isSponsored, p2.entry.adId })
			var32 = reactModule.useCallback(function(p3)
				-- upvalues: p2 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), var31 (write), videoPlaybackCoordinator (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var33 (write)
				if p2.isHovered then
					hoverTileCoordinatorModule.default:reset()
				end
				if p2.videoPlaybackContext and p2.videoPlaybackContext.videoPlaybackCoordinator then
					p2.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var31, nil)
				else
					videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var31, nil)
				end
				if p3 then
					if p2.onActivated then
						p2.onActivated()
					end
					local t = {
						source = p2.source,
						index = p2.index,
						referralSource = p2.referralSource,
						onPeekViewClosed = p2.onPeekViewClosed,
						placeIdOverride = p2.entry.placeIdOverride,
						experienceJoinData = {
							launchData = if p2.entry.launchDataOverride then p2.entry.launchDataOverride else nil,
							tileType = p2.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
							nativeAdData = p2.entry.adId
						}
					}
					
					if getFFlagEnableNavigationPerformanceIntervals() then
						intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
					end
					p2.navigateToGameDetails(var31, t)
					p2.reportGameDetailOpened(p2.index, var31)
					var33()
				end
			end, {
				p2.isHovered, p2.index, p2.videoAnalytics, p2.onActivated, p2.source,
				p2.referralSource, p2.onPeekViewClosed, p2.navigateToGameDetails,
				p2.reportGameDetailOpened, var31, var33, p2.entry.placeIdOverride,
				p2.entry.launchDataOverride,
				if p2.videoPlaybackContext then p2.videoPlaybackContext.videoPlaybackCoordinator else nil
			})
		end
		local createElement
		local var34 = useOverflowMenuOpen(var9)
		local var35 = useTriggerFeedback()
		local var36 = reactModule.useMemo(function()
			-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p2 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), fFlagLuaAppContinueSortInstantPlay (copy)
			return getAvailableGameTileOverflowMenuItemsModule({
				isSponsored = p2.entry.isSponsored,
				enableExplicitFeedback = p2.enableExplicitFeedback,
				enableSponsoredFeedback = p2.enableSponsoredFeedback,
				enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p2.enableReportAd else nil,
				enableGameDetails = if fFlagLuaAppContinueSortInstantPlay then p2.enableInstantPlay else nil
			})
		end, {
			p2.entry.isSponsored,
			p2.enableExplicitFeedback,
			p2.enableSponsoredFeedback,
			if fFlagLuaAppEnableSponsoredReportAd then p2.enableReportAd else nil,
			if fFlagLuaAppContinueSortInstantPlay then p2.enableInstantPlay else nil
		})
		local var37 = if p2.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p2.entry.universeId, p2.topicId) else true
		useTagAsViewportAutoplayCandidate(var6, p2.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var37 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p2.isHidden else nil)
		local var38 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
		
		if var37 and not p2.isHidden then
			local var39 = if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then not var10 else true
			
			if var39 then
				local var40
				createElement = reactModule.createElement
				var39 = gameVideoPlaybackDetectorModule
				local t = {
					videoKey = var9,
					itemIndex = p2.index,
					universeId = p2.entry.universeId,
					tileRef = var6,
					isHoverSupported = useHoverTile,
					isHovered = var11,
					isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var24 else nil
				}
				
				if fFlagLuaAppGameTileSelectionVideoPlayback then
					var40 = nil
				elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
					var40 = var38 == responsiveModule.Input.Touch
					var40 = nil
				else
					var40 = nil
				end
				t.autoplay = var40
				t.onPlaybackChange = var23
				t.videoAnalytics = p2.videoAnalytics
				t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
				t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
				t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p2.hasPrevalidatedVideoGamePlayability else nil
				t.pageContext = p2.appPage
				t.videoPlaybackContext = p2.videoPlaybackContext
				createElement = createElement(var39, t)
			else
				createElement = nil
			end
			return reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p2, {
				useExperienceTileMetadata = var14,
				hasBackground = var13,
				gameIconUrl = if fFlagMigrateGameIconsToStore then var8 else nil,
				hoverRef = var6,
				isHoverSupported = useHoverTile,
				isHovered = var11,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var24 else nil,
				isVideoPlaying = var22,
				tileBadges = var15,
				foundationTokens = var7,
				users = var17,
				inGameUsersByGame = var18,
				hasInGameFriends = var19,
				inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var21 else nil,
				networking = if fFlagLuaAppGameDetailsAttributionFix then var30 else nil,
				navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var31 else nil,
				onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var32 else nil,
				recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var33 else nil,
				overflowMenuOpen = var34,
				hoverKey = var9,
				triggerFeedback = var35,
				availableMenuItems = var36,
				onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then var25 else p2.onSelectionGained,
				onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then var26 else p2.onSelectionLost,
				videoPlaybackDetector = createElement
			}))
		end
	end
end

return if fFlagSignalsNavP3fGameDetails then reactModule.memo(var5) else var5