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
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local videoUtilsModule = require(parent.VideoUtils)
local tModule = require(parent.t)
local UIBloxModule = require(parent.UIBlox)
local fFlagSignalsNavP3fGameDetails = require(parent.SharedFlags).FFlagSignalsNavP3fGameDetails
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
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppTileVideoDeviceMemoryBlocking = require(parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local luaAppStabilizeVideoTileReactRoot = game:DefineFastFlag("LuaAppStabilizeVideoTileReactRoot", false)
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppGenreRatingFooter = require(parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagLuaAppHomeThumbnailPrefetch = require(parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local var43 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local getAvailableGameTileOverflowMenuItemsModule = require(gameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _() --[[ line: 134 | named "getHoverDelay" ]]
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
	videoPlaybackDetector = if luaAppStabilizeVideoTileReactRoot then tModule.optional(tModule.table) else nil
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

function appGameTile.init(p0) --[[ line: 263 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), sponsoredGamesRecordClick (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileInit()
	end
	p0.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else false
	}
	
	function p0.onMenuOpenChanged(p1, p2) --[[ line: 274 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.props.appPage,
			universeId = p0.props.universeId,
			sortId = p0.props.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.props.appPage or "Unknown" else nil)
	end
	
	function p0.onTouchLongPress() --[[ line: 289 ]]
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
	
	function p0.reportExperienceLaunchedFromActionBar(...) --[[ line: 317 ]]
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
	
	function p0.renderAppExperienceActionRow(_) --[[ line: 350 ]]
		-- upvalues: roactModule (copy), appExperienceActionRowModule (copy), p0 (ref), fFlagLuaAppGameDetailsAttributionFix (copy), fFlagLuaAppUnifyPlayButtonTile (copy)
		return roactModule.createElement(appExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p0.props.navigationUniverseId,
			referralSource = p0.props.referralSource,
			reportExperienceLaunched = p0.reportExperienceLaunchedFromActionBar,
			openGameDetails = if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 357 ]]
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
	
	function p0.onHoverChanged(p3) --[[ line: 371 ]]
		-- upvalues: p0 (ref)
		if p3 and p0.props.triggerFeedback then
			p0.props.triggerFeedback("Default", "Hover")
		end
		p0:setState({ isHovered = p3 })
	end
	
	p0.gameTileRef = roactModule.createRef()
	
	function p0.getTilePosition() --[[ line: 383 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p0.getTileSize() --[[ line: 391 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsoluteSize else nil
	end
	
	p0.recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 401 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy)
		local networking = p0.props.networking
		local entry = p0.props.entry
		
		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	p0.onActivated = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 412 ]]
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
	
	function p0.onFriendFooterActivated() --[[ line: 469 ]]
		-- upvalues: p0 (ref)
		if p0.isMounted then
			p0.props.openContextualMenu(p0.props.game, p0.getTileSize(), p0.getTilePosition())
		end
	end
	
	function p0.onActivateSponsoredTooltip() --[[ line: 477 ]]
		-- upvalues: p0 (ref), responsiveModule (copy)
		if p0.isMounted then
			p0.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p0.loadWideThumbnail() --[[ line: 485 ]]
		-- upvalues: p0 (ref), contentProviderService (copy)
		local wideThumbnail = p0.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function() --[[ line: 488 ]]
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p0.getVisitedFriends() --[[ line: 494 ]]
		-- upvalues: p0 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p0.props.friendVisits
		
		for i = 1, #friendVisits do
			local var53 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var53)
			elseif p0.props.users and p0.props.users[var53] then
				table.insert(t, {
					userId = var53,
					displayName = p0.props.users[var53].displayName
				})
			end
		end
		return t
	end
	
	p0.getSortedFriends = memoize(function(p4, p5) --[[ line: 522 ]]
		-- upvalues: sortFriendsByPresenceAndRecencyFactoryModule (copy)
		if not p4 or not p5 then
			return {}
		end
		local t = {}
		
		for i, v in pairs(p5) do
			local var55 = p4[v]
			
			if var55 and var55.isFriend then
				table.insert(t, { userId = var55.id, displayName = var55.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p0.onSelectionGained() --[[ line: 544 ]]
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = true })
		end
		if p0.props.onSelectionGained or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionGained(p0.props.entry, p0.props.index, p0.props.navigationUniverseId)
		end
	end
	
	function p0.onSelectionLost() --[[ line: 554 ]]
		-- upvalues: fFlagLuaAppGameTileSelectionVideoPlayback (copy), p0 (ref)
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			p0:setState({ isSelected = false })
		end
		if p0.props.onSelectionLost or fFlagLuaAppGameTileSelectionVideoPlayback then
			p0.props.onSelectionLost()
		end
	end
end

local _ = function(p6) --[[ line: 568 | named "getTextLiteralForTextFooter" ]]
	if p6 == nil then
		return nil
	elseif p6.type ~= "TextLabel" then
		return nil
	end
	local text = p6.text
	
	return if text == nil then nil else text.textLiteral
end

local var48 = if fFlagLuaAppGenreRatingFooter then function(p7) --[[ line: 584 ]]
	if p7 == nil then
		return nil
	elseif p7.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p7.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p8) --[[ line: 599 ]]
	-- upvalues: fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var48 (write), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), reactModule (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var56 = p8.props.useHoverTile or p8.props.useExperienceTileMetadata
	local friendFooterEnabled = p8.props.friendFooterEnabled
	local hasInGameFriends = p8.props.hasInGameFriends
	local var57 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p8.props.inGameUserIds else nil
	local var58 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p8.getSortedFriends(p8.props.users, p8.props.inGameUsersByGame)
	local var59 = friendFooterEnabled
	
	if var59 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var59 = var57
			
			if var59 then
				var59 = #var57 > 0
				var59 = nil
			end
		else
			var59 = hasInGameFriends
		end
	end
	local ageRatingText
	local var60 = p8.props.friendVisits and #p8.props.friendVisits > 0
	local _ = nil
	local footerLayoutData = p8.props.footerLayoutData
	
	if footerLayoutData == nil then
		ageRatingText = nil
	elseif footerLayoutData.type == "TextLabel" then
		local text = footerLayoutData.text
		ageRatingText = if text == nil then nil else text.textLiteral
	else
		ageRatingText = nil
	end
	local var61 = if fFlagLuaAppGenreRatingFooter then var48(p8.props.footerLayoutData) else nil
	local var62 = false
	
	if (p8.props.isHovered or (if fFlagLuaAppGameTileSelectionVideoPlayback then p8.props.isSelected else p8.state.isSelected)) and (p8.props.ageRatingText and not p8.props.hidePlayButton) then
		ageRatingText = p8.props.ageRatingText
		var62 = true
	end
	local var63 = ageRatingText ~= nil
	local var64 = if fFlagLuaAppGenreRatingFooter then var61 ~= nil else nil
	local entry = p8.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p8.props.isSponsoredFooterAllowed or p8.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p8.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p8.props.useExperienceTileMetadata and (isShowSponsoredLabel or var63 or fFlagLuaAppGenreRatingFooter and var64) or fFlagLuaAppNarrowTileSmallerFooterFont and p8.props.compactMetadataFormat then
		var56 = false
	end
	local var66 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = p8.props.totalUpVotes,
			totalDownVotes = p8.props.totalDownVotes,
			playerCount = if p8.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p8.props.entry.playerCount else nil
		},
		isGridTile = p8.props.useGridTile,
		hideGameStats = p8.props.hideGameStats,
		useLargerFont = var56,
		gameTileLayoutType = p8.props.gameTileLayoutType,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p8.props.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p8.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p8.props.hidePlayerCount else nil
	})
	
	if p8.props.hideMetadata then
		return if p8.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var56,
			onActivateSponsoredTooltip = p8.onActivateSponsoredTooltip,
			gameTileLayoutType = p8.props.gameTileLayoutType,
			isNarrowScreenXSmall = p8.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p8.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p8.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var66
		}) elseif var62 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var56
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var56,
			onActivateSponsoredTooltip = p8.onActivateSponsoredTooltip,
			gameTileLayoutType = p8.props.gameTileLayoutType,
			isNarrowScreenXSmall = p8.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p8.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p8.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var66
		}) elseif fFlagLuaAppGenreRatingFooter and var64 and not var62 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var56,
			totalUpVotes = p8.props.totalUpVotes,
			totalDownVotes = p8.props.totalDownVotes,
			genreText = var61
		}) elseif var63 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var56
		}) elseif var59 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var56,
			friendUserIds = var57,
			onFriendFooterActivated = p8.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var58,
			useLargerFont = var56
		}) elseif p8.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p8.props.friendVisitedString,
			iconSize = if var56 then 32 else 24,
			useLargerFont = var56
		}) elseif var60 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p8.getVisitedFriends(),
			useLargerFont = var56
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p8.getVisitedFriends(),
			useLargerFont = var56
		}) else var66
	end
end

function appGameTile.renderContent(p9, p10, p11, _) --[[ line: 781 ]]
	-- upvalues: gameTileConstantsModule (ref), gameTileViewConfigModule (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), gameTileVideoThumbnailModule (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameDetailsAttributionFix (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppGameTileInteractionFeedback (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), luaAppStabilizeVideoTileReactRoot (ref)
	local size = p9.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p9.props.imageThumbnail
	local onGameTileActivated = p9.props.onGameTileActivated
	local var68 = if p9.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p9.props.isHovered and p9.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p9.props.gameTileLayoutType)
	local var70 = p9:renderGridTilesFooter()
	local var71 = if p9.props.hideTitle then nil else p9.props.name
	local var72 = if var68 then reactModule.createElement(gameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p9.props.entry.playerCount
		}
	}) else nil
	local isHidden = p9.props.isHidden
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		ZIndex = p9.props.ZIndex,
		LayoutOrder = p9.props.layoutOrder,
		ref = p9.gameTileRef
	}, {
		Tile = reactModule.createElement(gameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p9.props.SelectionOrder,
			Selectable = not isHidden,
			hoverPadding = if fFlagLuaAppMigrateGameTileHoverFixes or p9.props.useGridTile then nil else p11.Tokens.Size.Size_200,
			numLinesForTitle = p9.props.contentTextLineCount,
			numLinesForMetadata = p9.props.metadataTextLineCount,
			imageAspectRatio = imageAspectRatio,
			isContained = p9.props.isContained,
			containmentSidePadding = gameTileViewConfigModule.getContainmentSidePadding(p11.Tokens, p9.props.gameTileLayoutType, p9.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p9.props.onTileImageLoaded else nil,
			thumbnailComponent = if p9.props.isHidden then reactModule.createElement(hiddenTileContentModule, {
				appPage = p9.props.appPage,
				collectionId = p9.props.topicId,
				setGameHidden = p9.props.setGameHidden,
				universeId = p9.props.universeId,
				parentRef = p9.props.hoverRef,
				isSponsored = p9.props.entry.isSponsored
			}) elseif p9.props.videoThumbnail then reactModule.createElement(gameTileVideoThumbnailModule, {
				looped = true,
				ZIndex = -2,
				video = p9.props.videoThumbnail,
				image = imageThumbnail,
				playing = p9.props.isVideoPlaying,
				Size = UDim2.fromScale(1, 1),
				isTileContained = p9.props.isContained,
				cornerRadius = p11.Tokens.Size.Size_200,
				onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 830 ]]
					-- upvalues: onGameTileActivated (ref), p9 (ref)
					onGameTileActivated(p9.isMounted)
				end else p9.onActivated else nil,
				itemIndex = p9.props.index,
				videoAnalytics = p9.props.videoAnalytics,
				universeId = p9.props.universeId,
				videoPlaybackCoordinator = if p9.props.videoPlaybackContext then p9.props.videoPlaybackContext.videoPlaybackCoordinator else nil
			}) else nil,
			title = if isHidden then nil else var71,
			isDisabled = if isHidden then true else p9.props.isDisabled,
			onActivated = if fFlagLuaAppGameDetailsAttributionFix and not isHidden then function() --[[ line: 918 ]]
				-- upvalues: onGameTileActivated (ref), p9 (ref)
				onGameTileActivated(p9.isMounted)
			end else p9.onActivated,
			onGuiStateChanged = if fFlagLuaAppGameTileInteractionFeedback then p9.props.onGuiStateChanged else nil,
			onSelectionGained = p9.onSelectionGained,
			onSelectionLost = p9.onSelectionLost,
			onTouchLongPress = if not isHidden then p9.onTouchLongPress else nil,
			reducedMotion = p10,
			isHovered = if isHidden then false else p9.props.isHovered,
			forwardRef = p9.props.hoverRef,
			hidePlayButton = if isHidden then true else p9.props.hidePlayButton,
			hoverActionRow = if p9.props.hidePlayButton or isHidden then nil else reactModule.createElement(appExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p9.props.navigationUniverseId,
				referralSource = p9.props.referralSource,
				reportExperienceLaunched = p9.reportExperienceLaunchedFromActionBar,
				openGameDetails = if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 937 ]]
					-- upvalues: onGameTileActivated (ref), p9 (ref)
					onGameTileActivated(p9.isMounted)
				end else p9.onActivated,
				entry = p9.props.entry,
				launchExperienceEventContext = p9.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p9.props.index,
				height = gameTileViewConfigModule.getElementSizes(p11.Tokens, p9.props.textSizeOffset, p9.props.contentTextLineCount, p9.props.foundationTokens, true).playButtonHeight,
				showButtonText = imageAspectRatio > 1,
				isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p9.props.entry.placeIdOverride,
				launchDataOverride = p9.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if isHidden then nil elseif not p9.props.isVideoPlaying then if p9.props.tileBadges then roactModule.createFragment({
				SocialFeaturePill = var72,
				Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p9.props.tileBadges })
			}) else var72 else nil,
			overflowMenu = if next(p9.props.availableMenuItems) == nil or not p9.props.isHovered and not p9.props.overflowMenuOpen and not (if fFlagLuaAppGameTileSelectionVideoPlayback then p9.props.isSelected else p9.state.isSelected) or isHidden then nil else reactModule.createElement(gameTileOverflowMenuModule, {
				isHovered = p9.props.isHovered,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p9.props.isSelected else p9.state.isSelected,
				universeId = p9.props.universeId,
				collectionId = p9.props.topicId,
				appPage = p9.props.appPage,
				setGameHidden = p9.props.setGameHidden,
				menuKey = p9.props.hoverKey,
				menuOpen = p9.props.overflowMenuOpen,
				onMenuOpenChanged = p9.onMenuOpenChanged,
				parentRef = p9.props.hoverRef,
				isSponsored = p9.props.entry.isSponsored,
				payerName = p9.props.entry.payerName,
				sponsoredUserCohort = p9.props.sponsoredUserCohort,
				adId = if fFlagLuaAppEnableSponsoredReportAd then p9.props.entry.adId else nil,
				availableMenuItems = p9.props.availableMenuItems
			}),
			footerMetadata = if isHidden then nil else var70,
			textSizeOffset = p9.props.textSizeOffset,
			hideMetadata = p9.props.hideMetadata
		}),
		VideoPlaybackDetector = if luaAppStabilizeVideoTileReactRoot then p9.props.videoPlaybackDetector else nil
	})
end

function appGameTile.render(p12) --[[ line: 967 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), withStyle (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p12.props.game == nil then nil else withStyle(function(p13) --[[ line: 977 ]]
		-- upvalues: p12 (ref)
		return p12:renderContent(p13.Settings.ReducedMotion, p13, p12.props.foundationTokens)
	end)
end

function appGameTile.didMount(p14) --[[ line: 983 ]]
	-- upvalues: impressionsTagUtility (ref)
	p14.isMounted = true
	impressionsTagUtility.AddTag(p14.gameTileRef, p14.props.impressionsTag, p14.props.index)
	
	if not p14.props.useGridTile and p14.props.friendFooterEnabled and p14.props.hasInGameFriends then
		p14:setState({ canDisplayFriendFooter = true })
	end
	if p14.props.useGridTile then
		p14.loadWideThumbnail()
	end
end

function appGameTile.willUnmount(p15) --[[ line: 998 ]]
	-- upvalues: impressionsTagUtility (ref)
	p15.isMounted = false
	impressionsTagUtility.RemoveTag(p15.gameTileRef, p15.props.impressionsTag, p15.props.index)
end

function appGameTile.didUpdate(p16, p17) --[[ line: 1003 ]]
	-- upvalues: impressionsTagUtility (ref)
	if p17.impressionsTag ~= p16.props.impressionsTag or p17.index ~= p16.props.index then
		impressionsTagUtility.RemoveTag(p16.gameTileRef, p17.impressionsTag, p17.index)
		impressionsTagUtility.AddTag(p16.gameTileRef, p16.props.impressionsTag, p16.props.index)
	end
	if p16.props.useGridTile and p17.universeId ~= p16.props.universeId then
		p16.loadWideThumbnail()
	end
	if not p16.props.useGridTile and (p17.friendFooterEnabled ~= p16.props.friendFooterEnabled or p17.hasInGameFriends ~= p16.props.hasInGameFriends) and (p16.props.friendFooterEnabled and p16.props.hasInGameFriends) then
		p16:setState({ canDisplayFriendFooter = true })
	end
end

local _ = function(p18, p19) --[[ line: 1028 | named "formatRating" ]]
	return if p18 + p19 == 0 then "--" else tostring(math.floor(p18 / (p18 + p19) * 100 + 0.5)) .. "%"
end

appGameTile = roactRoduxModule.connect(function(p20, p21) --[[ line: 1036 ]]
	-- upvalues: fFlagLuaAppGameDetailsAttributionFix (ref), gameInfosReducer (ref), gameTileConstantsModule (ref), getGameTileLayoutDataModule (ref), gameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var43 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref), luaAppUseRatingFormatHelper2 (ref), formatExperienceRatingModule (ref), fFlagLuaAppHomeReduceRenders (ref), t (ref)
	local universeId = p21.entry.universeId
	local var73 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var73 = if p21.entry.navigationUniverseId and p21.entry.navigationUniverseId ~= "" and p21.entry.navigationUniverseId ~= "0" then p21.entry.navigationUniverseId else p21.entry.universeId
	end
	local var81
	local var74 = p20.Personalization[gameInfosReducer.key][universeId]
	local var75 = if var74 then var74.totalUpVotes else 0
	local var76 = if var74 then var74.totalDownVotes else 0
	local var77 = if var74 then var74.friendActivityTitle else nil
	local _ = nil
	local var78 = nil
	local var79 = if var74 then var74.minimumAge else 0
	local var80 = if var74 then var74.ageRecommendationDisplayName else ""
	local _ = nil
	
	if p21.gameTileLayoutType == "Event" then
		local _ = p21.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p21.gameTileLayoutType == "Wide" then
		var81 = p21.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var81 = nil
	else
		var81 = false
	end
	local var82
	if var81 or p21.forceHideAgeRatings then
		var82 = false
	elseif var79 == 0 or var80 == "" then
		var82 = false
	else
		var82 = true
		var78 = var80
	end
	local var86, var85
	local var83 = getGameTileLayoutDataModule(var74, p21.topicId)
	local _ = nil
	local var84 = if p20[gameIconReducer.key][universeId] then p20[gameIconReducer.key][universeId].url else nil
	local _ = nil
	
	if fFlagLuaAppHomeThumbnailPrefetch then
		local function _(p22) --[[ line: 1094 | named "resolveThumbnail" ]]
			-- upvalues: var43 (copy), var84 (ref), universeId (ref), p21 (ref), var74 (ref)
			return var43({
				iconUrl = var84,
				universeId = universeId,
				placeId = p21.entry.placeId,
				useGridTile = p22,
				perEntryWideAssetId = p21.entry.primaryWideImageAssetId,
				game = var74,
				topicId = p21.topicId
			})
		end
		
		var86 = var43({
			iconUrl = var84,
			universeId = universeId,
			placeId = p21.entry.placeId,
			useGridTile = p21.useGridTile == true,
			perEntryWideAssetId = p21.entry.primaryWideImageAssetId,
			game = var74,
			topicId = p21.topicId
		})
		var85 = if p21.useGridTile then var86 else var43({
			useGridTile = true,
			iconUrl = var84,
			universeId = universeId,
			placeId = p21.entry.placeId,
			perEntryWideAssetId = p21.entry.primaryWideImageAssetId,
			game = var74,
			topicId = p21.topicId
		})
	else
		var85 = formatExperienceThumbnailModule((if p21.entry.primaryWideImageAssetId then p21.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var83)) or (if var74 then var74.primaryWideAssetId else nil), p21.entry.placeId)
		var86 = if p21.useGridTile then var85 else formatExperienceIconModule(var84, universeId)
	end
	local var87 = if p21.entry.primaryWideVideoAssetId then p21.entry.primaryWideVideoAssetId else var83 and (var83.primaryMediaAsset and var83.primaryMediaAsset.wideVideoAssetId)
	
	return {
		game = var74,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var73 else nil,
		name = if var83 then var83.title elseif var74 then var74.name else "",
		totalUpVotes = var75,
		totalDownVotes = var76,
		imageThumbnail = var86,
		wideThumbnail = var85,
		videoThumbnail = if var87 then `rbxassetid://{var87}` else nil,
		friendActivityTitle = var77,
		rating = if p21.useHoverTile or p21.useExperienceTileMetadata then if luaAppUseRatingFormatHelper2 then formatExperienceRatingModule(var75, var76, nil, true) elseif var75 + var76 == 0 then "--" else tostring(math.floor(var75 / (var75 + var76) * 100 + 0.5)) .. "%" else nil,
		showAgeRating = var82,
		ageRatingText = var78,
		friendVisits = if var74 then var74.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var74 and var74.friendVisitedString ~= "" then var74.friendVisitedString else nil,
		hidePlayButton = var81,
		footerLayoutData = if var83 then var83.footer else nil
	}
end, function(p23) --[[ line: 1157 ]]
	-- upvalues: openCentralOverlayForPlacesListModule (ref), openSponsoredTooltipModule (ref)
	return {
		openContextualMenu = function(p24, p25, p26) --[[ line: 1159 ]]
			-- upvalues: p23 (ref), openCentralOverlayForPlacesListModule (copy)
			p23(openCentralOverlayForPlacesListModule(p24, p25, p26))
		end,
		openSponsoredTooltip = function(p27) --[[ line: 1162 ]]
			-- upvalues: p23 (ref), openSponsoredTooltipModule (copy)
			return p23(openSponsoredTooltipModule(p27))
		end
	}
end)(appGameTile)

if not fFlagLuaAppGameDetailsAttributionFix then
	appGameTile = roactServices.connect({ networking = roactNetworking })(appGameTile)
end
local var49 = function(p28) --[[ line: 1174 ]]
	-- upvalues: reactModule (ref), useTokens (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), luaAppStabilizeVideoTileReactRoot (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), fFlagLuaAppTileVideoDeviceMemoryBlocking (ref), appGameTile (write), cryoModule (ref)
	local var88 = reactModule.useRef(nil)
	local var89 = useTokens()
	local useHoverTile = p28.useHoverTile
	local var90 = `{p28.impressionsTag or ""}_{p28.index or "0"}_{p28.gameTileLayoutType or "Narrow"}`
	
	if p28.impressionsTag == nil or p28.index == nil then
		useHoverTile = false
	end
	var90 = useIsHoveredTileModule(var88, var90, useHoverTile)
	local var91 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var92 = if var91 then true else p28.useHoverTile
	local var93 = if p28.useExperienceTileMetadata ~= nil then var91 else p28.useExperienceTileMetadata
	local var94 = useValidTileBadgesModule(p28.entry.universeId, p28.topicId, p28.badgeOverride)
	local var95 = useSelector(function(p29) --[[ line: 1197 ]]
		return p29.LocalUserId
	end)
	local var96 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p30) --[[ line: 1203 ]]
		return p30.Users
	end) else nil
	local var97 = useSelector(function(p31) --[[ line: 1208 ]]
		-- upvalues: p28 (ref)
		return p31.InGameUsersByGame[p28.entry.universeId]
	end)
	local var98 = useHasInGameFriendsModule(var95, var96, var97)
	local var99 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useInGameUserIdsModule(var95, var97) else nil
	local var100, var101 = reactModule.useState(false)
	local var102 = nil
	local _ = nil
	local var103 = nil
	local var104 = nil
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		local var105, var106 = reactModule.useState(false)
		var102 = var105
		local var107 = var106
		var103 = reactModule.useCallback(function(p32, p33, p34) --[[ line: 1225 ]]
			-- upvalues: var107 (write), p28 (ref)
			var107(true)
			
			if p28.onSelectionGained then
				p28.onSelectionGained(p32, p33, p34)
			end
		end, { p28.onSelectionGained })
		var104 = reactModule.useCallback(function() --[[ line: 1233 ]]
			-- upvalues: var107 (write), p28 (ref)
			var107(false)
			
			if p28.onSelectionLost then
				p28.onSelectionLost()
			end
		end, { p28.onSelectionLost })
	end
	if fFlagLuaAppFixHiddenTileVideoCleanup then
		reactModule.useEffect(function() --[[ line: 1243 ]]
			-- upvalues: p28 (ref), var101 (ref)
			if p28.isHidden then
				var101(false)
			end
		end, { p28.isHidden })
	end
	local var108 = nil
	local var109 = nil
	local var110 = nil
	local var111 = nil
	
	if fFlagLuaAppGameDetailsAttributionFix then
		var108 = useRoactService(roactNetworking)
		var109 = if p28.entry.navigationUniverseId and p28.entry.navigationUniverseId ~= "" and p28.entry.navigationUniverseId ~= "0" then p28.entry.navigationUniverseId else p28.entry.universeId
		var111 = reactModule.useCallback(function() --[[ line: 1264 ]]
			-- upvalues: p28 (ref), sponsoredGamesRecordClick (copy), var108 (write)
			local entry = p28.entry
			
			if entry.isSponsored then
				sponsoredGamesRecordClick(var108, entry.adId)
			end
		end, { var108, p28.entry.isSponsored, p28.entry.adId })
		var110 = reactModule.useCallback(function(p35) --[[ line: 1273 ]]
			-- upvalues: p28 (ref), hoverTileCoordinatorModule (copy), videoEndReasonModule (copy), var109 (write), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var111 (write)
			if p28.isHovered then
				hoverTileCoordinatorModule.default:reset()
			end
			if p28.videoPlaybackContext and p28.videoPlaybackContext.videoPlaybackCoordinator then
				p28.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var109, nil)
			else
				videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var109, nil)
			end
			if p35 then
				if fFlagLuaAppGameTileInteractionFeedback and p28.onActivated then
					p28.onActivated()
				end
				local t = {
					source = p28.source,
					index = p28.index,
					referralSource = p28.referralSource,
					onPeekViewClosed = p28.onPeekViewClosed,
					placeIdOverride = p28.entry.placeIdOverride,
					experienceJoinData = {
						launchData = if p28.entry.launchDataOverride then p28.entry.launchDataOverride else nil,
						tileType = p28.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						nativeAdData = p28.entry.adId
					}
				}
				
				if getFFlagEnableNavigationPerformanceIntervals() then
					intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
				end
				p28.navigateToGameDetails(var109, t)
				p28.reportGameDetailOpened(p28.index, var109)
				var111()
			end
		end, {
			p28.isHovered, p28.index, p28.videoAnalytics, p28.onActivated, p28.source,
			p28.referralSource, p28.onPeekViewClosed, p28.navigateToGameDetails,
			p28.reportGameDetailOpened, var109, var111, p28.entry.placeIdOverride,
			p28.entry.launchDataOverride,
			if p28.videoPlaybackContext then p28.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	end
	local var112 = useOverflowMenuOpen(var90)
	local var113 = useTriggerFeedback()
	local var114 = reactModule.useMemo(function() --[[ line: 1342 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p28 (ref), fFlagLuaAppEnableSponsoredReportAd (copy)
		return getAvailableGameTileOverflowMenuItemsModule({
			isSponsored = p28.entry.isSponsored,
			enableExplicitFeedback = p28.enableExplicitFeedback,
			enableSponsoredFeedback = p28.enableSponsoredFeedback,
			enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p28.enableReportAd else nil
		})
	end, {
		p28.entry.isSponsored,
		p28.enableExplicitFeedback,
		p28.enableSponsoredFeedback,
		if fFlagLuaAppEnableSponsoredReportAd then p28.enableReportAd else nil
	})
	local var115 = nil
	
	if luaAppStabilizeVideoTileReactRoot then
		local var116 = if p28.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p28.entry.universeId, p28.topicId) else true
		useTagAsViewportAutoplayCandidate(var88, p28.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var116 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p28.isHidden else nil)
		local var117 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
		
		if var116 and not p28.isHidden then
			local var120
			local createElement = reactModule.createElement
			local var118 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var90,
				itemIndex = p28.index,
				universeId = p28.entry.universeId,
				tileRef = var88,
				isHoverSupported = useHoverTile,
				isHovered = var90,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var102 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var120 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var120 = var117 == responsiveModule.Input.Touch
				var120 = nil
			else
				var120 = nil
			end
			t.autoplay = var120
			t.onPlaybackChange = var101
			t.videoAnalytics = p28.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p28.hasPrevalidatedVideoGamePlayability else nil
			t.pageContext = if fFlagLuaAppTileVideoDeviceMemoryBlocking then p28.appPage else nil
			t.videoPlaybackContext = p28.videoPlaybackContext
			var115 = createElement(var118, t)
		else
			var115 = nil
		end
	end
	local var121 = reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p28, {
		useExperienceTileMetadata = var93,
		hasBackground = var92,
		hoverRef = var88,
		isHoverSupported = useHoverTile,
		isHovered = var90,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var102 else nil,
		isVideoPlaying = var100,
		tileBadges = var94,
		foundationTokens = var89,
		users = var96,
		inGameUsersByGame = var97,
		hasInGameFriends = var98,
		inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var99 else nil,
		networking = if fFlagLuaAppGameDetailsAttributionFix then var108 else nil,
		navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var109 else nil,
		onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var110 else nil,
		recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var111 else nil,
		overflowMenuOpen = var112,
		hoverKey = var90,
		triggerFeedback = var113,
		availableMenuItems = var114,
		onSelectionGained = if fFlagLuaAppGameTileSelectionVideoPlayback then var103 else p28.onSelectionGained,
		onSelectionLost = if fFlagLuaAppGameTileSelectionVideoPlayback then var104 else p28.onSelectionLost,
		videoPlaybackDetector = if luaAppStabilizeVideoTileReactRoot then var115 else nil
	}))
	
	if luaAppStabilizeVideoTileReactRoot then
		return var121
	end
	local var122 = if p28.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p28.entry.universeId, p28.topicId) else true
	useTagAsViewportAutoplayCandidate(var88, p28.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var122 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p28.isHidden else nil)
	local var123 = if not fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil else nil
	
	if not var122 or p28.isHidden then
		return var121
	end
	local var128
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local t = {}
	local t_1 = { GameTile = var121 }
	local createElement_1 = reactModule.createElement
	local var126 = gameVideoPlaybackDetectorModule
	local t_2 = {
		videoKey = var90,
		itemIndex = p28.index,
		universeId = p28.entry.universeId,
		tileRef = var88,
		isHoverSupported = useHoverTile,
		isHovered = var90,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var102 else nil
	}
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		var128 = nil
	elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
		var128 = var123 == responsiveModule.Input.Touch
		var128 = nil
	else
		var128 = nil
	end
	t_2.autoplay = var128
	t_2.onPlaybackChange = var101
	t_2.videoAnalytics = p28.videoAnalytics
	t_2.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
	t_2.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
	t_2.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p28.hasPrevalidatedVideoGamePlayability else nil
	t_2.pageContext = if fFlagLuaAppTileVideoDeviceMemoryBlocking then p28.appPage else nil
	t_2.videoPlaybackContext = p28.videoPlaybackContext
	t_1.VideoPlaybackDetector = createElement_1(var126, t_2)
	
	return createElement(fragment, t, t_1)
end

return if fFlagSignalsNavP3fGameDetails then reactModule.memo(var49) else var49