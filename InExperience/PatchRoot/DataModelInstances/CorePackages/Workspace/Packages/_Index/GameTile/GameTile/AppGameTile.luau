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
local fFlagLuaAppNotInterestedReportPlaceId = require(parent.SharedFlags).FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppEnableReportExperience = require(parent.SharedFlags).FFlagLuaAppEnableReportExperience
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local luaAppKeepTileBadgesDuringVideo = game:DefineFastFlag("LuaAppKeepTileBadgesDuringVideo", false)
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppContinueSortInstantPlay = require(parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppGameTileExtractGameDetailsCallback = require(parent.SharedFlags).FFlagLuaAppGameTileExtractGameDetailsCallback
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local instantPlayLauncherModule = require(gameTile.InstantPlayLauncher)
local instantPlayButtonModule = require(gameTile.InstantPlayButton)
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

local var3 = if fFlagLuaAppContinueSortInstantPlay then {
	Treatment1 = "SDUI.InstantPlay.Treatment1",
	Treatment2 = "SDUI.InstantPlay.Treatment2",
	Treatment3 = "SDUI.InstantPlay.Treatment3"
} else nil
local var4 = if fFlagLuaAppContinueSortInstantPlay then {
	[var3.Treatment1] = true,
	[var3.Treatment2] = true,
	[var3.Treatment3] = true
} else nil
local var5 = if fFlagLuaAppContinueSortInstantPlay then table.freeze({
	isActive = false,
	isTreatment1 = false,
	isTreatment2 = false,
	isTreatment3 = false
}) else nil
local var6 = if fFlagLuaAppContinueSortInstantPlay then function(p1, p2)
	-- upvalues: var4 (ref), var5 (ref), var3 (ref)
	return if p1 == true and (p2 ~= nil and var4[p2] == true) then {
		isActive = true,
		isTreatment1 = p2 == var3.Treatment1,
		isTreatment2 = p2 == var3.Treatment2,
		isTreatment3 = p2 == var3.Treatment3
	} else var5
end else nil
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
	sponsoredUserCohort = tModule.optional(tModule.string),
	enableSponsoredFeedback = tModule.optional(tModule.boolean),
	availableMenuItems = tModule.optional(tModule.table),
	enableReportAd = tModule.optional(tModule.boolean),
	enableReportExperience = if fFlagLuaAppEnableReportExperience then tModule.optional(tModule.boolean) else nil,
	compactMetadataFormat = tModule.optional(tModule.boolean),
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
	enableInstantPlay = if fFlagLuaAppContinueSortInstantPlay then tModule.optional(tModule.boolean) else nil,
	instantPlayTreatment = if fFlagLuaAppContinueSortInstantPlay then tModule.optional(tModule.string) else nil,
	isTouchPreferredInput = if fFlagLuaAppContinueSortInstantPlay then tModule.optional(tModule.boolean) else nil
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
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), none (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), discoveryAnalyticsModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppUnifyPlayButtonTile (ref), var6 (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), toLegacyGameInfoModel (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
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
	function p2.onMenuOpenChanged(p2, p3)
		-- upvalues: p1 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			universeId = p1.props.universeId,
			sortId = p1.props.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p3
		}, p1.props.appPage or "Unknown")
	end
	
	function p2.onTouchLongPress()
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
	
	function p2.renderAppExperienceActionRow(_)
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
		-- upvalues: var6 (copy), p1 (ref)
		if var6(p1.props.enableInstantPlay, p1.props.instantPlayTreatment).isActive then
			p1:setState({ instantPlayRequested = true })
		end
	end else nil
	p1.onInstantPlayAttemptCompleted = if fFlagLuaAppContinueSortInstantPlay then function()
		-- upvalues: p1 (ref)
		p1:setState({ instantPlayRequested = false })
	end else nil
	
	function p2.onHoverChanged(p2)
		-- upvalues: p1 (ref)
		if p2 and p1.props.triggerFeedback then
			p1.props.triggerFeedback("Default", "Hover")
		end
		p1:setState({ isHovered = p2 })
	end
	
	p1.gameTileRef = roactModule.createRef()
	
	function p2.getTilePosition()
		-- upvalues: p1 (ref)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p2.getTileSize()
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
	
	function p2.onFriendFooterActivated()
		-- upvalues: p1 (ref), fFlagMigrateGameInfoToStore (copy), toLegacyGameInfoModel (copy)
		if p1.isMounted then
			local var7
			local _ = nil
			
			if fFlagMigrateGameInfoToStore then
				local gameInfo = p1.state.gameInfo
				var7 = p1.props.game or (if gameInfo then toLegacyGameInfoModel(gameInfo) else nil)
			else
				var7 = p1.props.game
			end
			p1.props.openContextualMenu(var7, p1.getTileSize(), p1.getTilePosition())
		end
	end
	
	function p2.onActivateSponsoredTooltip()
		-- upvalues: p1 (ref), responsiveModule (copy)
		if p1.isMounted then
			p1.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p2.loadWideThumbnail()
		-- upvalues: p1 (ref), contentProviderService (copy)
		local wideThumbnail = p1.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function()
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p2.getVisitedFriends()
		-- upvalues: p1 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p1.props.friendVisits
		
		for i = 1, #friendVisits do
			local var7 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var7)
			elseif p1.props.users and p1.props.users[var7] then
				table.insert(t, {
					userId = var7,
					displayName = p1.props.users[var7].displayName
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
			local var8 = p2[v]
			
			if var8 and var8.isFriend then
				table.insert(t, { userId = var8.id, displayName = var8.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p2.onSelectionGained()
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p1 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = true })
		end
		if p1.props.onSelectionGained or fFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionGained(p1.props.entry, p1.props.index, p1.props.navigationUniverseId)
		end
	end
	
	function p2.LuaAppGameTileHoverDelayMs()
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

local var8 = if fFlagLuaAppGenreRatingFooter then function(p2)
	if p2 == nil then
		return nil
	elseif p2.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p2.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p2)
	-- upvalues: fFlagLuaAppContinueSortInstantPlay (ref), var6 (ref), reactModule (ref), instantPlayButtonModule (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var8 (write), fFlagMigrateGameInfoToStore (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var9 = if fFlagLuaAppContinueSortInstantPlay then var6(p2.props.enableInstantPlay, p2.props.instantPlayTreatment) else nil
	
	if fFlagLuaAppContinueSortInstantPlay and (var9.isTreatment2 or var9.isTreatment3) then
		return reactModule.createElement(instantPlayButtonModule, {
			onActivated = p2.onInstantPlayActivated,
			showIcon = var9.isTreatment2,
			showText = var9.isTreatment3
		})
	end
	local var10 = p2.props.useHoverTile or p2.props.useExperienceTileMetadata
	local friendFooterEnabled = p2.props.friendFooterEnabled
	local hasInGameFriends = p2.props.hasInGameFriends
	local var11 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p2.props.inGameUserIds else nil
	local var12 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p2.getSortedFriends(p2.props.users, p2.props.inGameUsersByGame)
	local var13 = friendFooterEnabled
	
	if var13 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var13 = var11
			
			if var13 then
				var13 = #var11 > 0
				var13 = nil
			end
		else
			var13 = hasInGameFriends
		end
	end
	local var14
	local var15 = p2.props.friendVisits and #p2.props.friendVisits > 0
	local _ = nil
	local footerLayoutData = p2.props.footerLayoutData
	
	if footerLayoutData == nil then
		var14 = nil
	elseif footerLayoutData.type == "TextLabel" then
		local text = footerLayoutData.text
		var14 = if text == nil then nil else text.textLiteral
	else
		var14 = nil
	end
	local gameInfo
	local var16 = if fFlagLuaAppGenreRatingFooter then var8(p2.props.footerLayoutData) else nil
	local var17 = false
	local var18 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var18 = p2.props.ageRatingText
	elseif not p2.props.hidePlayButton and not p2.props.forceHideAgeRatings then
		gameInfo = p2.state.gameInfo
		local var19 = if gameInfo then gameInfo.gameAgeDisplayName else ""
		var18 = if (if gameInfo then gameInfo.gameMinimumAge else 0) == 0 or var19 == "" then nil else var19
	end
	if (p2.props.isHovered or (if fFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected)) and (var18 and not p2.props.hidePlayButton) then
		var14 = var18
		var17 = true
	end
	gameInfo = var14 ~= nil
	local var20 = if fFlagLuaAppGenreRatingFooter then var16 ~= nil else nil
	local entry = p2.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p2.props.isSponsoredFooterAllowed or p2.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p2.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p2.props.useExperienceTileMetadata and (isShowSponsoredLabel or gameInfo or fFlagLuaAppGenreRatingFooter and var20) or p2.props.compactMetadataFormat then
		var10 = false
	end
	local var21, var22
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local storeVotes = p2.state.storeVotes
		var21 = if storeVotes then storeVotes.upVotes else 0
		var22 = if storeVotes then storeVotes.downVotes else 0
	else
		var21 = p2.props.totalUpVotes
		var22 = p2.props.totalDownVotes
	end
	local var23 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = var21,
			totalDownVotes = var22,
			playerCount = if p2.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p2.props.entry.playerCount else nil
		},
		isGridTile = p2.props.useGridTile,
		hideGameStats = p2.props.hideGameStats,
		useLargerFont = var10,
		gameTileLayoutType = p2.props.gameTileLayoutType,
		compactMetadataFormat = p2.props.compactMetadataFormat,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p2.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p2.props.hidePlayerCount else nil
	})
	
	if p2.props.hideMetadata then
		return if p2.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var10,
			onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
			gameTileLayoutType = p2.props.gameTileLayoutType,
			isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var23
		}) elseif var17 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var14,
			useLargerFont = var10
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var10,
			onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
			gameTileLayoutType = p2.props.gameTileLayoutType,
			isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var23
		}) elseif fFlagLuaAppGenreRatingFooter and var20 and not var17 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var10,
			totalUpVotes = var21,
			totalDownVotes = var22,
			genreText = var16
		}) elseif gameInfo then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = var14,
			useLargerFont = var10
		}) elseif var13 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var10,
			friendUserIds = var11,
			onFriendFooterActivated = p2.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var12,
			useLargerFont = var10
		}) elseif p2.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p2.props.friendVisitedString,
			iconSize = if var10 then 32 else 24,
			useLargerFont = var10
		}) elseif var15 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p2.getVisitedFriends(),
			useLargerFont = var10
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p2.getVisitedFriends(),
			useLargerFont = var10
		}) else var23
	end
end

function appGameTile.renderContent(p2, p3, p4, p5)
	-- upvalues: fFlagLuaAppContinueSortInstantPlay (ref), var6 (ref), gameTileConstantsModule (ref), gameTileViewConfigModule (ref), fFlagMigrateGameInfoToStore (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), gameTileVideoThumbnailModule (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameTileExtractGameDetailsCallback (ref), fFlagLuaAppGameDetailsAttributionFix (ref), luaAppKeepTileBadgesDuringVideo (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), foundationModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActionsModule (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppEnableReportExperience (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), instantPlayLauncherModule (ref), discoveryAnalyticsModule (ref)
	local createElement
	local size = p2.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p2.props.imageThumbnail
	local onGameTileActivated = p2.props.onGameTileActivated
	local var9 = if fFlagLuaAppContinueSortInstantPlay then var6(p2.props.enableInstantPlay, p2.props.instantPlayTreatment) else nil
	local var10 = if p2.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p2.props.isHovered and p2.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p2.props.gameTileLayoutType)
	local var11 = p2:renderGridTilesFooter()
	local var12 = if p2.props.hideTitle then nil elseif fFlagMigrateGameInfoToStore then p2.props.name or (if p2.state.gameInfo then p2.state.gameInfo.name else "") else p2.props.name
	local var13 = if var10 then reactModule.createElement(gameStatsModule, {
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
			onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppContinueSortInstantPlay and var9.isTreatment1 then p2.onInstantPlayActivated elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameTileExtractGameDetailsCallback then p2.onGameDetailsActivated elseif fFlagLuaAppGameDetailsAttributionFix then function()
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
	local var14 = if luaAppKeepTileBadgesDuringVideo or not p2.props.isVideoPlaying then if p2.props.tileBadges then roactModule.createFragment({
		SocialFeaturePill = var13,
		Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p2.props.tileBadges })
	}) else var13 else nil
	
	if fFlagLuaAppContinueSortInstantPlay and var9.isTreatment1 and not p2.props.isHidden then
		local var15 = reactModule.createElement(foundationModule.View, {
			tag = "align-x-center align-y-center anchor-bottom-left size-600-600 radius-medium",
			backgroundStyle = p5.Color.Extended.Black.Black_70,
			Position = UDim2.new(0, p5.Padding.XSmall, 1, -p5.Padding.XSmall)
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.PlaySmall,
				size = foundationModule.Enums.IconSize.Small,
				style = p5.Color.Extended.White.White_100
			})
		})
		var14 = if var14 then roactModule.createFragment({ Existing = var14, PlayOverlay = var15 }) else var15
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
			placeId = if fFlagLuaAppNotInterestedReportPlaceId or fFlagLuaAppEnableReportExperience then p2.props.entry.placeId else nil,
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
			adId = p2.props.entry.adId,
			availableMenuItems = p2.props.availableMenuItems,
			onGameDetailsActivated = if fFlagLuaAppContinueSortInstantPlay and var9.isActive then p2.onGameDetailsActivated else nil
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
			thumbnailComponent = createElement,
			title = if isHidden then nil else var12,
			isDisabled = if isHidden then true else p2.props.isDisabled,
			onActivated = if fFlagLuaAppContinueSortInstantPlay and var9.isTreatment1 and not isHidden then p2.onInstantPlayActivated elseif fFlagLuaAppGameTileExtractGameDetailsCallback then if not isHidden then p2.onGameDetailsActivated else p2.onActivated elseif fFlagLuaAppGameDetailsAttributionFix and not isHidden then function()
				-- upvalues: onGameTileActivated (ref), p2 (ref)
				onGameTileActivated(p2.isMounted)
			end else p2.onActivated,
			onGuiStateChanged = p2.props.onGuiStateChanged,
			onSelectionGained = p2.onSelectionGained,
			onSelectionLost = p2.onSelectionLost,
			onTouchLongPress = if not isHidden then p2.onTouchLongPress else nil,
			onMetadataActivated = if fFlagLuaAppContinueSortInstantPlay and var9.isTreatment1 and not isHidden then p2.onGameDetailsActivated else nil,
			reducedMotion = p3,
			isHovered = if isHidden then false else p2.props.isHovered,
			forwardRef = p2.props.hoverRef,
			hidePlayButton = if isHidden then true else p2.props.hidePlayButton,
			hoverActionRow = if p2.props.hidePlayButton or isHidden or fFlagLuaAppContinueSortInstantPlay and var9.isActive then nil else reactModule.createElement(appExperienceActionRowModule, {
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
			thumbnailOverlay = if isHidden then nil else var14,
			overflowMenu = createElement_1,
			footerMetadata = if isHidden then nil else var11,
			textSizeOffset = p2.props.textSizeOffset,
			hideMetadata = p2.props.hideMetadata,
			isTouchPreferredInput = if fFlagLuaAppContinueSortInstantPlay then p2.props.isTouchPreferredInput else nil
		}),
		VideoPlaybackDetector = p2.props.videoPlaybackDetector,
		InstantPlayLauncher = if fFlagLuaAppContinueSortInstantPlay and var9.isActive and p2.state.instantPlayRequested then reactModule.createElement(instantPlayLauncherModule, {
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
	local var9 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var9 = if p3.entry.navigationUniverseId and p3.entry.navigationUniverseId ~= "" and p3.entry.navigationUniverseId ~= "0" then p3.entry.navigationUniverseId else p3.entry.universeId
	end
	local var10 = p2.Personalization[gameInfosReducer.key][universeId]
	local var11 = nil
	local var12 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var11 = if var10 then var10.totalUpVotes else 0
		var12 = if var10 then var10.totalDownVotes else 0
	end
	local var13 = if var10 then var10.friendActivityTitle else nil
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	
	if not fFlagMigrateGameInfoToStore then
		var16 = if var10 then var10.minimumAge else 0
		var17 = if var10 then var10.ageRecommendationDisplayName else ""
	end
	local var18
	local _ = nil
	
	if p3.gameTileLayoutType == "Event" then
		local _ = p3.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p3.gameTileLayoutType == "Wide" then
		var18 = p3.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var18 = nil
	else
		var18 = false
	end
	if not fFlagMigrateGameInfoToStore then
		if var18 or p3.forceHideAgeRatings then
			var14 = false
		elseif var16 == 0 or var17 == "" then
			var14 = false
		else
			var14 = true
			var15 = var17
		end
	end
	local var19, var20
	local var21 = getGameTileLayoutDataModule(var10, p3.topicId)
	local _ = nil
	local var22 = if fFlagMigrateGameIconsToStore then p3.gameIconUrl elseif p2[gameIconReducer.key][universeId] then p2[gameIconReducer.key][universeId].url else nil
	local _ = nil
	
	if fFlagLuaAppHomeThumbnailPrefetch then
		local function _(p4)
			-- upvalues: var2 (copy), var22 (write), universeId (ref), p3 (ref), var10 (ref)
			return var2({
				iconUrl = var22,
				universeId = universeId,
				placeId = p3.entry.placeId,
				useGridTile = p4,
				perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
				game = var10,
				topicId = p3.topicId
			})
		end
		
		var19 = var2({
			iconUrl = var22,
			universeId = universeId,
			placeId = p3.entry.placeId,
			useGridTile = p3.useGridTile == true,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = var10,
			topicId = p3.topicId
		})
		var20 = if p3.useGridTile then var19 else var2({
			useGridTile = true,
			iconUrl = var22,
			universeId = universeId,
			placeId = p3.entry.placeId,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = var10,
			topicId = p3.topicId
		})
	else
		var20 = formatExperienceThumbnailModule((if p3.entry.primaryWideImageAssetId then p3.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var21)) or (if var10 then var10.primaryWideAssetId else nil), p3.entry.placeId)
		var19 = if p3.useGridTile then var20 else formatExperienceIconModule(var22, universeId)
	end
	local var23 = if p3.entry.primaryWideVideoAssetId then p3.entry.primaryWideVideoAssetId else var21 and (var21.primaryMediaAsset and var21.primaryMediaAsset.wideVideoAssetId)
	local var24 = if var23 then `rbxassetid://{var23}` else nil
	local var25 = nil
	
	if not fFlagMigrateGameInfoToStore then
		if not p3.useHoverTile and not p3.useExperienceTileMetadata then
			var25 = nil
		elseif luaAppUseRatingFormatHelper2 then
			var25 = formatExperienceRatingModule(var11, var12, nil, true)
		else
			local var26 = var11
			local var27 = var12
			var25 = if var26 + var27 == 0 then "--" else tostring(math.floor(var26 / (var26 + var27) * 100 + 0.5)) .. "%"
		end
	end
	local _ = nil
	
	return {
		game = var10,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var9 else nil,
		name = if fFlagMigrateGameInfoToStore then var21 and var21.title elseif var21 then var21.title elseif var10 then var10.name else "",
		totalUpVotes = var11,
		totalDownVotes = var12,
		imageThumbnail = var19,
		wideThumbnail = var20,
		videoThumbnail = var24,
		friendActivityTitle = var13,
		rating = var25,
		showAgeRating = var14,
		ageRatingText = var15,
		friendVisits = if var10 then var10.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var10 and var10.friendVisitedString ~= "" then var10.friendVisitedString else nil,
		hidePlayButton = var18,
		footerLayoutData = if var21 then var21.footer else nil
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
local var9 = function(p2)
	-- upvalues: reactModule (ref), useTokens (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), fFlagGameTileMigrateOffLegacyPresence (ref), var1 (ref), cryoModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), fFlagLuaAppContinueSortInstantPlay (ref), var6 (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableReportExperience (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), appGameTile (write)
	local var10 = reactModule.useRef(nil)
	local var11 = useTokens()
	local useHoverTile = p2.useHoverTile
	local var12 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useGameIcon(p2.entry.universeId) else nil
	local var13 = `{p2.impressionsTag or ""}_{p2.index or "0"}_{p2.gameTileLayoutType or "Narrow"}`
	
	if p2.impressionsTag == nil or p2.index == nil then
		useHoverTile = false
	end
	local var14
	local var15 = useIsHoveredTileModule(var10, var13, useHoverTile)
	local var16 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var17 = if var16 then true else p2.useHoverTile
	local var18 = if p2.useExperienceTileMetadata ~= nil then var16 else p2.useExperienceTileMetadata
	local var19 = useValidTileBadgesModule(p2.entry.universeId, p2.topicId, p2.badgeOverride)
	local var20 = useSelector(function(p3)
		return p3.LocalUserId
	end)
	local var21 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p3)
		return p3.Users
	end) else nil
	local var22 = useSelector(function(p3)
		-- upvalues: p2 (ref)
		return p3.InGameUsersByGame[p2.entry.universeId]
	end)
	local var23 = useHasInGameFriendsModule(var20, var21, var22)
	local var24 = if fFlagGameTileMigrateOffLegacyPresence then var1(p2.entry.universeId) else nil
	local var25 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then if fFlagGameTileMigrateOffLegacyPresence then if fFlagGameTileMigrateOffLegacyPresence then reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var24 (ref)
		return cryoModule.List.map(var24 or {}, function(p3)
			return p3.id
		end)
	end, { var24 }) else nil else useInGameUserIdsModule(var20, var22) else nil
	local var26, var27 = reactModule.useState(false)
	local var28 = nil
	local _ = nil
	local var29 = nil
	local var30 = nil
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		local var31, var32 = reactModule.useState(false)
		var28 = var31
		local var33 = var32
		var29 = reactModule.useCallback(function(p3, p4, p5)
			-- upvalues: var33 (write), p2 (ref)
			var33(true)
			
			if p2.onSelectionGained then
				p2.onSelectionGained(p3, p4, p5)
			end
		end, { p2.onSelectionGained })
		var30 = reactModule.useCallback(function()
			-- upvalues: var33 (write), p2 (ref)
			var33(false)
			
			if p2.onSelectionLost then
				p2.onSelectionLost()
			end
		end, { p2.onSelectionLost })
	end
	if not fFlagLuaAppSearchResultsPageGameTileVideo then
		var14 = fFlagLuaAppGateVideoPlaybackOnNavigationFocus
		
		if var14 then
			var14 = p2.videoPlaybackContext ~= nil and p2.videoPlaybackContext.disablePlayback == true
		end
		if fFlagLuaAppFixHiddenTileVideoCleanup or fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
			reactModule.useEffect(function()
				-- upvalues: fFlagLuaAppFixHiddenTileVideoCleanup (copy), p2 (ref), fFlagLuaAppSearchResultsPageGameTileVideo (copy), fFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), var14 (ref), var27 (ref)
				if fFlagLuaAppFixHiddenTileVideoCleanup and p2.isHidden or (fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus) and var14 then
					var27(false)
				end
			end, {
				p2.isHidden,
				if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then var14 else nil
			})
		end
		local var34 = nil
		local var35 = nil
		local var36 = nil
		local var37 = nil
		
		if fFlagLuaAppGameDetailsAttributionFix then
			var34 = useRoactService(roactNetworking)
			var35 = if p2.entry.navigationUniverseId and p2.entry.navigationUniverseId ~= "" and p2.entry.navigationUniverseId ~= "0" then p2.entry.navigationUniverseId else p2.entry.universeId
			var37 = reactModule.useCallback(function()
				-- upvalues: p2 (ref), sponsoredGamesRecordClick (copy), var34 (write)
				local entry = p2.entry
				
				if entry.isSponsored then
					sponsoredGamesRecordClick(var34, entry.adId)
				end
			end, { var34, p2.entry.isSponsored, p2.entry.adId })
			var36 = reactModule.useCallback(function(p3)
				-- upvalues: p2 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), var35 (write), videoPlaybackCoordinator (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var37 (write)
				if p2.isHovered then
					hoverTileCoordinatorModule.default:reset()
				end
				if p2.videoPlaybackContext and p2.videoPlaybackContext.videoPlaybackCoordinator then
					p2.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var35, nil)
				else
					videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var35, nil)
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
					p2.navigateToGameDetails(var35, t)
					p2.reportGameDetailOpened(p2.index, var35)
					var37()
				end
			end, {
				p2.isHovered, p2.index, p2.videoAnalytics, p2.onActivated, p2.source,
				p2.referralSource, p2.onPeekViewClosed, p2.navigateToGameDetails,
				p2.reportGameDetailOpened, var35, var37, p2.entry.placeIdOverride,
				p2.entry.launchDataOverride,
				if p2.videoPlaybackContext then p2.videoPlaybackContext.videoPlaybackCoordinator else nil
			})
		end
		local createElement
		local var38 = useOverflowMenuOpen(var13)
		local var39 = useTriggerFeedback()
		local var40 = if fFlagLuaAppContinueSortInstantPlay then var6(p2.enableInstantPlay, p2.instantPlayTreatment) else nil
		local var41 = reactModule.useMemo(function()
			-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p2 (ref), fFlagLuaAppContinueSortInstantPlay (copy), var40 (ref), fFlagLuaAppEnableReportExperience (copy)
			return getAvailableGameTileOverflowMenuItemsModule({
				isSponsored = p2.entry.isSponsored,
				enableExplicitFeedback = p2.enableExplicitFeedback,
				enableSponsoredFeedback = p2.enableSponsoredFeedback,
				enableReportAd = p2.enableReportAd,
				enableGameDetails = if fFlagLuaAppContinueSortInstantPlay then var40.isTreatment1 else nil,
				enableReportExperience = if fFlagLuaAppEnableReportExperience then p2.enableReportExperience else nil
			})
		end, {
			p2.entry.isSponsored, p2.enableExplicitFeedback, p2.enableSponsoredFeedback,
			p2.enableReportAd,
			if fFlagLuaAppContinueSortInstantPlay then var40.isTreatment1 else nil,
			if fFlagLuaAppEnableReportExperience then p2.enableReportExperience else nil
		})
		local var42 = if p2.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p2.entry.universeId, p2.topicId) else true
		useTagAsViewportAutoplayCandidate(var10, p2.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var42 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p2.isHidden else nil, nil, nil, nil, if fFlagLuaAppOneByTwoHoverIdleAutoplay and var42 then {
			isUserIntentModeAutoplayCandidate = false,
			videoKey = var13
		} else nil)
		local var43 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
		
		if var42 and not p2.isHidden then
			local var44 = if fFlagLuaAppSearchResultsPageGameTileVideo or fFlagLuaAppGateVideoPlaybackOnNavigationFocus then not var14 else true
			
			if var44 then
				local var45
				createElement = reactModule.createElement
				var44 = gameVideoPlaybackDetectorModule
				local t = {
					videoKey = var13,
					itemIndex = p2.index,
					universeId = p2.entry.universeId,
					tileRef = var10,
					isHoverSupported = useHoverTile,
					isHovered = var15,
					isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var28 else nil
				}
				
				if fFlagLuaAppGameTileSelectionVideoPlayback then
					var45 = nil
				elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
					var45 = var43 == responsiveModule.Input.Touch
					var45 = nil
				else
					var45 = nil
				end
				t.autoplay = var45
				t.onPlaybackChange = var27
				t.videoAnalytics = p2.videoAnalytics
				t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
				t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
				t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p2.hasPrevalidatedVideoGamePlayability else nil
				t.pageContext = p2.appPage
				t.videoPlaybackContext = p2.videoPlaybackContext
				createElement = createElement(var44, t)
			else
				createElement = nil
			end
			return reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p2, {
				useExperienceTileMetadata = var18,
				hasBackground = var17,
				gameIconUrl = if fFlagMigrateGameIconsToStore then var12 else nil,
				hoverRef = var10,
				isHoverSupported = useHoverTile,
				isHovered = var15,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var28 else nil,
				isVideoPlaying = var26,
				tileBadges = var19,
				foundationTokens = var11,
				users = var21,
				inGameUsersByGame = var22,
				hasInGameFriends = var23,
				inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var25 else nil,
				networking = if fFlagLuaAppGameDetailsAttributionFix then var34 else nil,
				navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var35 else nil,
				onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var36 else nil,
				recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var37 else nil,
				overflowMenuOpen = var38,
				hoverKey = var13,
				triggerFeedback = var39,
				availableMenuItems = var41,
				onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then var29 else p2.onSelectionGained,
				onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then var30 else p2.onSelectionLost,
				videoPlaybackDetector = createElement
			}))
		end
	end
end

return if fFlagSignalsNavP3fGameDetails then reactModule.memo(var9) else var9