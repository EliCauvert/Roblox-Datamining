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
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var48 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local gameTileContextualActionsModule = require(gameTile.GameTileContextualActions)
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local getAvailableGameTileOverflowMenuItemsModule = require(gameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _() --[[ line: 157 | named "getHoverDelay" ]]
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

function appGameTile.init(p0) --[[ line: 288 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), none (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), discoveryAnalyticsModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppUnifyPlayButtonTile (ref), sponsoredGamesRecordClick (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), toLegacyGameInfoModel (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileInit()
	end
	p0.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else false,
		instantPlayRequested = if fFlagLuaAppContinueSortInstantPlay then false else nil
	}
	
	if fFlagMigrateGameInfoToStore then
		p0.gameInfoSubscription = gameHydrationReactModule.subscribeGameInfo({
			universeId = p0.props.entry.universeId,
			onChange = function(p1) --[[ line: 306 ]]
				-- upvalues: p0 (ref), none (copy)
				p0:setState({
					gameInfo = p1.gameInfo or none,
					storeVotes = p1.votes or none
				})
			end
		})
	end
	function p0.onMenuOpenChanged(p2, p3) --[[ line: 315 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.props.appPage,
			universeId = p0.props.universeId,
			sortId = p0.props.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p3
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.props.appPage or "Unknown" else nil)
	end
	
	function p0.onTouchLongPress() --[[ line: 330 ]]
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
	
	p0.reportExperienceLaunched = if fFlagLuaAppContinueSortInstantPlay then function(...) --[[ line: 359 ]]
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
	p0.reportExperienceLaunchedFromInstantPlay = if fFlagLuaAppContinueSortInstantPlay then function(p4) --[[ line: 394 ]]
		-- upvalues: p0 (ref), discoveryAnalyticsModule (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		p0.reportExperienceLaunched(p0.props.entry, p0.props.referralSource, "ExperienceTile", discoveryAnalyticsModule.Constants.Context.InstantPlay, p0.props.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p4 else nil)
	end else nil
	p0.reportExperienceLaunchedFromActionBar = if fFlagLuaAppContinueSortInstantPlay then p0.reportExperienceLaunched else function(...) --[[ line: 408 ]]
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
	
	function p0.renderAppExperienceActionRow(_) --[[ line: 441 ]]
		-- upvalues: roactModule (copy), appExperienceActionRowModule (copy), p0 (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (copy), fFlagLuaAppGameDetailsAttributionFix (copy), fFlagLuaAppUnifyPlayButtonTile (copy)
		return roactModule.createElement(appExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p0.props.navigationUniverseId,
			referralSource = p0.props.referralSource,
			reportExperienceLaunched = p0.reportExperienceLaunchedFromActionBar,
			openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p0.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 449 ]]
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
	
	p0.onInstantPlayActivated = if fFlagLuaAppContinueSortInstantPlay then function() --[[ line: 464 ]]
		-- upvalues: p0 (ref)
		if p0.props.enableInstantPlay then
			p0:setState({ instantPlayRequested = true })
		end
	end else nil
	p0.onInstantPlayAttemptCompleted = if fFlagLuaAppContinueSortInstantPlay then function() --[[ line: 474 ]]
		-- upvalues: p0 (ref)
		p0:setState({ instantPlayRequested = false })
	end else nil
	
	function p0.onHoverChanged(p5) --[[ line: 481 ]]
		-- upvalues: p0 (ref)
		if p5 and p0.props.triggerFeedback then
			p0.props.triggerFeedback("Default", "Hover")
		end
		p0:setState({ isHovered = p5 })
	end
	
	p0.gameTileRef = roactModule.createRef()
	
	function p0.getTilePosition() --[[ line: 493 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p0.getTileSize() --[[ line: 501 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsoluteSize else nil
	end
	
	p0.recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 511 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy)
		local networking = p0.props.networking
		local entry = p0.props.entry
		
		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	p0.onActivated = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 522 ]]
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
	p0.onGameDetailsActivated = if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 580 ]]
		-- upvalues: p0 (ref)
		p0.props.onGameTileActivated(p0.isMounted)
	end else p0.onActivated
	
	function p0.onFriendFooterActivated() --[[ line: 585 ]]
		-- upvalues: p0 (ref), fFlagMigrateGameInfoToStore (copy), toLegacyGameInfoModel (copy)
		if p0.isMounted then
			local var58
			local _ = nil
			
			if fFlagMigrateGameInfoToStore then
				local gameInfo = p0.state.gameInfo
				var58 = p0.props.game or (if gameInfo then toLegacyGameInfoModel(gameInfo) else nil)
			else
				var58 = p0.props.game
			end
			p0.props.openContextualMenu(var58, p0.getTileSize(), p0.getTilePosition())
		end
	end
	
	function p0.onActivateSponsoredTooltip() --[[ line: 601 ]]
		-- upvalues: p0 (ref), responsiveModule (copy)
		if p0.isMounted then
			p0.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p0.loadWideThumbnail() --[[ line: 609 ]]
		-- upvalues: p0 (ref), contentProviderService (copy)
		local wideThumbnail = p0.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function() --[[ line: 612 ]]
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p0.getVisitedFriends() --[[ line: 618 ]]
		-- upvalues: p0 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p0.props.friendVisits
		
		for i = 1, #friendVisits do
			local var60 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var60)
			elseif p0.props.users and p0.props.users[var60] then
				table.insert(t, {
					userId = var60,
					displayName = p0.props.users[var60].displayName
				})
			end
		end
		return t
	end
	
	p0.getSortedFriends = memoize(function(p6, p7) --[[ line: 646 ]]
		-- upvalues: sortFriendsByPresenceAndRecencyFactoryModule (copy)
		if not p6 or not p7 then
			return {}
		end
		local t = {}
		
		for i, v in pairs(p7) do
			local var62 = p6[v]
			
			if var62 and var62.isFriend then
				table.insert(t, { userId = var62.id, displayName = var62.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p0.onSelectionGained() --[[ line: 668 ]]
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = true })
		end
		if p0.props.onSelectionGained or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionGained(p0.props.entry, p0.props.index, p0.props.navigationUniverseId)
		end
	end
	
	function p0.onSelectionLost() --[[ line: 678 ]]
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = false })
		end
		if p0.props.onSelectionLost or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionLost()
		end
	end
end

local _ = function(p8) --[[ line: 692 | named "getTextLiteralForTextFooter" ]]
	if p8 == nil then
		return nil
	elseif p8.type ~= "TextLabel" then
		return nil
	end
	local text = p8.text
	
	return if text == nil then nil else text.textLiteral
end

local var54 = if fFlagLuaAppGenreRatingFooter then function(p9) --[[ line: 708 ]]
	if p9 == nil then
		return nil
	elseif p9.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p9.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p10) --[[ line: 723 ]]
	-- upvalues: fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var54 (write), fFlagMigrateGameInfoToStore (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), reactModule (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var63 = p10.props.useHoverTile or p10.props.useExperienceTileMetadata
	local friendFooterEnabled = p10.props.friendFooterEnabled
	local hasInGameFriends = p10.props.hasInGameFriends
	local var64 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p10.props.inGameUserIds else nil
	local var65 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p10.getSortedFriends(p10.props.users, p10.props.inGameUsersByGame)
	local var66 = friendFooterEnabled
	
	if var66 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var66 = var64
			
			if var66 then
				var66 = #var64 > 0
				var66 = nil
			end
		else
			var66 = hasInGameFriends
		end
	end
	local var68
	local var67 = p10.props.friendVisits and #p10.props.friendVisits > 0
	local _ = nil
	local footerLayoutData = p10.props.footerLayoutData
	
	if footerLayoutData == nil then
		var68 = nil
	elseif footerLayoutData.type == "TextLabel" then
		local text = footerLayoutData.text
		var68 = if text == nil then nil else text.textLiteral
	else
		var68 = nil
	end
	local gameInfo
	local var69 = if fFlagLuaAppGenreRatingFooter then var54(p10.props.footerLayoutData) else nil
	local var70 = false
	local var71 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var71 = p10.props.ageRatingText
	elseif not p10.props.hidePlayButton and not p10.props.forceHideAgeRatings then
		gameInfo = p10.state.gameInfo
		local var72 = if gameInfo then gameInfo.gameAgeDisplayName else ""
		var71 = if (if gameInfo then gameInfo.gameMinimumAge else 0) == 0 or var72 == "" then nil else var72
	end
	if (p10.props.isHovered or (if fFlagLuaAppGameTileSelectionVideoPlayback then p10.props.isSelected else p10.state.isSelected)) and (var71 and not p10.props.hidePlayButton) then
		var68 = var71
		var70 = true
	end
	gameInfo = var68 ~= nil
	local var73 = if fFlagLuaAppGenreRatingFooter then var69 ~= nil else nil
	local entry = p10.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p10.props.isSponsoredFooterAllowed or p10.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p10.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p10.props.useExperienceTileMetadata and (isShowSponsoredLabel or gameInfo or fFlagLuaAppGenreRatingFooter and var73) or fFlagLuaAppNarrowTileSmallerFooterFont and p10.props.compactMetadataFormat then
		var63 = false
	end
	local var75, var76
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local storeVotes = p10.state.storeVotes
		var75 = if storeVotes then storeVotes.upVotes else 0
		var76 = if storeVotes then storeVotes.downVotes else 0
	else
		var75 = p10.props.totalUpVotes
		var76 = p10.props.totalDownVotes
	end
	local var77 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = var75,
			totalDownVotes = var76,
			playerCount = if p10.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p10.props.entry.playerCount else nil
		},
		isGridTile = p10.props.useGridTile,
		hideGameStats = p10.props.hideGameStats,
		useLargerFont = var63,
		gameTileLayoutType = p10.props.gameTileLayoutType,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p10.props.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p10.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p10.props.hidePlayerCount else nil
	})
	
	if p10.props.hideMetadata then
		return if p10.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var63,
			onActivateSponsoredTooltip = p10.onActivateSponsoredTooltip,
			gameTileLayoutType = p10.props.gameTileLayoutType,
			isNarrowScreenXSmall = p10.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p10.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p10.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var77
		}) elseif var70 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var68,
			useLargerFont = var63
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var63,
			onActivateSponsoredTooltip = p10.onActivateSponsoredTooltip,
			gameTileLayoutType = p10.props.gameTileLayoutType,
			isNarrowScreenXSmall = p10.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p10.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p10.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var77
		}) elseif fFlagLuaAppGenreRatingFooter and var73 and not var70 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var63,
			totalUpVotes = var75,
			totalDownVotes = var76,
			genreText = var69
		}) elseif gameInfo then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var68,
			useLargerFont = var63
		}) elseif var66 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var63,
			friendUserIds = var64,
			onFriendFooterActivated = p10.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var65,
			useLargerFont = var63
		}) elseif p10.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p10.props.friendVisitedString,
			iconSize = if var63 then 32 else 24,
			useLargerFont = var63
		}) elseif var67 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p10.getVisitedFriends(),
			useLargerFont = var63
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p10.getVisitedFriends(),
			useLargerFont = var63
		}) else var77
	end
end

function appGameTile.renderContent(p11, p12, p13, p14) --[[ line: 926 ]]
	-- upvalues: gameTileConstantsModule (ref), gameTileViewConfigModule (ref), fFlagMigrateGameInfoToStore (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), gameTileVideoThumbnailModule (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppGameDetailsAttributionFix (ref), luaAppKeepTileBadgesDuringVideo (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), foundationModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActionsModule (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppEnableSponsoredReportAd (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppGameTileInteractionFeedback (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), instantPlayLauncherModule (ref), discoveryAnalyticsModule (ref)
	local createElement
	local size = p11.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p11.props.imageThumbnail
	local onGameTileActivated = p11.props.onGameTileActivated
	local var79 = if p11.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p11.props.isHovered and p11.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p11.props.gameTileLayoutType)
	local var81 = p11:renderGridTilesFooter()
	local var82 = if p11.props.hideTitle then nil elseif fFlagMigrateGameInfoToStore then p11.props.name or (if p11.state.gameInfo then p11.state.gameInfo.name else "") else p11.props.name
	local var83 = if var79 then reactModule.createElement(gameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p11.props.entry.playerCount
		}
	}) else nil
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(p13.Tokens, p11.props.textSizeOffset, p11.props.contentTextLineCount, p11.props.foundationTokens, true).playButtonHeight
	
	if p11.props.isHidden then
		createElement = reactModule.createElement(hiddenTileContentModule, {
			appPage = p11.props.appPage,
			collectionId = p11.props.topicId,
			setGameHidden = p11.props.setGameHidden,
			universeId = p11.props.universeId,
			parentRef = p11.props.hoverRef,
			isSponsored = p11.props.entry.isSponsored
		})
	elseif p11.props.videoThumbnail then
		createElement = reactModule.createElement
		createElement = createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = p11.props.videoThumbnail,
			image = imageThumbnail,
			playing = p11.props.isVideoPlaying,
			Size = UDim2.fromScale(1, 1),
			isTileContained = p11.props.isContained,
			cornerRadius = p13.Tokens.Size.Size_200,
			onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay then p11.onInstantPlayActivated elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameTileExtractGameDetailsCallback then p11.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 983 ]]
				-- upvalues: onGameTileActivated (ref), p11 (ref)
				onGameTileActivated(p11.isMounted)
			end else p11.onActivated else nil,
			itemIndex = p11.props.index,
			videoAnalytics = p11.props.videoAnalytics,
			universeId = p11.props.universeId,
			videoPlaybackCoordinator = if p11.props.videoPlaybackContext then p11.props.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	else
		createElement = nil
	end
	local var84 = if luaAppKeepTileBadgesDuringVideo or not p11.props.isVideoPlaying then if p11.props.tileBadges then roactModule.createFragment({
		SocialFeaturePill = var83,
		Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p11.props.tileBadges })
	}) else var83 else nil
	
	if fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay and not p11.props.isHidden then
		local var85 = reactModule.createElement(foundationModule.View, {
			tag = "align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle",
			backgroundStyle = p14.Color.Extended.Black.Black_70
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.PlayLarge,
				size = foundationModule.Enums.IconSize.XLarge,
				style = p14.Color.Extended.White.White_100
			})
		})
		var84 = if var84 then roactModule.createFragment({ Existing = var84, PlayOverlay = var85 }) else var85
	end
	local createElement_1
	local isHidden = p11.props.isHidden
	
	if next(p11.props.availableMenuItems) == nil or not p11.props.isHovered and not p11.props.overflowMenuOpen and not (if fFlagLuaAppGameTileSelectionVideoPlayback then p11.props.isSelected else p11.state.isSelected) or isHidden then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActionsModule else gameTileOverflowMenuModule, {
			isHovered = p11.props.isHovered,
			isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p11.props.isSelected else p11.state.isSelected,
			universeId = p11.props.universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p11.props.entry.placeId else nil,
			collectionId = p11.props.topicId,
			appPage = p11.props.appPage,
			setGameHidden = p11.props.setGameHidden,
			menuKey = p11.props.hoverKey,
			menuOpen = p11.props.overflowMenuOpen,
			onMenuOpenChanged = p11.onMenuOpenChanged,
			parentRef = p11.props.hoverRef,
			isSponsored = p11.props.entry.isSponsored,
			payerName = p11.props.entry.payerName,
			sponsoredUserCohort = p11.props.sponsoredUserCohort,
			adId = if fFlagLuaAppEnableSponsoredReportAd then p11.props.entry.adId else nil,
			availableMenuItems = p11.props.availableMenuItems,
			onGameDetailsActivated = if fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay then p11.onGameDetailsActivated else nil
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		ZIndex = p11.props.ZIndex,
		LayoutOrder = p11.props.layoutOrder,
		ref = p11.gameTileRef
	}, {
		Tile = reactModule.createElement(gameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p11.props.SelectionOrder,
			Selectable = not isHidden,
			hoverPadding = if fFlagLuaAppMigrateGameTileHoverFixes or p11.props.useGridTile then nil else p13.Tokens.Size.Size_200,
			numLinesForTitle = p11.props.contentTextLineCount,
			numLinesForMetadata = p11.props.metadataTextLineCount,
			imageAspectRatio = imageAspectRatio,
			isContained = p11.props.isContained,
			containmentSidePadding = gameTileViewConfigModule.getContainmentSidePadding(p13.Tokens, p11.props.gameTileLayoutType, p11.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p11.props.onTileImageLoaded else nil,
			thumbnailComponent = createElement,
			title = if isHidden then nil else var82,
			isDisabled = if isHidden then true else p11.props.isDisabled,
			onActivated = if fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay and not isHidden then p11.onInstantPlayActivated elseif fFlagLuaAppGameTileExtractGameDetailsCallback then if not isHidden then p11.onGameDetailsActivated else p11.onActivated elseif fFlagLuaAppGameDetailsAttributionFix and not isHidden then function() --[[ line: 1106 ]]
				-- upvalues: onGameTileActivated (ref), p11 (ref)
				onGameTileActivated(p11.isMounted)
			end else p11.onActivated,
			onGuiStateChanged = if fFlagLuaAppGameTileInteractionFeedback then p11.props.onGuiStateChanged else nil,
			onSelectionGained = p11.onSelectionGained,
			onSelectionLost = p11.onSelectionLost,
			onTouchLongPress = if not isHidden then p11.onTouchLongPress else nil,
			reducedMotion = p12,
			isHovered = if isHidden then false else p11.props.isHovered,
			forwardRef = p11.props.hoverRef,
			hidePlayButton = if isHidden then true else p11.props.hidePlayButton,
			hoverActionRow = if p11.props.hidePlayButton or isHidden or fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay then nil else reactModule.createElement(appExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p11.props.navigationUniverseId,
				referralSource = p11.props.referralSource,
				reportExperienceLaunched = p11.reportExperienceLaunchedFromActionBar,
				openGameDetails = if fFlagLuaAppGameTileExtractGameDetailsCallback then p11.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 1128 ]]
					-- upvalues: onGameTileActivated (ref), p11 (ref)
					onGameTileActivated(p11.isMounted)
				end else p11.onActivated,
				entry = p11.props.entry,
				launchExperienceEventContext = p11.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p11.props.index,
				height = playButtonHeight,
				showButtonText = imageAspectRatio > 1,
				isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p11.props.entry.placeIdOverride,
				launchDataOverride = p11.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if isHidden then nil else var84,
			overflowMenu = createElement_1,
			footerMetadata = if isHidden then nil else var81,
			textSizeOffset = p11.props.textSizeOffset,
			hideMetadata = p11.props.hideMetadata
		}),
		VideoPlaybackDetector = p11.props.videoPlaybackDetector,
		InstantPlayLauncher = if fFlagLuaAppContinueSortInstantPlay and p11.props.enableInstantPlay and p11.state.instantPlayRequested then reactModule.createElement(instantPlayLauncherModule, {
			launchSource = "ExperienceTile",
			universeId = p11.props.navigationUniverseId,
			referralSource = p11.props.referralSource,
			eventContext = discoveryAnalyticsModule.Constants.Context.InstantPlay,
			launchData = p11.props.entry.launchDataOverride,
			placeId = p11.props.entry.placeIdOverride,
			reportExperienceLaunched = p11.reportExperienceLaunchedFromInstantPlay,
			openGameDetails = p11.onGameDetailsActivated,
			onLaunchAttemptCompleted = p11.onInstantPlayAttemptCompleted
		}) else nil
	})
end

function appGameTile.render(p15) --[[ line: 1171 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), withStyle (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p15.props.game == nil then nil else withStyle(function(p16) --[[ line: 1181 ]]
		-- upvalues: p15 (ref)
		return p15:renderContent(p16.Settings.ReducedMotion, p16, p15.props.foundationTokens)
	end)
end

function appGameTile.didMount(p17) --[[ line: 1187 ]]
	-- upvalues: impressionsTagUtility (ref)
	p17.isMounted = true
	impressionsTagUtility.AddTag(p17.gameTileRef, p17.props.impressionsTag, p17.props.index)
	
	if not p17.props.useGridTile and p17.props.friendFooterEnabled and p17.props.hasInGameFriends then
		p17:setState({ canDisplayFriendFooter = true })
	end
	if p17.props.useGridTile then
		p17.loadWideThumbnail()
	end
end

function appGameTile.willUnmount(p18) --[[ line: 1202 ]]
	-- upvalues: impressionsTagUtility (ref), fFlagMigrateGameInfoToStore (ref)
	p18.isMounted = false
	impressionsTagUtility.RemoveTag(p18.gameTileRef, p18.props.impressionsTag, p18.props.index)
	
	if fFlagMigrateGameInfoToStore then
		p18.gameInfoSubscription.dispose()
	end
end

function appGameTile.didUpdate(p19, p20) --[[ line: 1210 ]]
	-- upvalues: fFlagMigrateGameInfoToStore (ref), impressionsTagUtility (ref)
	if fFlagMigrateGameInfoToStore then
		p19.gameInfoSubscription.update(p19.props.entry.universeId)
	end
	if p20.impressionsTag ~= p19.props.impressionsTag or p20.index ~= p19.props.index then
		impressionsTagUtility.RemoveTag(p19.gameTileRef, p20.impressionsTag, p20.index)
		impressionsTagUtility.AddTag(p19.gameTileRef, p19.props.impressionsTag, p19.props.index)
	end
	if p19.props.useGridTile and p20.universeId ~= p19.props.universeId then
		p19.loadWideThumbnail()
	end
	if not p19.props.useGridTile and (p20.friendFooterEnabled ~= p19.props.friendFooterEnabled or p20.hasInGameFriends ~= p19.props.hasInGameFriends) and (p19.props.friendFooterEnabled and p19.props.hasInGameFriends) then
		p19:setState({ canDisplayFriendFooter = true })
	end
end

local _ = function(p21, p22) --[[ line: 1239 | named "formatRating" ]]
	return if p21 + p22 == 0 then "--" else tostring(math.floor(p21 / (p21 + p22) * 100 + 0.5)) .. "%"
end

appGameTile = roactRoduxModule.connect(function(p23, p24) --[[ line: 1247 ]]
	-- upvalues: fFlagLuaAppGameDetailsAttributionFix (ref), gameInfosReducer (ref), fFlagMigrateGameInfoToStore (ref), gameTileConstantsModule (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var48 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref), luaAppUseRatingFormatHelper2 (ref), formatExperienceRatingModule (ref), fFlagLuaAppHomeReduceRenders (ref), t (ref)
	local universeId = p24.entry.universeId
	local var86 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var86 = if p24.entry.navigationUniverseId and p24.entry.navigationUniverseId ~= "" and p24.entry.navigationUniverseId ~= "0" then p24.entry.navigationUniverseId else p24.entry.universeId
	end
	local var87 = p23.Personalization[gameInfosReducer.key][universeId]
	local var88 = nil
	local var89 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var88 = if var87 then var87.totalUpVotes else 0
		var89 = if var87 then var87.totalDownVotes else 0
	end
	local var90 = if var87 then var87.friendActivityTitle else nil
	local var91 = nil
	local var92 = nil
	local var93 = nil
	local var94 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var93 = if var87 then var87.minimumAge else 0
		var94 = if var87 then var87.ageRecommendationDisplayName else ""
	end
	local var95
	local _ = nil
	
	if p24.gameTileLayoutType == "Event" then
		local _ = p24.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p24.gameTileLayoutType == "Wide" then
		var95 = p24.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var95 = nil
	else
		var95 = false
	end
	if not fFlagMigrateGameInfoToStore then
		if var95 or p24.forceHideAgeRatings then
			var91 = false
		elseif var93 == 0 or var94 == "" then
			var91 = false
		else
			var91 = true
			var92 = var94
		end
	end
	local var99, var98
	local var96 = getGameTileLayoutDataModule(var87, p24.topicId)
	local _ = nil
	local var97 = if fFlagMigrateGameIconsToStore then p24.gameIconUrl elseif p23[gameIconReducer.key][universeId] then p23[gameIconReducer.key][universeId].url else nil
	local _ = nil
	
	if fFlagLuaAppHomeThumbnailPrefetch then
		local function _(p25) --[[ line: 1324 | named "resolveThumbnail" ]]
			-- upvalues: var48 (copy), var97 (write), universeId (ref), p24 (ref), var87 (ref)
			return var48({
				iconUrl = var97,
				universeId = universeId,
				placeId = p24.entry.placeId,
				useGridTile = p25,
				perEntryWideAssetId = p24.entry.primaryWideImageAssetId,
				game = var87,
				topicId = p24.topicId
			})
		end
		
		var99 = var48({
			iconUrl = var97,
			universeId = universeId,
			placeId = p24.entry.placeId,
			useGridTile = p24.useGridTile == true,
			perEntryWideAssetId = p24.entry.primaryWideImageAssetId,
			game = var87,
			topicId = p24.topicId
		})
		var98 = if p24.useGridTile then var99 else var48({
			useGridTile = true,
			iconUrl = var97,
			universeId = universeId,
			placeId = p24.entry.placeId,
			perEntryWideAssetId = p24.entry.primaryWideImageAssetId,
			game = var87,
			topicId = p24.topicId
		})
	else
		var98 = formatExperienceThumbnailModule((if p24.entry.primaryWideImageAssetId then p24.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var96)) or (if var87 then var87.primaryWideAssetId else nil), p24.entry.placeId)
		var99 = if p24.useGridTile then var98 else formatExperienceIconModule(var97, universeId)
	end
	local var100 = if p24.entry.primaryWideVideoAssetId then p24.entry.primaryWideVideoAssetId else var96 and (var96.primaryMediaAsset and var96.primaryMediaAsset.wideVideoAssetId)
	local var101 = if var100 then `rbxassetid://{var100}` else nil
	local var102 = nil
	
	if not fFlagMigrateGameInfoToStore then
		if not p24.useHoverTile and not p24.useExperienceTileMetadata then
			var102 = nil
		elseif luaAppUseRatingFormatHelper2 then
			var102 = formatExperienceRatingModule(var88, var89, nil, true)
		else
			local var103 = var88
			local var104 = var89
			var102 = if var103 + var104 == 0 then "--" else tostring(math.floor(var103 / (var103 + var104) * 100 + 0.5)) .. "%"
		end
	end
	local _ = nil
	
	return {
		game = var87,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var86 else nil,
		name = if fFlagMigrateGameInfoToStore then var96 and var96.title elseif var96 then var96.title elseif var87 then var87.name else "",
		totalUpVotes = var88,
		totalDownVotes = var89,
		imageThumbnail = var99,
		wideThumbnail = var98,
		videoThumbnail = var101,
		friendActivityTitle = var90,
		rating = var102,
		showAgeRating = var91,
		ageRatingText = var92,
		friendVisits = if var87 then var87.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var87 and var87.friendVisitedString ~= "" then var87.friendVisitedString else nil,
		hidePlayButton = var95,
		footerLayoutData = if var96 then var96.footer else nil
	}
end, function(p26) --[[ line: 1395 ]]
	-- upvalues: openCentralOverlayForPlacesListModule (ref), openSponsoredTooltipModule (ref)
	return {
		openContextualMenu = function(p27, p28, p29) --[[ line: 1397 ]]
			-- upvalues: p26 (ref), openCentralOverlayForPlacesListModule (copy)
			p26(openCentralOverlayForPlacesListModule(p27, p28, p29))
		end,
		openSponsoredTooltip = function(p30) --[[ line: 1400 ]]
			-- upvalues: p26 (ref), openSponsoredTooltipModule (copy)
			return p26(openSponsoredTooltipModule(p30))
		end
	}
end)(appGameTile)

if not fFlagLuaAppGameDetailsAttributionFix then
	appGameTile = roactServices.connect({ networking = roactNetworking })(appGameTile)
end
local var55 = function(p31) --[[ line: 1412 ]]
	-- upvalues: reactModule (ref), useTokens (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), fFlagGameTileMigrateOffLegacyPresence (ref), var45 (ref), cryoModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppContinueSortInstantPlay (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), appGameTile (write)
	local var105 = reactModule.useRef(nil)
	local var106 = useTokens()
	local useHoverTile = p31.useHoverTile
	local var107 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useGameIcon(p31.entry.universeId) else nil
	local var108 = `{p31.impressionsTag or ""}_{p31.index or "0"}_{p31.gameTileLayoutType or "Narrow"}`
	
	if p31.impressionsTag == nil or p31.index == nil then
		useHoverTile = false
	end
	local var127
	var108 = useIsHoveredTileModule(var105, var108, useHoverTile)
	local var109 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var110 = if var109 then true else p31.useHoverTile
	local var111 = if p31.useExperienceTileMetadata ~= nil then var109 else p31.useExperienceTileMetadata
	local var112 = useValidTileBadgesModule(p31.entry.universeId, p31.topicId, p31.badgeOverride)
	local var113 = useSelector(function(p32) --[[ line: 1440 ]]
		return p32.LocalUserId
	end)
	local var114 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p33) --[[ line: 1446 ]]
		return p33.Users
	end) else nil
	local var115 = useSelector(function(p34) --[[ line: 1451 ]]
		-- upvalues: p31 (ref)
		return p34.InGameUsersByGame[p31.entry.universeId]
	end)
	local var116 = useHasInGameFriendsModule(var113, var114, var115)
	local var117 = if fFlagGameTileMigrateOffLegacyPresence then var45(p31.entry.universeId) else nil
	local var118 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then if fFlagGameTileMigrateOffLegacyPresence then if fFlagGameTileMigrateOffLegacyPresence then reactModule.useMemo(function() --[[ line: 1462 ]]
		-- upvalues: cryoModule (copy), var117 (ref)
		return cryoModule.List.map(var117 or {}, function(p35) --[[ line: 1463 ]]
			return p35.id
		end)
	end, { var117 }) else nil else useInGameUserIdsModule(var113, var115) else nil
	local var119, var120 = reactModule.useState(false)
	local var121 = nil
	local _ = nil
	local var122 = nil
	local var123 = nil
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		local var124, var125 = reactModule.useState(false)
		var121 = var124
		local var126 = var125
		var122 = reactModule.useCallback(function(p36, p37, p38) --[[ line: 1483 ]]
			-- upvalues: var126 (write), p31 (ref)
			var126(true)
			
			if p31.onSelectionGained then
				p31.onSelectionGained(p36, p37, p38)
			end
		end, { p31.onSelectionGained })
		var123 = reactModule.useCallback(function() --[[ line: 1491 ]]
			-- upvalues: var126 (write), p31 (ref)
			var126(false)
			
			if p31.onSelectionLost then
				p31.onSelectionLost()
			end
		end, { p31.onSelectionLost })
	end
	if not fFlagLuaAppSearchResultsPageGameTileVideo then
		var127 = fFlagLuaAppGateVideoPlaybackOnNavigationFocus
		
		if var127 then
			var127 = p31.videoPlaybackContext ~= nil and p31.videoPlaybackContext.disablePlayback == true
		end
		if fFlagLuaAppFixHiddenTileVideoCleanup or fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
			reactModule.useEffect(function() --[[ line: 1510 ]]
				-- upvalues: fFlagLuaAppFixHiddenTileVideoCleanup (copy), p31 (ref), fFlagLuaAppSearchResultsPageGameTileVideo (copy), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), var127 (ref), var120 (ref)
				if fFlagLuaAppFixHiddenTileVideoCleanup and p31.isHidden or (fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus) and var127 then
					var120(false)
				end
			end, {
				p31.isHidden,
				if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then var127 else nil
			})
		end
		local var128 = nil
		local var129 = nil
		local var130 = nil
		local var131 = nil
		
		if fFlagLuaAppGameDetailsAttributionFix then
			var128 = useRoactService(roactNetworking)
			var129 = if p31.entry.navigationUniverseId and p31.entry.navigationUniverseId ~= "" and p31.entry.navigationUniverseId ~= "0" then p31.entry.navigationUniverseId else p31.entry.universeId
			var131 = reactModule.useCallback(function() --[[ line: 1542 ]]
				-- upvalues: p31 (ref), sponsoredGamesRecordClick (copy), var128 (write)
				local entry = p31.entry
				
				if entry.isSponsored then
					sponsoredGamesRecordClick(var128, entry.adId)
				end
			end, { var128, p31.entry.isSponsored, p31.entry.adId })
			var130 = reactModule.useCallback(function(p39) --[[ line: 1551 ]]
				-- upvalues: p31 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), var129 (write), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var131 (write)
				if p31.isHovered then
					hoverTileCoordinatorModule.default:reset()
				end
				if p31.videoPlaybackContext and p31.videoPlaybackContext.videoPlaybackCoordinator then
					p31.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var129, nil)
				else
					videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var129, nil)
				end
				if p39 then
					if fFlagLuaAppGameTileInteractionFeedback and p31.onActivated then
						p31.onActivated()
					end
					local t = {
						source = p31.source,
						index = p31.index,
						referralSource = p31.referralSource,
						onPeekViewClosed = p31.onPeekViewClosed,
						placeIdOverride = p31.entry.placeIdOverride,
						experienceJoinData = {
							launchData = if p31.entry.launchDataOverride then p31.entry.launchDataOverride else nil,
							tileType = p31.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
							nativeAdData = p31.entry.adId
						}
					}
					
					if getFFlagEnableNavigationPerformanceIntervals() then
						intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
					end
					p31.navigateToGameDetails(var129, t)
					p31.reportGameDetailOpened(p31.index, var129)
					var131()
				end
			end, {
				p31.isHovered, p31.index, p31.videoAnalytics, p31.onActivated, p31.source,
				p31.referralSource, p31.onPeekViewClosed, p31.navigateToGameDetails,
				p31.reportGameDetailOpened, var129, var131, p31.entry.placeIdOverride,
				p31.entry.launchDataOverride,
				if p31.videoPlaybackContext then p31.videoPlaybackContext.videoPlaybackCoordinator else nil
			})
		end
		local createElement
		local var132 = useOverflowMenuOpen(var108)
		local var133 = useTriggerFeedback()
		local var134 = reactModule.useMemo(function() --[[ line: 1620 ]]
			-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p31 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), fFlagLuaAppContinueSortInstantPlay (copy)
			return getAvailableGameTileOverflowMenuItemsModule({
				isSponsored = p31.entry.isSponsored,
				enableExplicitFeedback = p31.enableExplicitFeedback,
				enableSponsoredFeedback = p31.enableSponsoredFeedback,
				enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p31.enableReportAd else nil,
				enableGameDetails = if fFlagLuaAppContinueSortInstantPlay then p31.enableInstantPlay else nil
			})
		end, {
			p31.entry.isSponsored,
			p31.enableExplicitFeedback,
			p31.enableSponsoredFeedback,
			if fFlagLuaAppEnableSponsoredReportAd then p31.enableReportAd else nil,
			if fFlagLuaAppContinueSortInstantPlay then p31.enableInstantPlay else nil
		})
		local var135 = if p31.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p31.entry.universeId, p31.topicId) else true
		useTagAsViewportAutoplayCandidate(var105, p31.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var135 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p31.isHidden else nil)
		local var136 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
		
		if var135 and not p31.isHidden then
			local var137 = if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then not var127 else true
			
			if var137 then
				local var139
				createElement = reactModule.createElement
				var137 = gameVideoPlaybackDetectorModule
				local t = {
					videoKey = var108,
					itemIndex = p31.index,
					universeId = p31.entry.universeId,
					tileRef = var105,
					isHoverSupported = useHoverTile,
					isHovered = var108,
					isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var121 else nil
				}
				
				if fFlagLuaAppGameTileSelectionVideoPlayback then
					var139 = nil
				elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
					var139 = var136 == responsiveModule.Input.Touch
					var139 = nil
				else
					var139 = nil
				end
				t.autoplay = var139
				t.onPlaybackChange = var120
				t.videoAnalytics = p31.videoAnalytics
				t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
				t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
				t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p31.hasPrevalidatedVideoGamePlayability else nil
				t.pageContext = p31.appPage
				t.videoPlaybackContext = p31.videoPlaybackContext
				createElement = createElement(var137, t)
			else
				createElement = nil
			end
			return reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p31, {
				useExperienceTileMetadata = var111,
				hasBackground = var110,
				gameIconUrl = if fFlagMigrateGameIconsToStore then var107 else nil,
				hoverRef = var105,
				isHoverSupported = useHoverTile,
				isHovered = var108,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var121 else nil,
				isVideoPlaying = var119,
				tileBadges = var112,
				foundationTokens = var106,
				users = var114,
				inGameUsersByGame = var115,
				hasInGameFriends = var116,
				inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var118 else nil,
				networking = if fFlagLuaAppGameDetailsAttributionFix then var128 else nil,
				navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var129 else nil,
				onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var130 else nil,
				recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var131 else nil,
				overflowMenuOpen = var132,
				hoverKey = var108,
				triggerFeedback = var133,
				availableMenuItems = var134,
				onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then var122 else p31.onSelectionGained,
				onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then var123 else p31.onSelectionLost,
				videoPlaybackDetector = createElement
			}))
		end
	end
end

return if fFlagSignalsNavP3fGameDetails then reactModule.memo(var55) else var55