local ContentProvider = game:GetService("ContentProvider")
local GameTile = script:FindFirstAncestor("GameTile")
local GridTileIconTextFooterModule = require(GameTile.Footer.GridTileIconTextFooter)
local GridTileFriendFooter = require(GameTile.Footer.GridTileFriendFooter).GridTileFriendFooter
local GridTileTextFooterModule = require(GameTile.Footer.GridTileTextFooter)
local GameStatsModule = require(GameTile.Footer.GameStats)
local GridTileSponsoredFooterModule = require(GameTile.Footer.GridTileSponsoredFooter)
local RatingWithGenreFooterModule = require(GameTile.Footer.RatingWithGenreFooter)
local GameTileThumbnailBadgesModule = require(GameTile.Overlays.GameTileThumbnailBadges)
local SortFriendsByPresenceAndRecencyFactoryModule = require(GameTile.sortFriendsByPresenceAndRecencyFactory)
local OpenCentralOverlayForPlacesListModule = require(GameTile.OpenCentralOverlayForPlacesList)
local GameTileViewModule = require(GameTile.GameTileView)
local AppExperienceActionRowModule = require(GameTile.AppExperienceActionRow)
local GameTileConstantsModule = require(GameTile.GameTileConstants)
local OpenSponsoredTooltipModule = require(GameTile.OpenSponsoredTooltip)
local GameTileTypesModule = require(GameTile.GameTileTypes)
local UseIsHoveredTileModule = require(GameTile.useIsHoveredTile)
local HoverTileCoordinatorModule = require(GameTile.HoverTileCoordinator)
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local GameTileViewConfigModule = require(GameTile.GameTileViewConfig)
local UseHasInGameFriendsModule = require(GameTile.useHasInGameFriends)
local UseInGameUserIdsModule = require(GameTile.useInGameUserIds)
local UseValidTileBadgesModule = require(GameTile.Overlays.useValidTileBadges)
local GameTileVideoThumbnailModule = require(GameTile.GameTileVideoThumbnail)
local VideoEndReasonModule = require(GameTile.Video.Analytics.VideoEndReason)
local GameVideoPlaybackDetectorModule = require(GameTile.Video.GameVideoPlaybackDetector)
local UseHasVideoThumbnailSelectorModule = require(GameTile.Video.useHasVideoThumbnailSelector)
local GetLayoutDataVideoModule = require(GameTile.getLayoutDataVideo)
local FormatExperienceIconModule = require(GameTile.formatExperienceIcon)
local FormatExperienceRatingModule = require(GameTile.formatExperienceRating)
local FormatExperienceThumbnailModule = require(GameTile.formatExperienceThumbnail)
local HiddenTileContentModule = require(GameTile.HiddenGameTile.HiddenTileContent)
local ItemLayoutDataParsingUtilsModule = require(GameTile.ItemLayoutDataParsingUtils)
local Parent = GameTile.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local AppBloxModule = require(Parent.AppBlox)
local ReactModule = require(Parent.React)
local None = ReactModule.None
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppGameTileNotInterestedDirectAction = SharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local AspectRatioModeEnum = UIBloxModule.App.Tile.AspectRatioModeEnum
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UiMode = require(Parent.RobloxAppEnums).UiMode
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local ToLegacyGameInfoModelFunction = require(Parent.GameInfosRodux).toLegacyGameInfoModel
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Parent.DataHydration)
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseOverflowMenuOpenFunction = AppBloxModule.useOverflowMenuOpen
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GameTileOverflowMenuActionFunction = DiscoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local SponsoredGamesRecordClickFunction = DiscoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseTagAsViewportAutoplayCandidateFunction = require(Parent.VideoUtils).useTagAsViewportAutoplayCandidate
local DiscoveryAppLaunchTracker = require(Parent.AppLaunchTracker).DiscoveryAppLaunchTracker
local GetFFlagEnableNavigationPerformanceIntervalsFunction = require(Parent.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals
local FFlagLuaAppMigrateGameTileHoverFixes = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local FFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local FFlagLuaAppUnifyPlayButtonTile = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppGameDetailsAttributionFix = require(Parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local LuaAppUseRatingFormatHelper2 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local FFlagGameTileMigrateOffLegacyPresence = require(Parent.SharedFlags).FFlagGameTileMigrateOffLegacyPresence
local UseGetOnlineFriendsByUniverseId = if FFlagGameTileMigrateOffLegacyPresence then require(Parent.FriendsHydrationReact).useGetOnlineFriendsByUniverseId else nil
local FFlagLuaAppEnableReportExperience = require(Parent.SharedFlags).FFlagLuaAppEnableReportExperience
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FIntLuaAppGameTileVideoDwellTimeInSec = require(Parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local LuaAppKeepTileBadgesDuringVideo = game:DefineFastFlag("LuaAppKeepTileBadgesDuringVideo", false)
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppFixHiddenTileVideoCleanup = require(Parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppContinueSortInstantPlay = require(Parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppGameTileExtractGameDetailsCallback = require(Parent.SharedFlags).FFlagLuaAppGameTileExtractGameDetailsCallback
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local InstantPlayLauncherModule = require(GameTile.InstantPlayLauncher)
local InstantPlayButtonModule = require(GameTile.InstantPlayButton)
local FFlagLuaAppGenreRatingFooter = require(Parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(Parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local FFlagLuaAppSearchResultsPageGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local FFlagLuaAppHomeThumbnailPrefetch = require(Parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local ResolveGameTileThumbnailUriModule = if FFlagLuaAppHomeThumbnailPrefetch then require(GameTile.resolveGameTileThumbnailUri) else nil
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local GameTileContextualActionsModule = require(GameTile.GameTileContextualActions)
local GameTileOverflowMenuModule = require(GameTile.GameTileOverflowMenu)
local GetAvailableGameTileOverflowMenuItemsModule = require(GameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _() --[[ Line: 150 | Named "getHoverDelay" ]]
	return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000
end

local Config = if FFlagLuaAppContinueSortInstantPlay then {
	Treatment1 = "SDUI.InstantPlay.Treatment1",
	Treatment2 = "SDUI.InstantPlay.Treatment2",
	Treatment3 = "SDUI.InstantPlay.Treatment3"
} else nil
local Config1 = if FFlagLuaAppContinueSortInstantPlay then {
	[Config.Treatment1] = true,
	[Config.Treatment2] = true,
	[Config.Treatment3] = true
} else nil
local Frozen = if FFlagLuaAppContinueSortInstantPlay then table.freeze({
	isActive = false,
	isTreatment1 = false,
	isTreatment2 = false,
	isTreatment3 = false
}) else nil
local Callback1 = if FFlagLuaAppContinueSortInstantPlay then function(Enabled, Treatment) --[[ Line: 181 ]]
	-- upvalues: Config1 (copy), Frozen (copy), Config (copy)
	local IsEntry: boolean = Enabled == true and (Treatment ~= nil and Config1[Treatment] == true)
	
	return if IsEntry then {
		isActive = true,
		isTreatment1 = Treatment == Config.Treatment1,
		isTreatment2 = Treatment == Config.Treatment2,
		isTreatment3 = Treatment == Config.Treatment3
	} else Frozen
end else nil
local AppGameTile = RoactModule.PureComponent:extend("AppGameTile")
AppGameTile.validateProps = TModule.strictInterface({
	entry = TModule.table,
	reportGameDetailOpened = TModule.callback,
	reportExperienceLaunched = TModule.optional(TModule.callback),
	Size = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	ZIndex = TModule.optional(TModule.number),
	useHoverTile = TModule.optional(TModule.boolean),
	hasBackground = TModule.boolean,
	useGridTile = TModule.boolean,
	playerCountStyle = TModule.optional(TModule.string),
	isSponsoredFooterAllowed = TModule.optional(TModule.boolean),
	isSponsoredRatingFooterAllowed = TModule.optional(TModule.boolean),
	useExperienceTileMetadata = TModule.boolean,
	hideGameStats = TModule.optional(TModule.boolean),
	gameTileLayoutType = TModule.optional(TModule.string),
	topicId = TModule.optional(TModule.string),
	playButtonStyle = TModule.optional(TModule.string),
	onGuiStateChanged = TModule.optional(TModule.callback),
	isDisabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	onSelectionGained = if FFlagLuaAppGameTileSelectionVideoPlayback then TModule.callback else TModule.optional(TModule.callback),
	onSelectionLost = if FFlagLuaAppGameTileSelectionVideoPlayback then TModule.callback else TModule.optional(TModule.callback),
	friendFooterEnabled = TModule.optional(TModule.boolean),
	index = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number),
	source = TModule.optional(TModule.string),
	referralSource = TModule.optional(TModule.string),
	onPeekViewClosed = TModule.optional(TModule.callback),
	rowNum = TModule.optional(TModule.number),
	showFriendActivity = TModule.boolean,
	contentTextLineCount = TModule.optional(TModule.number),
	metadataTextLineCount = TModule.optional(TModule.number),
	thumbnailAspectRatioOverride = TModule.optional(TModule.string),
	impressionsTag = TModule.optional(TModule.string),
	launchExperienceEventContext = TModule.optional(TModule.string),
	navigateToGameDetails = TModule.callback,
	isContained = TModule.optional(TModule.boolean),
	hideTitle = TModule.optional(TModule.boolean),
	hideMetadata = TModule.optional(TModule.boolean),
	textSizeOffset = TModule.optional(TModule.number),
	foundationTokens = TModule.optional(TModule.table),
	videoAnalytics = TModule.optional(TModule.table),
	hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then TModule.optional(TModule.boolean) else nil,
	videoPlaybackContext = TModule.optional(TModule.table),
	SelectionOrder = TModule.optional(TModule.number),
	enableExplicitFeedback = TModule.optional(TModule.boolean),
	setGameHidden = TModule.optional(TModule.callback),
	appPage = TModule.optional(TModule.string),
	isHidden = TModule.optional(TModule.boolean),
	isNarrowScreenXSmall = TModule.optional(TModule.boolean),
	sponsoredUserCohort = TModule.optional(TModule.string),
	enableSponsoredFeedback = TModule.optional(TModule.boolean),
	availableMenuItems = TModule.optional(TModule.table),
	enableReportAd = TModule.optional(TModule.boolean),
	enableReportExperience = if FFlagLuaAppEnableReportExperience then TModule.optional(TModule.boolean) else nil,
	compactMetadataFormat = TModule.optional(TModule.boolean),
	hideRating = if FFlagLuaAppNarrowTileHideRating then TModule.optional(TModule.boolean) else nil,
	hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then TModule.optional(TModule.boolean) else nil,
	game = TModule.optional(TModule.table),
	universeId = TModule.string,
	navigationUniverseId = TModule.optional(TModule.string),
	name = if FFlagMigrateGameInfoToStore then TModule.optional(TModule.string) else TModule.string,
	totalUpVotes = if FFlagMigrateGameInfoToStore then nil else TModule.number,
	totalDownVotes = if FFlagMigrateGameInfoToStore then nil else TModule.number,
	friendActivityTitle = TModule.optional(TModule.string),
	friendVisitedString = TModule.optional(TModule.string),
	imageThumbnail = TModule.string,
	wideThumbnail = TModule.optional(TModule.string),
	videoThumbnail = TModule.optional(TModule.string),
	videoAccessContext = if FFlagLuaAppHomeMomentVideoFallback then TModule.optional(TModule.string) else nil,
	rating = TModule.optional(TModule.string),
	showAgeRating = TModule.optional(TModule.boolean),
	ageRatingText = TModule.optional(TModule.string),
	friendVisits = TModule.table,
	hidePlayButton = TModule.boolean,
	footerLayoutData = TModule.optional(TModule.table),
	openContextualMenu = TModule.callback,
	openSponsoredTooltip = TModule.callback,
	networking = TModule.callback,
	hoverRef = TModule.table,
	isHoverSupported = TModule.optional(TModule.boolean),
	isHovered = TModule.optional(TModule.boolean),
	gameIconUrl = TModule.optional(TModule.string),
	isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then TModule.boolean else nil,
	isVideoPlaying = TModule.boolean,
	tileBadges = TModule.optional(TModule.table),
	users = TModule.optional(TModule.table),
	inGameUsersByGame = TModule.optional(TModule.table),
	hasInGameFriends = TModule.boolean,
	inGameUserIds = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then TModule.table else nil,
	badgeOverride = TModule.optional(TModule.table),
	forceHideAgeRatings = TModule.optional(TModule.boolean),
	onGameTileActivated = if FFlagLuaAppGameDetailsAttributionFix then TModule.optional(TModule.callback) else nil,
	recordSponsoredGameClick = if FFlagLuaAppGameDetailsAttributionFix then TModule.optional(TModule.callback) else nil,
	overflowMenuOpen = TModule.optional(TModule.boolean),
	hoverKey = TModule.optional(TModule.string),
	triggerFeedback = TModule.callback,
	videoPlaybackDetector = TModule.optional(TModule.table),
	enableInstantPlay = if FFlagLuaAppContinueSortInstantPlay then TModule.optional(TModule.boolean) else nil,
	instantPlayTreatment = if FFlagLuaAppContinueSortInstantPlay then TModule.optional(TModule.string) else nil,
	isTouchPreferredInput = if FFlagLuaAppContinueSortInstantPlay then TModule.optional(TModule.boolean) else nil
})
local Narrow = GameTileTypesModule.GameTileLayoutType.Narrow
AppGameTile.defaultProps = {
	useHoverTile = false,
	hasBackground = false,
	useExperienceTileMetadata = false,
	useGridTile = false,
	hideGameStats = false,
	thumbnailAspectRatioOverride = AspectRatioModeEnum.Square,
	gameTileLayoutType = Narrow,
	contentTextLineCount = GameTileConstantsModule.TileTextLines[Narrow].titleTextLines
}

function AppGameTile.init(p1) --[[ Line: 328 ]]
	-- upvalues: DiscoveryAppLaunchTracker (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppContinueSortInstantPlay (copy), FFlagMigrateGameInfoToStore (copy), GameHydrationReactModule (copy), None (copy), GameTileOverflowMenuActionFunction (copy), GetOverflowMenuSignalStoreFunction (copy), FFlagLuaAppGameDetailsAttributionFix (copy), HoverTileCoordinatorModule (copy), VideoEndReasonModule (copy), VideoPlaybackCoordinator (copy), DiscoveryAnalyticsModule (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), RoactModule (copy), AppExperienceActionRowModule (copy), FFlagLuaAppGameTileExtractGameDetailsCallback (copy), FFlagLuaAppUnifyPlayButtonTile (copy), Callback1 (copy), SponsoredGamesRecordClickFunction (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervalsFunction (copy), IntervalPerformanceTracker (copy), ToLegacyGameInfoModelFunction (copy), ResponsiveModule (copy), ContentProvider (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), MemoizeFunction (copy), SortFriendsByPresenceAndRecencyFactoryModule (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileInit()
	end
	p1.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else false,
		instantPlayRequested = not FFlagLuaAppContinueSortInstantPlay and nil
	}
	
	if FFlagMigrateGameInfoToStore then
		p1.gameInfoSubscription = GameHydrationReactModule.subscribeGameInfo({
			universeId = p1.props.entry.universeId,
			onChange = function(p2) --[[ Line: 346 ]]
				-- upvalues: p1 (copy), None (upval)
				p1:setState({
					gameInfo = p2.gameInfo or None,
					storeVotes = p2.votes or None
				})
			end
		})
	end
	function p1.onMenuOpenChanged(p2, AvailableMenuItems) --[[ Line: 355 ]]
		-- upvalues: p1 (copy), GameTileOverflowMenuActionFunction (upval)
		GameTileOverflowMenuActionFunction({
			universeId = p1.props.universeId,
			sortId = p1.props.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = AvailableMenuItems
		}, p1.props.appPage or "Unknown")
	end
	
	function p1.onTouchLongPress() --[[ Line: 366 ]]
		-- upvalues: p1 (copy), GetOverflowMenuSignalStoreFunction (upval)
		if next(p1.props.availableMenuItems) ~= nil then
			if p1.props.triggerFeedback and not p1.props.overflowMenuOpen then
				p1.props.triggerFeedback("TileLongPress", "Press", p1.props.appPage or "Unknown", {
					universeId = p1.props.universeId,
					sortId = p1.props.topicId
				})
			end
			GetOverflowMenuSignalStoreFunction().openMenu(p1.props.hoverKey)
			local List = {}
			
			for i, _ in p1.props.availableMenuItems do
				table.insert(List, i)
			end
			p1.onMenuOpenChanged(false, table.concat(List, ","))
		end
	end
	
	p1.reportExperienceLaunched = if FFlagLuaAppContinueSortInstantPlay then function(...) --[[ Line: 388 ]]
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (upval), p1 (copy), HoverTileCoordinatorModule (upval), VideoEndReasonModule (upval), VideoPlaybackCoordinator (upval)
		if FFlagLuaAppGameDetailsAttributionFix then
			p1.props.recordSponsoredGameClick()
		else
			p1.recordSponsoredGameClick()
		end
		if p1.props.isHovered then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.props.reportExperienceLaunched then
			p1.props.reportExperienceLaunched(...)
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
			
			return
		else
			VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
		end
	end else nil
	p1.reportExperienceLaunchedFromInstantPlay = if FFlagLuaAppContinueSortInstantPlay then function(p2) --[[ Line: 423 ]]
		-- upvalues: p1 (copy), DiscoveryAnalyticsModule (upval), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		p1.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, "ExperienceTile", DiscoveryAnalyticsModule.Constants.Context.InstantPlay, p1.props.index, if FFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
	end else nil
	p1.reportExperienceLaunchedFromActionBar = if FFlagLuaAppContinueSortInstantPlay then p1.reportExperienceLaunched else function(...) --[[ Line: 437 ]]
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (upval), p1 (copy), HoverTileCoordinatorModule (upval), VideoEndReasonModule (upval), VideoPlaybackCoordinator (upval)
		if FFlagLuaAppGameDetailsAttributionFix then
			p1.props.recordSponsoredGameClick()
		else
			p1.recordSponsoredGameClick()
		end
		if p1.props.isHovered then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.props.reportExperienceLaunched then
			p1.props.reportExperienceLaunched(...)
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
			
			return
		else
			VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
		end
	end
	
	function p1:renderAppExperienceActionRow() --[[ Line: 470 ]]
		-- upvalues: RoactModule (upval), AppExperienceActionRowModule (upval), p1 (copy), FFlagLuaAppGameTileExtractGameDetailsCallback (upval), FFlagLuaAppGameDetailsAttributionFix (upval), FFlagLuaAppUnifyPlayButtonTile (upval)
		return RoactModule.createElement(AppExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p1.props.navigationUniverseId,
			referralSource = p1.props.referralSource,
			reportExperienceLaunched = p1.reportExperienceLaunchedFromActionBar,
			openGameDetails = if FFlagLuaAppGameTileExtractGameDetailsCallback then p1.onGameDetailsActivated elseif FFlagLuaAppGameDetailsAttributionFix then function() --[[ Line: 478 ]]
				-- upvalues: p1 (upval)
				p1.props.onGameTileActivated(p1.isMounted)
			end else p1.onActivated,
			entry = p1.props.entry,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			horizontalPadding = if p1.props.useGridTile then 0 else nil,
			index = p1.props.index,
			isUnifiedGameTileEnabled = if FFlagLuaAppUnifyPlayButtonTile then true else nil,
			placeIdOverride = p1.props.entry.placeIdOverride,
			launchDataOverride = p1.props.entry.launchDataOverride
		})
	end
	
	p1.onInstantPlayActivated = if FFlagLuaAppContinueSortInstantPlay then function() --[[ Line: 493 ]]
		-- upvalues: Callback1 (upval), p1 (copy)
		if Callback1(p1.props.enableInstantPlay, p1.props.instantPlayTreatment).isActive then
			p1:setState({ instantPlayRequested = true })
		end
	end else nil
	p1.onInstantPlayAttemptCompleted = if FFlagLuaAppContinueSortInstantPlay then function() --[[ Line: 503 ]]
		-- upvalues: p1 (copy)
		p1:setState({ instantPlayRequested = false })
	end else nil
	
	function p1.onHoverChanged(IsHovered) --[[ Line: 510 ]]
		-- upvalues: p1 (copy)
		if IsHovered and p1.props.triggerFeedback then
			p1.props.triggerFeedback("Default", "Hover")
		end
		p1:setState({ isHovered = IsHovered })
	end
	
	p1.gameTileRef = RoactModule.createRef()
	
	function p1.getTilePosition() --[[ Line: 522 ]]
		-- upvalues: p1 (copy)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p1.getTileSize() --[[ Line: 530 ]]
		-- upvalues: p1 (copy)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsoluteSize else nil
	end
	
	p1.recordSponsoredGameClick = if FFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ Line: 540 ]]
		-- upvalues: p1 (copy), SponsoredGamesRecordClickFunction (upval)
		local Networking = p1.props.networking
		local Entry = p1.props.entry
		
		if Entry.isSponsored then
			SponsoredGamesRecordClickFunction(Networking, Entry.adId)
		end
	end
	p1.onActivated = if FFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ Line: 551 ]]
		-- upvalues: p1 (copy), HoverTileCoordinatorModule (upval), VideoEndReasonModule (upval), VideoPlaybackCoordinator (upval), GameCollectionItemTypes (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), IntervalPerformanceTracker (upval)
		if p1.props.isHovered then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		else
			VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		end
		if p1.isMounted then
			if p1.props.onActivated then
				p1.props.onActivated()
			end
			local NavigationUniverseId = p1.props.navigationUniverseId
			local config = {
				source = p1.props.source,
				index = p1.props.index,
				referralSource = p1.props.referralSource,
				onPeekViewClosed = p1.props.onPeekViewClosed,
				placeIdOverride = p1.props.entry.placeIdOverride,
				experienceJoinData = {
					launchData = if p1.props.entry.launchDataOverride then p1.props.entry.launchDataOverride else nil,
					tileType = p1.props.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
					nativeAdData = p1.props.entry.adId
				}
			}
			
			if GetFFlagEnableNavigationPerformanceIntervalsFunction() then
				IntervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
			end
			p1.props.navigateToGameDetails(NavigationUniverseId, config)
			p1.props.reportGameDetailOpened(p1.props.index, NavigationUniverseId)
			p1.recordSponsoredGameClick()
		end
	end
	p1.onGameDetailsActivated = if FFlagLuaAppGameDetailsAttributionFix then function() --[[ Line: 609 ]]
		-- upvalues: p1 (copy)
		p1.props.onGameTileActivated(p1.isMounted)
	end else p1.onActivated
	
	function p1.onFriendFooterActivated() --[[ Line: 614 ]]
		-- upvalues: p1 (copy), FFlagMigrateGameInfoToStore (upval), ToLegacyGameInfoModelFunction (upval)
		if p1.isMounted then
			local Game1 = nil
			if FFlagMigrateGameInfoToStore then
				local GameInfo = p1.state.gameInfo
				Game1 = p1.props.game or (if GameInfo then ToLegacyGameInfoModelFunction(GameInfo) else nil)
			else
				Game1 = p1.props.game
			end
			p1.props.openContextualMenu(Game1, p1.getTileSize(), p1.getTilePosition())
		end
	end
	
	function p1.onActivateSponsoredTooltip() --[[ Line: 630 ]]
		-- upvalues: p1 (copy), ResponsiveModule (upval)
		if p1.isMounted then
			p1.props.openSponsoredTooltip(ResponsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p1.loadWideThumbnail() --[[ Line: 638 ]]
		-- upvalues: p1 (copy), ContentProvider (upval)
		local WideThumbnail = p1.props.wideThumbnail
		
		if WideThumbnail ~= nil then
			task.spawn(function() --[[ Line: 641 ]]
				-- upvalues: ContentProvider (upval), WideThumbnail (copy)
				ContentProvider:PreloadAsync({ WideThumbnail })
			end)
		end
	end
	
	function p1.getVisitedFriends() --[[ Line: 647 ]]
		-- upvalues: p1 (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (upval)
		local List = {}
		local FriendVisits = p1.props.friendVisits
		
		for i = 1, #FriendVisits do
			local Text = tostring(FriendVisits[i].userId)
			
			if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(List, Text)
			elseif p1.props.users and p1.props.users[Text] then
				table.insert(List, {
					userId = Text,
					displayName = p1.props.users[Text].displayName
				})
			end
		end
		return List
	end
	
	p1.getSortedFriends = MemoizeFunction(function(p2, List) --[[ Line: 675 ]]
		-- upvalues: SortFriendsByPresenceAndRecencyFactoryModule (upval)
		if not p2 or not List then
			return {}
		end
		local List1 = {}
		
		for _, value in pairs(List) do
			local v1 = p2[value]
			
			if v1 and v1.isFriend then
				table.insert(List1, { userId = v1.id, displayName = v1.displayName })
			end
		end
		table.sort(List1, (SortFriendsByPresenceAndRecencyFactoryModule("displayName")))
		
		return List1
	end)
	
	function p1.onSelectionGained() --[[ Line: 697 ]]
		-- upvalues: FFlagLuaAppGameTileSelectionVideoPlayback (upval), p1 (copy)
		if not FFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = true })
		end
		if p1.props.onSelectionGained or FFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionGained(p1.props.entry, p1.props.index, p1.props.navigationUniverseId)
		end
	end
	
	function p1.onSelectionLost() --[[ Line: 707 ]]
		-- upvalues: FFlagLuaAppGameTileSelectionVideoPlayback (upval), p1 (copy)
		if not FFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = false })
		end
		if p1.props.onSelectionLost or FFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionLost()
		end
	end
end

local _ = function(p2) --[[ Line: 721 | Named "getTextLiteralForTextFooter" ]]
	if p2 == nil then
		return nil
	elseif p2.type == "TextLabel" then
		local Text = p2.text
		
		return if Text == nil then nil else Text.textLiteral
	else
		return nil
	end
end

local Callback = if FFlagLuaAppGenreRatingFooter then function(p2) --[[ Line: 737 ]]
	if p2 == nil then
		return nil
	elseif p2.type == "RatingWithGenre" then
		local Genre = p2.genre
		
		return if Genre == nil then nil else Genre.textLiteral
	else
		return nil
	end
end else nil

function AppGameTile.renderGridTilesFooter(p2) --[[ Line: 752 ]]
	-- upvalues: FFlagLuaAppContinueSortInstantPlay (copy), Callback1 (copy), ReactModule (copy), InstantPlayButtonModule (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), FFlagLuaAppGenreRatingFooter (copy), Callback (ref), FFlagMigrateGameInfoToStore (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppMigrateGameTileFixConsoleMetadataText (copy), GameTileTypesModule (copy), RoactModule (copy), GameStatsModule (copy), GameTileConstantsModule (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), GridTileSponsoredFooterModule (copy), GridTileTextFooterModule (copy), RatingWithGenreFooterModule (copy), GridTileFriendFooter (copy), GridTileIconTextFooterModule (copy), Images (copy)
	local CallbackResult = if FFlagLuaAppContinueSortInstantPlay then Callback1(p2.props.enableInstantPlay, p2.props.instantPlayTreatment) else nil
	
	if FFlagLuaAppContinueSortInstantPlay and (CallbackResult.isTreatment2 or CallbackResult.isTreatment3) then
		return ReactModule.createElement(InstantPlayButtonModule, {
			onActivated = p2.onInstantPlayActivated,
			showIcon = CallbackResult.isTreatment2,
			showText = CallbackResult.isTreatment3
		})
	end
	local UseHoverTile = p2.props.useHoverTile or p2.props.useExperienceTileMetadata
	local HasInGameFriends = p2.props.hasInGameFriends
	local InGameUserIds = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p2.props.inGameUserIds else nil
	local Users = p2.props.users
	local InGameUsersByGame = p2.props.inGameUsersByGame
	local SortedFriends = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p2.getSortedFriends(Users, InGameUsersByGame)
	local HasInGameFriends1 = p2.props.friendFooterEnabled and (if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then InGameUserIds and #InGameUserIds > 0 else HasInGameFriends)
	local v1: boolean = p2.props.friendVisits and #p2.props.friendVisits > 0
	local FooterLayoutData = p2.props.footerLayoutData
	local Text = nil
	
	if FooterLayoutData == nil then
		Text = nil
	elseif FooterLayoutData.type == "TextLabel" then
		local Text1 = FooterLayoutData.text
		Text = if Text1 == nil then nil else Text1.textLiteral
	else
		Text = nil
	end
	local CallbackResult1 = if FFlagLuaAppGenreRatingFooter then Callback(p2.props.footerLayoutData) else nil
	local Flag = false
	local AgeRatingText = nil
	
	if FFlagMigrateGameInfoToStore then
		if not p2.props.hidePlayButton and not p2.props.forceHideAgeRatings then
			local GameInfo = p2.state.gameInfo
			local GameMinimumAge = GameInfo and GameInfo.gameMinimumAge or 0
			local GameAgeDisplayName = GameInfo and GameInfo.gameAgeDisplayName or ""
			AgeRatingText = if GameMinimumAge == 0 or GameAgeDisplayName == "" then nil else GameAgeDisplayName
		end
	else
		AgeRatingText = p2.props.ageRatingText
	end
	if (p2.props.isHovered or (if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected)) and (AgeRatingText and not p2.props.hidePlayButton) then
		Text = AgeRatingText
		Flag = true
	end
	local HasText = Text ~= nil
	local HasCallbackResult = if FFlagLuaAppGenreRatingFooter then CallbackResult1 ~= nil else nil
	local Entry = p2.props.entry
	local IsShowSponsoredLabel = Entry.isSponsored and (Entry.isShowSponsoredLabel or (p2.props.isSponsoredFooterAllowed or p2.props.isSponsoredRatingFooterAllowed))
	
	if FFlagLuaAppMigrateGameTileFixConsoleMetadataText and p2.props.gameTileLayoutType == GameTileTypesModule.GameTileLayoutType.Narrow and p2.props.useExperienceTileMetadata and (IsShowSponsoredLabel or HasText or FFlagLuaAppGenreRatingFooter and HasCallbackResult) or p2.props.compactMetadataFormat then
		UseHoverTile = false
	end
	local DownVotes = nil
	local UpVotes = nil
	if FFlagMigrateGameInfoToStore then
		local StoreVotes = p2.state.storeVotes
		UpVotes = if StoreVotes then StoreVotes.upVotes else 0
		DownVotes = if StoreVotes then StoreVotes.downVotes else 0
	else
		UpVotes = p2.props.totalUpVotes
		DownVotes = p2.props.totalDownVotes
	end
	local Element = RoactModule.createElement(GameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = UpVotes,
			totalDownVotes = DownVotes,
			playerCount = if p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Footer then p2.props.entry.playerCount else nil
		},
		isGridTile = p2.props.useGridTile,
		hideGameStats = p2.props.hideGameStats,
		useLargerFont = UseHoverTile,
		gameTileLayoutType = p2.props.gameTileLayoutType,
		compactMetadataFormat = p2.props.compactMetadataFormat,
		hideRating = if FFlagLuaAppNarrowTileHideRating then p2.props.hideRating else nil,
		hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then p2.props.hidePlayerCount else nil
	})
	
	if not p2.props.hideMetadata then
		return if IsShowSponsoredLabel then ReactModule.createElement(GridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = UseHoverTile,
			onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
			gameTileLayoutType = p2.props.gameTileLayoutType,
			isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = Element
		}) elseif FFlagLuaAppGenreRatingFooter and HasCallbackResult and not Flag then ReactModule.createElement(RatingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = UseHoverTile,
			totalUpVotes = UpVotes,
			totalDownVotes = DownVotes,
			genreText = CallbackResult1
		}) elseif HasText then ReactModule.createElement(GridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = Text,
			useLargerFont = UseHoverTile
		}) elseif HasInGameFriends1 then if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then RoactModule.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = UseHoverTile,
			friendUserIds = InGameUserIds,
			onFriendFooterActivated = p2.onFriendFooterActivated
		}) else RoactModule.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			friends = SortedFriends,
			useLargerFont = UseHoverTile
		}) elseif p2.props.friendVisitedString then RoactModule.createElement(GridTileIconTextFooterModule, {
			icon = Images["icons/menu/recent"],
			text = p2.props.friendVisitedString,
			iconSize = if UseHoverTile then 32 else 24,
			useLargerFont = UseHoverTile
		}) elseif v1 then if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then RoactModule.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p2.getVisitedFriends(),
			useLargerFont = UseHoverTile
		}) else RoactModule.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p2.getVisitedFriends(),
			useLargerFont = UseHoverTile
		}) else Element
	elseif p2.props.isHovered then
		if IsShowSponsoredLabel then
			return ReactModule.createElement(GridTileSponsoredFooterModule, {
				isUnifiedGameTile = true,
				useLargerFont = UseHoverTile,
				onActivateSponsoredTooltip = p2.onActivateSponsoredTooltip,
				gameTileLayoutType = p2.props.gameTileLayoutType,
				isNarrowScreenXSmall = p2.props.isNarrowScreenXSmall,
				enableSponsoredFeedback = p2.props.enableSponsoredFeedback,
				isSponsoredRatingFooterAllowed = p2.props.isSponsoredRatingFooterAllowed,
				gameStatsElement = Element
			})
		elseif Flag then
			return ReactModule.createElement(GridTileTextFooterModule, {
				isUnifiedGameTile = true,
				text = Text,
				useLargerFont = UseHoverTile
			})
		end
	end
	return nil
end

function AppGameTile.renderContent(p2, ReducedMotion, p3, FoundationTokens) --[[ Line: 964 ]]
	-- upvalues: FFlagLuaAppContinueSortInstantPlay (copy), Callback1 (copy), GameTileConstantsModule (copy), GameTileViewConfigModule (copy), FFlagMigrateGameInfoToStore (copy), ReactModule (copy), GameStatsModule (copy), HiddenTileContentModule (copy), GameTileVideoThumbnailModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), FFlagLuaAppVideoTileDisableActivation (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppGameTileExtractGameDetailsCallback (copy), FFlagLuaAppGameDetailsAttributionFix (copy), LuaAppKeepTileBadgesDuringVideo (copy), RoactModule (copy), GameTileThumbnailBadgesModule (copy), FoundationModule (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppGameTileNotInterestedDirectAction (copy), GameTileContextualActionsModule (copy), GameTileOverflowMenuModule (copy), GameTileViewModule (copy), FFlagLuaAppMigrateGameTileHoverFixes (copy), AppExperienceActionRowModule (copy), FFlagLuaAppUnifyPlayButtonTile (copy), InstantPlayLauncherModule (copy), DiscoveryAnalyticsModule (copy)
	local Size = p2.props.Size or UDim2.fromScale(1, 1)
	local ImageThumbnail = p2.props.imageThumbnail
	local OnGameTileActivatedFunction = p2.props.onGameTileActivated
	local CallbackResult = if FFlagLuaAppContinueSortInstantPlay then Callback1(p2.props.enableInstantPlay, p2.props.instantPlayTreatment) else nil
	local IsPlayerCountStyleMatch: boolean = p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Always or p2.props.isHovered and p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Hover
	local ImageAspectRatio: number = GameTileViewConfigModule.getImageAspectRatio(p2.props.gameTileLayoutType)
	local RenderGridTilesFooterResult = p2:renderGridTilesFooter()
	local Name = if p2.props.hideTitle then nil elseif FFlagMigrateGameInfoToStore then p2.props.name or (p2.state.gameInfo and p2.state.gameInfo.name or "") else p2.props.name
	local Element = if IsPlayerCountStyleMatch then ReactModule.createElement(GameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p2.props.entry.playerCount
		}
	}) else nil
	local PlayButtonHeight = GameTileViewConfigModule.getElementSizes(p3.Tokens, p2.props.textSizeOffset, p2.props.contentTextLineCount, p2.props.foundationTokens, true).playButtonHeight
	local Element1 = if p2.props.isHidden then ReactModule.createElement(HiddenTileContentModule, {
		appPage = p2.props.appPage,
		collectionId = p2.props.topicId,
		setGameHidden = p2.props.setGameHidden,
		universeId = p2.props.universeId,
		parentRef = p2.props.hoverRef,
		isSponsored = p2.props.entry.isSponsored
	}) elseif p2.props.videoThumbnail then ReactModule.createElement(GameTileVideoThumbnailModule, {
		looped = true,
		ZIndex = -2,
		video = p2.props.videoThumbnail,
		accessContext = if FFlagLuaAppHomeMomentVideoFallback then p2.props.videoAccessContext else nil,
		image = ImageThumbnail,
		playing = p2.props.isVideoPlaying,
		Size = UDim2.fromScale(1, 1),
		isTileContained = p2.props.isContained,
		cornerRadius = p3.Tokens.Size.Size_200,
		onActivated = if FFlagLuaAppVideoTileDisableActivation then nil elseif FFlagLuaAppContinueSortInstantPlay and CallbackResult.isTreatment1 then p2.onInstantPlayActivated elseif FFlagLuaAppEdpMediaGalleryFullScreen then if FFlagLuaAppGameTileExtractGameDetailsCallback then p2.onGameDetailsActivated elseif FFlagLuaAppGameDetailsAttributionFix then function() --[[ Line: 1025 ]]
			-- upvalues: OnGameTileActivatedFunction (copy), p2 (copy)
			OnGameTileActivatedFunction(p2.isMounted)
		end else p2.onActivated else nil,
		itemIndex = p2.props.index,
		videoAnalytics = p2.props.videoAnalytics,
		universeId = p2.props.universeId,
		videoPlaybackCoordinator = if p2.props.videoPlaybackContext then p2.props.videoPlaybackContext.videoPlaybackCoordinator else nil
	}) else nil
	local Fragment = if LuaAppKeepTileBadgesDuringVideo or not p2.props.isVideoPlaying then if p2.props.tileBadges then RoactModule.createFragment({
		SocialFeaturePill = Element,
		Badge = ReactModule.createElement(GameTileThumbnailBadgesModule, { tileBadgesByPosition = p2.props.tileBadges })
	}) else Element else nil
	
	if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isTreatment1 and not p2.props.isHidden then
		local Element2 = ReactModule.createElement(FoundationModule.View, {
			tag = "align-x-center align-y-center anchor-bottom-left size-600-600 radius-medium",
			backgroundStyle = FoundationTokens.Color.Extended.Black.Black_70,
			Position = UDim2.new(0, FoundationTokens.Padding.XSmall, 1, -FoundationTokens.Padding.XSmall)
		}, {
			Icon = ReactModule.createElement(FoundationModule.Icon, {
				name = FoundationModule.Enums.IconName.PlaySmall,
				size = FoundationModule.Enums.IconSize.Small,
				style = FoundationTokens.Color.Extended.White.White_100
			})
		})
		
		if Fragment then
			Fragment = RoactModule.createFragment({ Existing = Fragment, PlayOverlay = Element2 })
		else
			Fragment = Element2
		end
	end
	local IsHidden = p2.props.isHidden
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		ZIndex = p2.props.ZIndex,
		LayoutOrder = p2.props.layoutOrder,
		ref = p2.gameTileRef
	}, {
		Tile = ReactModule.createElement(GameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p2.props.SelectionOrder,
			Selectable = not IsHidden,
			hoverPadding = if FFlagLuaAppMigrateGameTileHoverFixes or p2.props.useGridTile then nil else p3.Tokens.Size.Size_200,
			numLinesForTitle = p2.props.contentTextLineCount,
			numLinesForMetadata = p2.props.metadataTextLineCount,
			imageAspectRatio = ImageAspectRatio,
			isContained = p2.props.isContained,
			containmentSidePadding = GameTileViewConfigModule.getContainmentSidePadding(p3.Tokens, p2.props.gameTileLayoutType, p2.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = ImageThumbnail,
			thumbnailComponent = Element1,
			title = if IsHidden then nil else Name,
			isDisabled = if IsHidden then true else p2.props.isDisabled,
			onActivated = if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isTreatment1 and not IsHidden then p2.onInstantPlayActivated elseif FFlagLuaAppGameTileExtractGameDetailsCallback then if IsHidden then p2.onActivated else p2.onGameDetailsActivated elseif FFlagLuaAppGameDetailsAttributionFix and not IsHidden then function() --[[ Line: 1146 ]]
				-- upvalues: OnGameTileActivatedFunction (copy), p2 (copy)
				OnGameTileActivatedFunction(p2.isMounted)
			end else p2.onActivated,
			onGuiStateChanged = p2.props.onGuiStateChanged,
			onSelectionGained = p2.onSelectionGained,
			onSelectionLost = p2.onSelectionLost,
			onTouchLongPress = if IsHidden then nil else p2.onTouchLongPress,
			onMetadataActivated = if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isTreatment1 and not IsHidden then p2.onGameDetailsActivated else nil,
			reducedMotion = ReducedMotion,
			isHovered = not IsHidden and p2.props.isHovered,
			forwardRef = p2.props.hoverRef,
			hidePlayButton = if IsHidden then true else p2.props.hidePlayButton,
			hoverActionRow = if p2.props.hidePlayButton or IsHidden or FFlagLuaAppContinueSortInstantPlay and CallbackResult.isActive then nil else ReactModule.createElement(AppExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p2.props.navigationUniverseId,
				referralSource = p2.props.referralSource,
				reportExperienceLaunched = p2.reportExperienceLaunchedFromActionBar,
				openGameDetails = if FFlagLuaAppGameTileExtractGameDetailsCallback then p2.onGameDetailsActivated elseif FFlagLuaAppGameDetailsAttributionFix then function() --[[ Line: 1173 ]]
					-- upvalues: OnGameTileActivatedFunction (copy), p2 (copy)
					OnGameTileActivatedFunction(p2.isMounted)
				end else p2.onActivated,
				entry = p2.props.entry,
				launchExperienceEventContext = p2.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p2.props.index,
				height = PlayButtonHeight,
				showButtonText = ImageAspectRatio > 1,
				isUnifiedGameTileEnabled = if FFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p2.props.entry.placeIdOverride,
				launchDataOverride = p2.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if IsHidden then nil else Fragment,
			overflowMenu = if next(p2.props.availableMenuItems) == nil then nil elseif p2.props.isHovered or p2.props.overflowMenuOpen then if IsHidden then nil else ReactModule.createElement(if FFlagLuaAppGameTileNotInterestedDirectAction then GameTileContextualActionsModule else GameTileOverflowMenuModule, {
				isHovered = p2.props.isHovered,
				isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected,
				universeId = p2.props.universeId,
				placeId = p2.props.entry.placeId,
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
				onGameDetailsActivated = if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isActive then p2.onGameDetailsActivated else nil
			}) elseif if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected then if IsHidden then nil else ReactModule.createElement(if FFlagLuaAppGameTileNotInterestedDirectAction then GameTileContextualActionsModule else GameTileOverflowMenuModule, {
				isHovered = p2.props.isHovered,
				isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected,
				universeId = p2.props.universeId,
				placeId = p2.props.entry.placeId,
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
				onGameDetailsActivated = if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isActive then p2.onGameDetailsActivated else nil
			}) else nil,
			footerMetadata = if IsHidden then nil else RenderGridTilesFooterResult,
			textSizeOffset = p2.props.textSizeOffset,
			hideMetadata = p2.props.hideMetadata,
			isTouchPreferredInput = if FFlagLuaAppContinueSortInstantPlay then p2.props.isTouchPreferredInput else nil
		}),
		VideoPlaybackDetector = p2.props.videoPlaybackDetector,
		InstantPlayLauncher = if FFlagLuaAppContinueSortInstantPlay and CallbackResult.isActive and p2.state.instantPlayRequested then ReactModule.createElement(InstantPlayLauncherModule, {
			launchSource = "ExperienceTile",
			universeId = p2.props.navigationUniverseId,
			referralSource = p2.props.referralSource,
			eventContext = DiscoveryAnalyticsModule.Constants.Context.InstantPlay,
			launchData = p2.props.entry.launchDataOverride,
			placeId = p2.props.entry.placeIdOverride,
			reportExperienceLaunched = p2.reportExperienceLaunchedFromInstantPlay,
			openGameDetails = p2.onGameDetailsActivated,
			onLaunchAttemptCompleted = p2.onInstantPlayAttemptCompleted
		}) else nil
	})
end

function AppGameTile.render(p2) --[[ Line: 1219 ]]
	-- upvalues: DiscoveryAppLaunchTracker (copy), WithStyleFunction (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p2.props.game == nil then nil else WithStyleFunction(function(p3) --[[ Line: 1229 ]]
		-- upvalues: p2 (copy)
		return p2:renderContent(p3.Settings.ReducedMotion, p3, p2.props.foundationTokens)
	end)
end

function AppGameTile.didMount(p2) --[[ Line: 1235 ]]
	-- upvalues: ImpressionsTagUtility (copy)
	p2.isMounted = true
	ImpressionsTagUtility.AddTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	
	if not p2.props.useGridTile and p2.props.friendFooterEnabled and p2.props.hasInGameFriends then
		p2:setState({ canDisplayFriendFooter = true })
	end
	if p2.props.useGridTile then
		p2.loadWideThumbnail()
	end
end

function AppGameTile.willUnmount(p2) --[[ Line: 1250 ]]
	-- upvalues: ImpressionsTagUtility (copy), FFlagMigrateGameInfoToStore (copy)
	p2.isMounted = false
	ImpressionsTagUtility.RemoveTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	
	if FFlagMigrateGameInfoToStore then
		p2.gameInfoSubscription.dispose()
	end
end

function AppGameTile.didUpdate(p2, p3) --[[ Line: 1258 ]]
	-- upvalues: FFlagMigrateGameInfoToStore (copy), ImpressionsTagUtility (copy)
	if FFlagMigrateGameInfoToStore then
		p2.gameInfoSubscription.update(p2.props.entry.universeId)
	end
	if p3.impressionsTag ~= p2.props.impressionsTag or p3.index ~= p2.props.index then
		ImpressionsTagUtility.RemoveTag(p2.gameTileRef, p3.impressionsTag, p3.index)
		ImpressionsTagUtility.AddTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
	end
	if p2.props.useGridTile and p3.universeId ~= p2.props.universeId then
		p2.loadWideThumbnail()
	end
	if not p2.props.useGridTile and (p3.friendFooterEnabled ~= p2.props.friendFooterEnabled or p3.hasInGameFriends ~= p2.props.hasInGameFriends) and p2.props.friendFooterEnabled and p2.props.hasInGameFriends then
		p2:setState({ canDisplayFriendFooter = true })
	end
end

local _ = function(p2, p3): string --[[ Line: 1287 | Named "formatRating" ]]
	return if p2 + p3 == 0 then "--" else tostring((math.floor(p2 / (p2 + p3) * 100 + 0.5))) .. "%"
end

local v1 = RoactRoduxModule.connect(function(p2, p3) --[[ Line: 1295 ]]
	-- upvalues: FFlagLuaAppGameDetailsAttributionFix (copy), GameInfosReducer (copy), FFlagMigrateGameInfoToStore (copy), GameTileConstantsModule (copy), GetGameTileLayoutDataModule (copy), FFlagLuaAppHomeThumbnailPrefetch (copy), ResolveGameTileThumbnailUriModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), FormatExperienceIconModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), GetLayoutDataVideoModule (copy), LuaAppUseRatingFormatHelper2 (copy), FormatExperienceRatingModule (copy), t (copy)
	local UniverseId = p3.entry.universeId
	local NavigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then nil elseif p3.entry.navigationUniverseId and p3.entry.navigationUniverseId ~= "" and p3.entry.navigationUniverseId ~= "0" then p3.entry.navigationUniverseId else p3.entry.universeId
	local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][UniverseId]
	local TotalUpVotes = nil
	local TotalDownVotes = nil
	
	if not FFlagMigrateGameInfoToStore then
		TotalUpVotes = PersonalizationEntry and PersonalizationEntry.totalUpVotes or 0
		TotalDownVotes = PersonalizationEntry and PersonalizationEntry.totalDownVotes or 0
	end
	local FriendActivityTitle = PersonalizationEntry and PersonalizationEntry.friendActivityTitle or nil
	local Flag: boolean? = nil
	local AgeRatingText = nil
	local MinimumAge = nil
	local AgeRecommendationDisplayName = nil
	
	if not FFlagMigrateGameInfoToStore then
		MinimumAge = PersonalizationEntry and PersonalizationEntry.minimumAge or 0
		AgeRecommendationDisplayName = PersonalizationEntry and PersonalizationEntry.ageRecommendationDisplayName or ""
	end
	local IsNotPlayButtonStyleMatch: boolean = if p3.gameTileLayoutType == "Event" then p3.playButtonStyle ~= GameTileConstantsModule.PlayButtonStyleValues.Enabled else p3.gameTileLayoutType == "Wide" and p3.playButtonStyle == GameTileConstantsModule.PlayButtonStyleValues.Disabled
	
	if not FFlagMigrateGameInfoToStore then
		if IsNotPlayButtonStyleMatch or p3.forceHideAgeRatings then
			Flag = false
		elseif MinimumAge == 0 or AgeRecommendationDisplayName == "" then
			Flag = false
		else
			Flag = true
			AgeRatingText = AgeRecommendationDisplayName
		end
	end
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(PersonalizationEntry, p3.topicId)
	local GameIconUrl = p3.gameIconUrl
	local ResolveGameTileThumbnailUriModuleResult1 = nil
	local ResolveGameTileThumbnailUriModuleResult = nil
	
	if FFlagLuaAppHomeThumbnailPrefetch then
		local function _(UseGridTile) --[[ Line: 1365 | Named "resolveThumbnail" ]]
			-- upvalues: ResolveGameTileThumbnailUriModule (upval), GameIconUrl (copy), UniverseId (copy), p3 (copy), PersonalizationEntry (copy)
			return ResolveGameTileThumbnailUriModule({
				iconUrl = GameIconUrl,
				universeId = UniverseId,
				placeId = p3.entry.placeId,
				useGridTile = UseGridTile,
				perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
				game = PersonalizationEntry,
				topicId = p3.topicId
			})
		end
		
		ResolveGameTileThumbnailUriModuleResult = ResolveGameTileThumbnailUriModule({
			iconUrl = GameIconUrl,
			universeId = UniverseId,
			placeId = p3.entry.placeId,
			useGridTile = p3.useGridTile == true,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = PersonalizationEntry,
			topicId = p3.topicId
		})
		ResolveGameTileThumbnailUriModuleResult1 = if p3.useGridTile then ResolveGameTileThumbnailUriModuleResult else ResolveGameTileThumbnailUriModule({
			useGridTile = true,
			iconUrl = GameIconUrl,
			universeId = UniverseId,
			placeId = p3.entry.placeId,
			perEntryWideAssetId = p3.entry.primaryWideImageAssetId,
			game = PersonalizationEntry,
			topicId = p3.topicId
		})
	else
		ResolveGameTileThumbnailUriModuleResult1 = FormatExperienceThumbnailModule((if p3.entry.primaryWideImageAssetId then p3.entry.primaryWideImageAssetId else ItemLayoutDataParsingUtilsModule.getWideImageAssetId(GameTileLayoutDataModule)) or (PersonalizationEntry and PersonalizationEntry.primaryWideAssetId or nil), p3.entry.placeId)
		ResolveGameTileThumbnailUriModuleResult = if p3.useGridTile then ResolveGameTileThumbnailUriModuleResult1 else FormatExperienceIconModule(GameIconUrl, UniverseId)
	end
	local AccessContext = nil
	local AssetId = nil
	
	if FFlagLuaAppHomeMomentVideoFallback then
		local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule, p3.entry.primaryWideVideoAssetId)
		AssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
		AccessContext = LayoutDataVideoModule and LayoutDataVideoModule.accessContext
	else
		AssetId = if p3.entry.primaryWideVideoAssetId then p3.entry.primaryWideVideoAssetId else GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
	end
	return {
		game = PersonalizationEntry,
		universeId = UniverseId,
		navigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then nil else NavigationUniverseId,
		name = if FFlagMigrateGameInfoToStore then GameTileLayoutDataModule and GameTileLayoutDataModule.title else GameTileLayoutDataModule and GameTileLayoutDataModule.title or (PersonalizationEntry and PersonalizationEntry.name or ""),
		totalUpVotes = TotalUpVotes,
		totalDownVotes = TotalDownVotes,
		imageThumbnail = ResolveGameTileThumbnailUriModuleResult,
		wideThumbnail = ResolveGameTileThumbnailUriModuleResult1,
		videoThumbnail = if AssetId then `rbxassetid://{AssetId}` else nil,
		videoAccessContext = if FFlagLuaAppHomeMomentVideoFallback then AccessContext else nil,
		friendActivityTitle = FriendActivityTitle,
		rating = if FFlagMigrateGameInfoToStore then nil elseif p3.useHoverTile or p3.useExperienceTileMetadata then if LuaAppUseRatingFormatHelper2 then FormatExperienceRatingModule(TotalUpVotes, TotalDownVotes, nil, true) elseif TotalUpVotes + TotalDownVotes == 0 then "--" else tostring((math.floor(TotalUpVotes / (TotalUpVotes + TotalDownVotes) * 100 + 0.5))) .. "%" else nil,
		showAgeRating = Flag,
		ageRatingText = AgeRatingText,
		friendVisits = PersonalizationEntry and PersonalizationEntry.friendVisits or t,
		friendVisitedString = if PersonalizationEntry and PersonalizationEntry.friendVisitedString ~= "" then PersonalizationEntry.friendVisitedString else nil,
		hidePlayButton = IsNotPlayButtonStyleMatch,
		footerLayoutData = GameTileLayoutDataModule and GameTileLayoutDataModule.footer or nil
	}
end, function(Callback) --[[ Line: 1445 ]]
	-- upvalues: OpenCentralOverlayForPlacesListModule (copy), OpenSponsoredTooltipModule (copy)
	return {
		openContextualMenu = function(p2, p3, p4) --[[ Line: 1447 ]]
			-- upvalues: Callback (copy), OpenCentralOverlayForPlacesListModule (upval)
			Callback(OpenCentralOverlayForPlacesListModule(p2, p3, p4))
		end,
		openSponsoredTooltip = function(p2) --[[ Line: 1450 ]]
			-- upvalues: Callback (copy), OpenSponsoredTooltipModule (upval)
			return Callback(OpenSponsoredTooltipModule(p2))
		end
	}
end)(AppGameTile)

if not FFlagLuaAppGameDetailsAttributionFix then
	v1 = RoactServices.connect({ networking = RoactNetworking })(v1)
end
local function v108(p2) --[[ Line: 1462 ]]
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), GameHydrationReactModule (copy), UseIsHoveredTileModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), UseValidTileBadgesModule (copy), UseSelectorFunction (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), UseHasInGameFriendsModule (copy), FFlagGameTileMigrateOffLegacyPresence (copy), UseGetOnlineFriendsByUniverseId (copy), CryoModule (copy), UseInGameUserIdsModule (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppSearchResultsPageGameTileVideo (copy), FFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), FFlagLuaAppGameDetailsAttributionFix (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), SponsoredGamesRecordClickFunction (copy), HoverTileCoordinatorModule (copy), VideoEndReasonModule (copy), VideoPlaybackCoordinator (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervalsFunction (copy), IntervalPerformanceTracker (copy), UseOverflowMenuOpenFunction (copy), UseTriggerFeedbackFunction (copy), FFlagLuaAppContinueSortInstantPlay (copy), Callback1 (copy), GetAvailableGameTileOverflowMenuItemsModule (copy), FFlagLuaAppEnableReportExperience (copy), UseHasVideoThumbnailSelectorModule (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), UsePreferredInputFunction (copy), GameVideoPlaybackDetectorModule (copy), ResponsiveModule (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), v1 (ref)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseHoverTile = p2.useHoverTile
	local UseGameIconResult = GameHydrationReactModule.useGameIcon(p2.entry.universeId)
	local Text: string = `{p2.impressionsTag or ""}_{p2.index or "0"}_{p2.gameTileLayoutType or "Narrow"}`
	
	if p2.impressionsTag == nil or p2.index == nil then
		UseHoverTile = false
	end
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, Text, UseHoverTile)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local UseHoverTile1 = if IsUiModeMatch then true else p2.useHoverTile
	local IsUiModeMatch1 = if p2.useExperienceTileMetadata == nil then IsUiModeMatch else p2.useExperienceTileMetadata
	local UseValidTileBadgesModuleResult = UseValidTileBadgesModule(p2.entry.universeId, p2.topicId, p2.badgeOverride)
	local UseSelectorResult = UseSelectorFunction(function(p3) --[[ Line: 1487 ]]
		return p3.LocalUserId
	end)
	local UseSelectorResult1 = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else UseSelectorFunction(function(p3) --[[ Line: 1493 ]]
		return p3.Users
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p3) --[[ Line: 1498 ]]
		-- upvalues: p2 (copy)
		return p3.InGameUsersByGame[p2.entry.universeId]
	end)
	local UseHasInGameFriendsModuleResult = UseHasInGameFriendsModule(UseSelectorResult, UseSelectorResult1, UseSelectorResult2)
	local UseGetOnlineFriendsByUniverseIdResult = if FFlagGameTileMigrateOffLegacyPresence then UseGetOnlineFriendsByUniverseId(p2.entry.universeId) else nil
	local UseMemoResult = if FFlagGameTileMigrateOffLegacyPresence then ReactModule.useMemo(function() --[[ Line: 1509 ]]
		-- upvalues: CryoModule (upval), UseGetOnlineFriendsByUniverseIdResult (copy)
		return CryoModule.List.map(UseGetOnlineFriendsByUniverseIdResult or {}, function(p3) --[[ Line: 1510 ]]
			return p3.id
		end)
	end, { UseGetOnlineFriendsByUniverseIdResult }) else nil
	local UseMemoResult1 = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then if FFlagGameTileMigrateOffLegacyPresence then UseMemoResult else UseInGameUserIdsModule(UseSelectorResult, UseSelectorResult2) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v2 = nil
	local UseStateResult2_1 = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagLuaAppGameTileSelectionVideoPlayback then
		v2, UseStateResult2_1 = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function(p3, p4, p5) --[[ Line: 1530 ]]
			-- upvalues: UseStateResult2_1 (ref), p2 (copy)
			UseStateResult2_1(true)
			
			if p2.onSelectionGained then
				p2.onSelectionGained(p3, p4, p5)
			end
		end, { p2.onSelectionGained })
		UseResult1 = ReactModule.useCallback(function() --[[ Line: 1538 ]]
			-- upvalues: UseStateResult2_1 (ref), p2 (copy)
			UseStateResult2_1(false)
			
			if p2.onSelectionLost then
				p2.onSelectionLost()
			end
		end, { p2.onSelectionLost })
	end
	local IsDisablePlayback: boolean = if FFlagLuaAppSearchResultsPageGameTileVideo then p2.videoPlaybackContext ~= nil and p2.videoPlaybackContext.disablePlayback == true else FFlagLuaAppGateVideoPlaybackOnNavigationFocus and (p2.videoPlaybackContext ~= nil and p2.videoPlaybackContext.disablePlayback == true)
	
	if FFlagLuaAppFixHiddenTileVideoCleanup or FFlagLuaAppSearchResultsPageGameTileVideo or FFlagLuaAppGateVideoPlaybackOnNavigationFocus then
		ReactModule.useEffect(function() --[[ Line: 1557 ]]
			-- upvalues: FFlagLuaAppFixHiddenTileVideoCleanup (upval), p2 (copy), FFlagLuaAppSearchResultsPageGameTileVideo (upval), FFlagLuaAppGateVideoPlaybackOnNavigationFocus (upval), IsDisablePlayback (copy), UseStateResult2 (copy)
			if FFlagLuaAppFixHiddenTileVideoCleanup and p2.isHidden or (FFlagLuaAppSearchResultsPageGameTileVideo or FFlagLuaAppGateVideoPlaybackOnNavigationFocus) and IsDisablePlayback then
				UseStateResult2(false)
			end
		end, {
			p2.isHidden,
			if FFlagLuaAppSearchResultsPageGameTileVideo or FFlagLuaAppGateVideoPlaybackOnNavigationFocus then IsDisablePlayback else nil
		})
	end
	local v3 = nil
	local NavigationUniverseId = nil
	local UseResult2 = nil
	local Callback = nil
	
	if FFlagLuaAppGameDetailsAttributionFix then
		v3 = UseRoactServiceFunction(RoactNetworking)
		NavigationUniverseId = if p2.entry.navigationUniverseId and p2.entry.navigationUniverseId ~= "" and p2.entry.navigationUniverseId ~= "0" then p2.entry.navigationUniverseId else p2.entry.universeId
		Callback = ReactModule.useCallback(function() --[[ Line: 1589 ]]
			-- upvalues: p2 (copy), SponsoredGamesRecordClickFunction (upval), v3 (ref)
			local Entry = p2.entry
			
			if Entry.isSponsored then
				SponsoredGamesRecordClickFunction(v3, Entry.adId)
			end
		end, { v3, p2.entry.isSponsored, p2.entry.adId })
		UseResult2 = ReactModule.useCallback(function(p3) --[[ Line: 1598 ]]
			-- upvalues: p2 (copy), HoverTileCoordinatorModule (upval), VideoEndReasonModule (upval), NavigationUniverseId (ref), VideoPlaybackCoordinator (upval), GameCollectionItemTypes (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), IntervalPerformanceTracker (upval), Callback (ref)
			if p2.isHovered then
				HoverTileCoordinatorModule.default:reset()
			end
			if p2.videoPlaybackContext and p2.videoPlaybackContext.videoPlaybackCoordinator then
				p2.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.TileClicked, nil, NavigationUniverseId, nil)
			else
				VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.TileClicked, nil, NavigationUniverseId, nil)
			end
			if p3 then
				if p2.onActivated then
					p2.onActivated()
				end
				local config = {
					source = p2.source,
					index = p2.index,
					referralSource = p2.referralSource,
					onPeekViewClosed = p2.onPeekViewClosed,
					placeIdOverride = p2.entry.placeIdOverride,
					experienceJoinData = {
						launchData = if p2.entry.launchDataOverride then p2.entry.launchDataOverride else nil,
						tileType = p2.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
						nativeAdData = p2.entry.adId
					}
				}
				
				if GetFFlagEnableNavigationPerformanceIntervalsFunction() then
					IntervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
				end
				p2.navigateToGameDetails(NavigationUniverseId, config)
				p2.reportGameDetailOpened(p2.index, NavigationUniverseId)
				Callback()
			end
		end, {
			p2.isHovered, p2.index, p2.videoAnalytics, p2.onActivated, p2.source,
			p2.referralSource, p2.onPeekViewClosed, p2.navigateToGameDetails,
			p2.reportGameDetailOpened, NavigationUniverseId, Callback,
			p2.entry.placeIdOverride, p2.entry.launchDataOverride,
			if p2.videoPlaybackContext then p2.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	end
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(Text)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local CallbackResult = if FFlagLuaAppContinueSortInstantPlay then Callback1(p2.enableInstantPlay, p2.instantPlayTreatment) else nil
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 1670 ]]
		-- upvalues: GetAvailableGameTileOverflowMenuItemsModule (upval), p2 (copy), FFlagLuaAppContinueSortInstantPlay (upval), CallbackResult (copy), FFlagLuaAppEnableReportExperience (upval)
		return GetAvailableGameTileOverflowMenuItemsModule({
			isSponsored = p2.entry.isSponsored,
			enableExplicitFeedback = p2.enableExplicitFeedback,
			enableSponsoredFeedback = p2.enableSponsoredFeedback,
			enableReportAd = p2.enableReportAd,
			enableGameDetails = if FFlagLuaAppContinueSortInstantPlay then CallbackResult.isTreatment1 else nil,
			enableReportExperience = if FFlagLuaAppEnableReportExperience then p2.enableReportExperience else nil
		})
	end, {
		p2.entry.isSponsored, p2.enableExplicitFeedback, p2.enableSponsoredFeedback,
		p2.enableReportAd,
		if FFlagLuaAppContinueSortInstantPlay then CallbackResult.isTreatment1 else nil,
		if FFlagLuaAppEnableReportExperience then p2.enableReportExperience else nil
	})
	local UseHasVideoThumbnailSelectorModuleResult = UseHasVideoThumbnailSelectorModule(p2.entry.universeId, p2.topicId)
	local HasPrimaryWideVideoAssetId = p2.entry.primaryWideVideoAssetId ~= nil or UseHasVideoThumbnailSelectorModuleResult
	UseTagAsViewportAutoplayCandidateFunction(UseRefResult, p2.videoPlaybackContext, if FFlagLuaAppTileVideoCandidateOnly then HasPrimaryWideVideoAssetId else nil, if FFlagLuaAppFixHiddenTileVideoCleanup then p2.isHidden else nil, nil, nil, nil, if FFlagLuaAppOneByTwoHoverIdleAutoplay and HasPrimaryWideVideoAssetId then {
		isUserIntentModeAutoplayCandidate = false,
		videoKey = Text
	} else nil)
	local UsePreferredInputResult = if not FFlagLuaAppGameTileSelectionVideoPlayback then if FFlagLuaAppEdpMediaGalleryVideoPreview then UsePreferredInputFunction() else nil else nil
	
	return (ReactModule.createElement(v1, CryoModule.Dictionary.join(p2, {
		useExperienceTileMetadata = IsUiModeMatch1,
		hasBackground = UseHoverTile1,
		gameIconUrl = UseGameIconResult,
		hoverRef = UseRefResult,
		isHoverSupported = UseHoverTile,
		isHovered = UseIsHoveredTileModuleResult,
		isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then v2 else nil,
		isVideoPlaying = UseStateResult,
		tileBadges = UseValidTileBadgesModuleResult,
		foundationTokens = UseTokensResult,
		users = UseSelectorResult1,
		inGameUsersByGame = UseSelectorResult2,
		hasInGameFriends = UseHasInGameFriendsModuleResult,
		inGameUserIds = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then UseMemoResult1 else nil,
		networking = if FFlagLuaAppGameDetailsAttributionFix then v3 else nil,
		navigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then NavigationUniverseId else nil,
		onGameTileActivated = if FFlagLuaAppGameDetailsAttributionFix then UseResult2 else nil,
		recordSponsoredGameClick = if FFlagLuaAppGameDetailsAttributionFix then Callback else nil,
		overflowMenuOpen = UseOverflowMenuOpenResult,
		hoverKey = Text,
		triggerFeedback = UseTriggerFeedbackResult,
		availableMenuItems = UseMemoResult2,
		onSelectionGained = if FFlagLuaAppGameTileSelectionVideoPlayback then UseResult else p2.onSelectionGained,
		onSelectionLost = if FFlagLuaAppGameTileSelectionVideoPlayback then UseResult1 else p2.onSelectionLost,
		videoPlaybackDetector = if HasPrimaryWideVideoAssetId and not p2.isHidden and (not FFlagLuaAppSearchResultsPageGameTileVideo and not FFlagLuaAppGateVideoPlaybackOnNavigationFocus or not IsDisablePlayback) then ReactModule.createElement(GameVideoPlaybackDetectorModule, {
			videoKey = Text,
			itemIndex = p2.index,
			universeId = p2.entry.universeId,
			tileRef = UseRefResult,
			isHoverSupported = UseHoverTile,
			isHovered = UseIsHoveredTileModuleResult,
			isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then v2 else nil,
			autoplay = if FFlagLuaAppGameTileSelectionVideoPlayback then nil elseif FFlagLuaAppEdpMediaGalleryVideoPreview then UsePreferredInputResult == ResponsiveModule.Input.Touch else nil,
			onPlaybackChange = UseStateResult2,
			videoAnalytics = p2.videoAnalytics,
			videoDwellTimeInSec = FIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = FIntLuaAppGameTileVideoVisiblePercent,
			hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p2.hasPrevalidatedVideoGamePlayability else nil,
			pageContext = p2.appPage,
			videoPlaybackContext = p2.videoPlaybackContext
		}) else nil
	})))
end

return if FFlagSignalsNavP3fGameDetails then ReactModule.memo(v108) else v108