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
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
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
local fFlagLuaAppHomeUnifiedVideoEngagementEvents = require(parent.SharedFlags).FFlagLuaAppHomeUnifiedVideoEngagementEvents
local fFlagLuaAppGameDetailsAttributionFix = require(parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local luaAppUseRatingFormatHelper2 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local fFlagLuaAppGameTileOverflowMenuTelemetry = require(parent.SharedFlags).FFlagLuaAppGameTileOverflowMenuTelemetry
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableWhyThisAdModal = require(parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppSupportSponsoredExplicitFeedback = require(parent.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppTileVideoDeviceMemoryBlocking = require(parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local fFlagLuaAppFixTwoByOneOverflowMenuTelemetry = require(parent.SharedFlags).FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local luaAppStabilizeVideoTileReactRoot = game:DefineFastFlag("LuaAppStabilizeVideoTileReactRoot", false)
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppGenreRatingFooter = require(parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local getAvailableGameTileOverflowMenuItemsModule = require(gameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _() --[[ line: 137 | named "getHoverDelay" ]]
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
	onSelectionGained = tModule.optional(tModule.callback),
	onSelectionLost = tModule.optional(tModule.callback),
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
	videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then tModule.optional(tModule.table) else nil,
	SelectionOrder = tModule.optional(tModule.number),
	enableExplicitFeedback = tModule.optional(tModule.boolean),
	setGameHidden = tModule.optional(tModule.callback),
	appPage = tModule.optional(tModule.string),
	isHidden = tModule.optional(tModule.boolean),
	isNarrowScreenXSmall = tModule.optional(tModule.boolean),
	onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then tModule.optional(tModule.callback) else nil,
	sponsoredUserCohort = if fFlagLuaAppEnableWhyThisAdModal then tModule.optional(tModule.string) else nil,
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

function appGameTile.init(p0) --[[ line: 265 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), fFlagLuaAppGameTileOverflowMenuTelemetry (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppFixTwoByOneOverflowMenuTelemetry (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppGameDetailsAttributionFix (ref), hoverTileCoordinatorModule (ref), fFlagLuaAppHomeTouchAutoplay (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), roactModule (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), sponsoredGamesRecordClick (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), responsiveModule (ref), contentProviderService (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), memoize (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileInit()
	end
	p0.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = false
	}
	p0.onMenuOpenChanged = if fFlagLuaAppGameTileOverflowMenuTelemetry then function(p1, p2) --[[ line: 277 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), gameTileOverflowMenuAction (copy), fFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.props.appPage,
			universeId = p0.props.universeId,
			sortId = p0.props.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.props.appPage or (if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then "Unknown" else nil) else nil)
	end else nil
	
	function p0.onTouchLongPress() --[[ line: 297 ]]
		-- upvalues: p0 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), fFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), getOverflowMenuSignalStore (copy), fFlagLuaAppGameTileOverflowMenuTelemetry (copy)
		if next(p0.props.availableMenuItems) ~= nil then
			if p0.props.triggerFeedback and not p0.props.overflowMenuOpen then
				p0.props.triggerFeedback("TileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.props.appPage or (if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then "Unknown" else nil) else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = p0.props.universeId,
					sortId = p0.props.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(p0.props.hoverKey)
			
			if fFlagLuaAppGameTileOverflowMenuTelemetry then
				local t = {}
				
				for i, v in p0.props.availableMenuItems do
					table.insert(t, i)
				end
				p0.onMenuOpenChanged(false, table.concat(t, ","))
			end
		end
	end
	
	function p0.reportExperienceLaunchedFromActionBar(...) --[[ line: 331 ]]
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p0 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppHomeTouchAutoplay (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy)
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
		if fFlagLuaAppHomeTouchAutoplay and p0.props.videoPlaybackContext and p0.props.videoPlaybackContext.videoPlaybackCoordinator then
			p0.props.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
			
			return
		end
		videoPlaybackCoordinator.default:reset(videoEndReasonModule.ExperienceLaunched, nil, p0.props.navigationUniverseId, nil)
	end
	
	function p0.renderAppExperienceActionRow(_) --[[ line: 368 ]]
		-- upvalues: roactModule (copy), appExperienceActionRowModule (copy), p0 (ref), fFlagLuaAppGameDetailsAttributionFix (copy), fFlagLuaAppUnifyPlayButtonTile (copy)
		return roactModule.createElement(appExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p0.props.navigationUniverseId,
			referralSource = p0.props.referralSource,
			reportExperienceLaunched = p0.reportExperienceLaunchedFromActionBar,
			openGameDetails = if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 375 ]]
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
	
	function p0.onHoverChanged(p3) --[[ line: 389 ]]
		-- upvalues: p0 (ref)
		if p3 and p0.props.triggerFeedback then
			p0.props.triggerFeedback("Default", "Hover")
		end
		p0:setState({ isHovered = p3 })
	end
	
	p0.gameTileRef = roactModule.createRef()
	
	function p0.getTilePosition() --[[ line: 401 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p0.getTileSize() --[[ line: 409 ]]
		-- upvalues: p0 (ref)
		return if p0.gameTileRef.current then p0.gameTileRef.current.AbsoluteSize else nil
	end
	
	p0.recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 419 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy)
		local networking = p0.props.networking
		local entry = p0.props.entry
		
		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	p0.onActivated = if fFlagLuaAppGameDetailsAttributionFix then nil else function() --[[ line: 430 ]]
		-- upvalues: p0 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppHomeTouchAutoplay (copy), videoEndReasonModule (copy), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy)
		if p0.props.isHovered then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppHomeTouchAutoplay and p0.props.videoPlaybackContext and p0.props.videoPlaybackContext.videoPlaybackCoordinator then
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
	
	function p0.onFriendFooterActivated() --[[ line: 491 ]]
		-- upvalues: p0 (ref)
		if p0.isMounted then
			p0.props.openContextualMenu(p0.props.game, p0.getTileSize(), p0.getTilePosition())
		end
	end
	
	function p0.onActivateSponsoredTooltip() --[[ line: 499 ]]
		-- upvalues: p0 (ref), responsiveModule (copy)
		if p0.isMounted then
			p0.props.openSponsoredTooltip(responsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p0.loadWideThumbnail() --[[ line: 507 ]]
		-- upvalues: p0 (ref), contentProviderService (copy)
		local wideThumbnail = p0.props.wideThumbnail
		
		if wideThumbnail ~= nil then
			task.spawn(function() --[[ line: 510 ]]
				-- upvalues: contentProviderService (copy), wideThumbnail (ref)
				contentProviderService:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	
	function p0.getVisitedFriends() --[[ line: 516 ]]
		-- upvalues: p0 (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t = {}
		local friendVisits = p0.props.friendVisits
		
		for i = 1, #friendVisits do
			local var51 = tostring(friendVisits[i].userId)
			
			if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t, var51)
			elseif p0.props.users and p0.props.users[var51] then
				table.insert(t, {
					userId = var51,
					displayName = p0.props.users[var51].displayName
				})
			end
		end
		return t
	end
	
	p0.getSortedFriends = memoize(function(p4, p5) --[[ line: 544 ]]
		-- upvalues: sortFriendsByPresenceAndRecencyFactoryModule (copy)
		if not p4 or not p5 then
			return {}
		end
		local t = {}
		
		for i, v in pairs(p5) do
			local var53 = p4[v]
			
			if var53 and var53.isFriend then
				table.insert(t, { userId = var53.id, displayName = var53.displayName })
			end
		end
		table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
		
		return t
	end)
	
	function p0.onSelectionGained() --[[ line: 566 ]]
		-- upvalues: p0 (ref)
		p0:setState({ isSelected = true })
		
		if p0.props.onSelectionGained then
			p0.props.onSelectionGained(p0.props.entry, p0.props.index, p0.props.navigationUniverseId)
		end
	end
	
	function p0.onSelectionLost() --[[ line: 574 ]]
		-- upvalues: p0 (ref)
		p0:setState({ isSelected = false })
		
		if p0.props.onSelectionLost then
			p0.props.onSelectionLost()
		end
	end
end

local _ = function(p6) --[[ line: 586 | named "getTextLiteralForTextFooter" ]]
	if p6 == nil then
		return nil
	elseif p6.type ~= "TextLabel" then
		return nil
	end
	local text = p6.text
	
	return if text == nil then nil else text.textLiteral
end

local var47 = if fFlagLuaAppGenreRatingFooter then function(p7) --[[ line: 602 ]]
	if p7 == nil then
		return nil
	elseif p7.type ~= "RatingWithGenre" then
		return nil
	end
	local genre = p7.genre
	
	return if genre == nil then nil else genre.textLiteral
end else nil

function appGameTile.renderGridTilesFooter(p8) --[[ line: 617 ]]
	-- upvalues: fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), fFlagLuaAppGenreRatingFooter (ref), var47 (write), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), roactModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), reactModule (ref), gridTileSponsoredFooterModule (ref), gridTileTextFooterModule (ref), ratingWithGenreFooterModule (ref), gridTileFriendFooter (ref), gridTileIconTextFooterModule (ref), images (ref)
	local var54 = p8.props.useHoverTile or p8.props.useExperienceTileMetadata
	local friendFooterEnabled = p8.props.friendFooterEnabled
	local hasInGameFriends = p8.props.hasInGameFriends
	local var55 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p8.props.inGameUserIds else nil
	local var56 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p8.getSortedFriends(p8.props.users, p8.props.inGameUsersByGame)
	local var57 = friendFooterEnabled
	
	if var57 then
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			var57 = var55
			
			if var57 then
				var57 = #var55 > 0
				var57 = nil
			end
		else
			var57 = hasInGameFriends
		end
	end
	local ageRatingText
	local var58 = p8.props.friendVisits and #p8.props.friendVisits > 0
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
	local var59 = if fFlagLuaAppGenreRatingFooter then var47(p8.props.footerLayoutData) else nil
	local var60 = false
	
	if (p8.props.isHovered or p8.state.isSelected) and (p8.props.ageRatingText and not p8.props.hidePlayButton) then
		ageRatingText = p8.props.ageRatingText
		var60 = true
	end
	local var61 = ageRatingText ~= nil
	local var62 = if fFlagLuaAppGenreRatingFooter then var59 ~= nil else nil
	local entry = p8.props.entry
	local isShowSponsoredLabel = entry.isSponsored and (entry.isShowSponsoredLabel or (p8.props.isSponsoredFooterAllowed or p8.props.isSponsoredRatingFooterAllowed))
	
	if fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p8.props.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow and p8.props.useExperienceTileMetadata and (isShowSponsoredLabel or var61 or fFlagLuaAppGenreRatingFooter and var62) or fFlagLuaAppNarrowTileSmallerFooterFont and p8.props.compactMetadataFormat then
		var54 = false
	end
	local var64 = roactModule.createElement(gameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = p8.props.totalUpVotes,
			totalDownVotes = p8.props.totalDownVotes,
			playerCount = if p8.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p8.props.entry.playerCount else nil
		},
		isGridTile = p8.props.useGridTile,
		hideGameStats = p8.props.hideGameStats,
		useLargerFont = var54,
		gameTileLayoutType = p8.props.gameTileLayoutType,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p8.props.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p8.props.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p8.props.hidePlayerCount else nil
	})
	
	if p8.props.hideMetadata then
		return if p8.props.isHovered then if isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var54,
			onActivateSponsoredTooltip = p8.onActivateSponsoredTooltip,
			gameTileLayoutType = p8.props.gameTileLayoutType,
			isNarrowScreenXSmall = p8.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p8.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p8.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var64
		}) elseif var60 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var54
		}) else nil elseif isShowSponsoredLabel then reactModule.createElement(gridTileSponsoredFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var54,
			onActivateSponsoredTooltip = p8.onActivateSponsoredTooltip,
			gameTileLayoutType = p8.props.gameTileLayoutType,
			isNarrowScreenXSmall = p8.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = p8.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = p8.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = var64
		}) elseif fFlagLuaAppGenreRatingFooter and var62 and not var60 then reactModule.createElement(ratingWithGenreFooterModule, {
			isUnifiedGameTile = true,
			useLargerFont = var54,
			totalUpVotes = p8.props.totalUpVotes,
			totalDownVotes = p8.props.totalDownVotes,
			genreText = var59
		}) elseif var61 then reactModule.createElement(gridTileTextFooterModule, {
			isUnifiedGameTile = true,
			text = ageRatingText,
			useLargerFont = var54
		}) elseif var57 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			useLargerFont = var54,
			friendUserIds = var55,
			onFriendFooterActivated = p8.onFriendFooterActivated
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = var56,
			useLargerFont = var54
		}) elseif p8.props.friendVisitedString then roactModule.createElement(gridTileIconTextFooterModule, {
			icon = images["icons/menu/recent"],
			text = p8.props.friendVisitedString,
			iconSize = if var54 then 32 else 24,
			useLargerFont = var54
		}) elseif var58 then if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friendUserIds = p8.getVisitedFriends(),
			useLargerFont = var54
		}) else roactModule.createElement(gridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p8.getVisitedFriends(),
			useLargerFont = var54
		}) else var64
	end
end

function appGameTile.renderContent(p9, p10, p11, _) --[[ line: 796 ]]
	-- upvalues: gameTileConstantsModule (ref), gameTileViewConfigModule (ref), reactModule (ref), gameStatsModule (ref), hiddenTileContentModule (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (ref), gameTileVideoThumbnailModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppGameDetailsAttributionFix (ref), fFlagLuaAppHomeUnifiedVideoEngagementEvents (ref), fFlagLuaAppHomeTouchAutoplay (ref), roactModule (ref), gameTileThumbnailBadgesModule (ref), gameTileOverflowMenuModule (ref), fFlagLuaAppGameTileOverflowMenuTelemetry (ref), fFlagLuaAppEnableWhyThisAdModal (ref), fFlagLuaAppEnableSponsoredReportAd (ref), gameTileViewModule (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppGameTileInteractionFeedback (ref), appExperienceActionRowModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), luaAppStabilizeVideoTileReactRoot (ref)
	local createElement
	local size = p9.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p9.props.imageThumbnail
	local onGameTileActivated = p9.props.onGameTileActivated
	local var66 = if p9.props.playerCountStyle ~= gameTileConstantsModule.PlayerCountStyleValues.Always then p9.props.isHovered and p9.props.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Hover else true
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(p9.props.gameTileLayoutType)
	local var68 = p9:renderGridTilesFooter()
	local var69 = if p9.props.hideTitle then nil else p9.props.name
	local var70 = if var66 then reactModule.createElement(gameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p9.props.entry.playerCount
		}
	}) else nil
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(p11.Tokens, p9.props.textSizeOffset, p9.props.contentTextLineCount, p9.props.foundationTokens, true).playButtonHeight
	
	if p9.props.isHidden then
		createElement = reactModule.createElement(hiddenTileContentModule, {
			appPage = p9.props.appPage,
			collectionId = p9.props.topicId,
			setGameHidden = p9.props.setGameHidden,
			universeId = p9.props.universeId,
			parentRef = p9.props.hoverRef,
			isSponsored = if fFlagLuaAppSupportSponsoredExplicitFeedback then p9.props.entry.isSponsored else nil
		})
	elseif p9.props.videoThumbnail then
		createElement = reactModule.createElement
		createElement = createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = p9.props.videoThumbnail,
			image = imageThumbnail,
			playing = p9.props.isVideoPlaying,
			Size = UDim2.fromScale(1, 1),
			isTileContained = p9.props.isContained,
			cornerRadius = if fFlagRenameDeprecatedUIBloxTokens then p11.Tokens.Size.Size_200 else p11.Tokens.Global.Space_100,
			onActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 847 ]]
				-- upvalues: onGameTileActivated (ref), p9 (ref)
				onGameTileActivated(p9.isMounted)
			end else p9.onActivated else nil,
			itemIndex = p9.props.index,
			videoAnalytics = p9.props.videoAnalytics,
			universeId = if fFlagLuaAppHomeUnifiedVideoEngagementEvents then p9.props.universeId else nil,
			videoPlaybackCoordinator = if fFlagLuaAppHomeTouchAutoplay and p9.props.videoPlaybackContext then p9.props.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	else
		createElement = nil
	end
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
			hoverPadding = if fFlagLuaAppMigrateGameTileHoverFixes or p9.props.useGridTile then nil elseif fFlagRenameDeprecatedUIBloxTokens then p11.Tokens.Size.Size_200 else p11.Tokens.Global.Space_100,
			numLinesForTitle = p9.props.contentTextLineCount,
			numLinesForMetadata = p9.props.metadataTextLineCount,
			imageAspectRatio = imageAspectRatio,
			isContained = p9.props.isContained,
			containmentSidePadding = gameTileViewConfigModule.getContainmentSidePadding(p11.Tokens, p9.props.gameTileLayoutType, p9.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p9.props.onTileImageLoaded else nil,
			thumbnailComponent = createElement,
			title = if isHidden then nil else var69,
			isDisabled = if isHidden then true else p9.props.isDisabled,
			onActivated = if fFlagLuaAppGameDetailsAttributionFix and not isHidden then function() --[[ line: 933 ]]
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
				openGameDetails = if fFlagLuaAppGameDetailsAttributionFix then function() --[[ line: 952 ]]
					-- upvalues: onGameTileActivated (ref), p9 (ref)
					onGameTileActivated(p9.isMounted)
				end else p9.onActivated,
				entry = p9.props.entry,
				launchExperienceEventContext = p9.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p9.props.index,
				height = playButtonHeight,
				showButtonText = imageAspectRatio > 1,
				isUnifiedGameTileEnabled = if fFlagLuaAppUnifyPlayButtonTile then true else nil,
				placeIdOverride = p9.props.entry.placeIdOverride,
				launchDataOverride = p9.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if isHidden then nil elseif not p9.props.isVideoPlaying then if p9.props.tileBadges then roactModule.createFragment({
				SocialFeaturePill = var70,
				Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = p9.props.tileBadges })
			}) else var70 else nil,
			overflowMenu = if next(p9.props.availableMenuItems) == nil or not p9.props.isHovered and not p9.props.overflowMenuOpen and not p9.state.isSelected or isHidden then nil else reactModule.createElement(gameTileOverflowMenuModule, {
				isHovered = p9.props.isHovered,
				isSelected = p9.state.isSelected,
				universeId = p9.props.universeId,
				collectionId = p9.props.topicId,
				appPage = p9.props.appPage,
				setGameHidden = p9.props.setGameHidden,
				menuKey = p9.props.hoverKey,
				menuOpen = p9.props.overflowMenuOpen,
				onMenuOpenChanged = if fFlagLuaAppGameTileOverflowMenuTelemetry then p9.onMenuOpenChanged else nil,
				parentRef = p9.props.hoverRef,
				isSponsored = if fFlagLuaAppEnableWhyThisAdModal then p9.props.entry.isSponsored else nil,
				payerName = if fFlagLuaAppEnableWhyThisAdModal then p9.props.entry.payerName else nil,
				sponsoredUserCohort = if fFlagLuaAppEnableWhyThisAdModal then p9.props.sponsoredUserCohort else nil,
				adId = if fFlagLuaAppEnableSponsoredReportAd then p9.props.entry.adId else nil,
				availableMenuItems = p9.props.availableMenuItems
			}),
			footerMetadata = if isHidden then nil else var68,
			textSizeOffset = p9.props.textSizeOffset,
			hideMetadata = p9.props.hideMetadata
		}),
		VideoPlaybackDetector = if luaAppStabilizeVideoTileReactRoot then p9.props.videoPlaybackDetector else nil
	})
end

function appGameTile.render(p12) --[[ line: 982 ]]
	-- upvalues: discoveryAppLaunchTracker (ref), withStyle (ref)
	if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
		discoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p12.props.game == nil then nil else withStyle(function(p13) --[[ line: 992 ]]
		-- upvalues: p12 (ref)
		return p12:renderContent(p13.Settings.ReducedMotion, p13, p12.props.foundationTokens)
	end)
end

function appGameTile.didMount(p14) --[[ line: 998 ]]
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

function appGameTile.willUnmount(p15) --[[ line: 1013 ]]
	-- upvalues: impressionsTagUtility (ref)
	p15.isMounted = false
	impressionsTagUtility.RemoveTag(p15.gameTileRef, p15.props.impressionsTag, p15.props.index)
end

function appGameTile.didUpdate(p16, p17) --[[ line: 1018 ]]
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

local _ = function(p18, p19) --[[ line: 1043 | named "formatRating" ]]
	return if p18 + p19 == 0 then "--" else tostring(math.floor(p18 / (p18 + p19) * 100 + 0.5)) .. "%"
end

appGameTile = roactRoduxModule.connect(function(p20, p21) --[[ line: 1051 ]]
	-- upvalues: fFlagLuaAppGameDetailsAttributionFix (ref), gameInfosReducer (ref), gameTileConstantsModule (ref), getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameIconReducer (ref), formatExperienceIconModule (ref), luaAppUseRatingFormatHelper2 (ref), formatExperienceRatingModule (ref), fFlagLuaAppHomeReduceRenders (ref), t (ref)
	local universeId = p21.entry.universeId
	local var71 = nil
	
	if not fFlagLuaAppGameDetailsAttributionFix then
		var71 = if p21.entry.navigationUniverseId and p21.entry.navigationUniverseId ~= "" and p21.entry.navigationUniverseId ~= "0" then p21.entry.navigationUniverseId else p21.entry.universeId
	end
	local var79
	local var72 = p20.Personalization[gameInfosReducer.key][universeId]
	local var73 = if var72 then var72.totalUpVotes else 0
	local var74 = if var72 then var72.totalDownVotes else 0
	local var75 = if var72 then var72.friendActivityTitle else nil
	local _ = nil
	local var76 = nil
	local var77 = if var72 then var72.minimumAge else 0
	local var78 = if var72 then var72.ageRecommendationDisplayName else ""
	local _ = nil
	
	if p21.gameTileLayoutType == "Event" then
		local _ = p21.playButtonStyle ~= gameTileConstantsModule.PlayButtonStyleValues.Enabled
	elseif p21.gameTileLayoutType == "Wide" then
		var79 = p21.playButtonStyle == gameTileConstantsModule.PlayButtonStyleValues.Disabled
		var79 = nil
	else
		var79 = false
	end
	local var80
	if var79 or p21.forceHideAgeRatings then
		var80 = false
	elseif var77 == 0 or var78 == "" then
		var80 = false
	else
		var80 = true
		var76 = var78
	end
	local var81 = getGameTileLayoutDataModule(var72, p21.topicId)
	local var82 = formatExperienceThumbnailModule((if p21.entry.primaryWideImageAssetId then p21.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var81)) or (if var72 then var72.primaryWideAssetId else nil), p21.entry.placeId)
	local var83 = if p21.entry.primaryWideVideoAssetId then p21.entry.primaryWideVideoAssetId else var81 and (var81.primaryMediaAsset and var81.primaryMediaAsset.wideVideoAssetId)
	
	return {
		game = var72,
		universeId = universeId,
		navigationUniverseId = if not fFlagLuaAppGameDetailsAttributionFix then var71 else nil,
		name = if var81 then var81.title elseif var72 then var72.name else "",
		totalUpVotes = var73,
		totalDownVotes = var74,
		imageThumbnail = if p21.useGridTile then var82 else formatExperienceIconModule(if p20[gameIconReducer.key][universeId] then p20[gameIconReducer.key][universeId].url else nil, universeId),
		wideThumbnail = var82,
		videoThumbnail = if var83 then `rbxassetid://{var83}` else nil,
		friendActivityTitle = var75,
		rating = if p21.useHoverTile or p21.useExperienceTileMetadata then if luaAppUseRatingFormatHelper2 then formatExperienceRatingModule(var73, var74, nil, true) elseif var73 + var74 == 0 then "--" else tostring(math.floor(var73 / (var73 + var74) * 100 + 0.5)) .. "%" else nil,
		showAgeRating = var80,
		ageRatingText = var76,
		friendVisits = if var72 then var72.friendVisits elseif fFlagLuaAppHomeReduceRenders then t else {},
		friendVisitedString = if var72 and var72.friendVisitedString ~= "" then var72.friendVisitedString else nil,
		hidePlayButton = var79,
		footerLayoutData = if var81 then var81.footer else nil
	}
end, function(p22) --[[ line: 1154 ]]
	-- upvalues: openCentralOverlayForPlacesListModule (ref), openSponsoredTooltipModule (ref)
	return {
		openContextualMenu = function(p23, p24, p25) --[[ line: 1156 ]]
			-- upvalues: p22 (ref), openCentralOverlayForPlacesListModule (copy)
			p22(openCentralOverlayForPlacesListModule(p23, p24, p25))
		end,
		openSponsoredTooltip = function(p26) --[[ line: 1159 ]]
			-- upvalues: p22 (ref), openSponsoredTooltipModule (copy)
			return p22(openSponsoredTooltipModule(p26))
		end
	}
end)(appGameTile)

if not fFlagLuaAppGameDetailsAttributionFix then
	appGameTile = roactServices.connect({ networking = roactNetworking })(appGameTile)
end
return function(p27) --[[ line: 1171 ]]
	-- upvalues: reactModule (ref), useTokens (ref), useIsHoveredTileModule (ref), useUiModeInfo (ref), uiMode (ref), useValidTileBadgesModule (ref), useSelector (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useHasInGameFriendsModule (ref), useInGameUserIdsModule (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppGameDetailsAttributionFix (ref), useRoactService (ref), roactNetworking (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinatorModule (ref), fFlagLuaAppHomeTouchAutoplay (ref), videoEndReasonModule (ref), videoPlaybackCoordinator (ref), fFlagLuaAppGameTileInteractionFeedback (ref), gameCollectionItemTypes (ref), getFFlagEnableNavigationPerformanceIntervals (ref), intervalPerformanceTracker (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), luaAppStabilizeVideoTileReactRoot (ref), useHasVideoThumbnailSelectorModule (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), fFlagLuaAppTileVideoDeviceMemoryBlocking (ref), appGameTile (write), cryoModule (ref)
	local var84 = reactModule.useRef(nil)
	local var85 = useTokens()
	local useHoverTile = p27.useHoverTile
	local var86 = `{p27.impressionsTag or ""}_{p27.index or "0"}_{p27.gameTileLayoutType or "Narrow"}`
	
	if p27.impressionsTag == nil or p27.index == nil then
		useHoverTile = false
	end
	var86 = useIsHoveredTileModule(var84, var86, useHoverTile)
	local var87 = useUiModeInfo().uiMode == uiMode.TenFoot
	local var88 = if var87 then true else p27.useHoverTile
	local var89 = if p27.useExperienceTileMetadata ~= nil then var87 else p27.useExperienceTileMetadata
	local var90 = useValidTileBadgesModule(p27.entry.universeId, p27.topicId, p27.badgeOverride)
	local var91 = useSelector(function(p28) --[[ line: 1194 ]]
		return p28.LocalUserId
	end)
	local var92 = if not fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useSelector(function(p29) --[[ line: 1200 ]]
		return p29.Users
	end) else nil
	local var93 = useSelector(function(p30) --[[ line: 1205 ]]
		-- upvalues: p27 (ref)
		return p30.InGameUsersByGame[p27.entry.universeId]
	end)
	local var94 = useHasInGameFriendsModule(var91, var92, var93)
	local var95 = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then useInGameUserIdsModule(var91, var93) else nil
	local var96, var97 = reactModule.useState(false)
	
	if fFlagLuaAppFixHiddenTileVideoCleanup then
		reactModule.useEffect(function() --[[ line: 1217 ]]
			-- upvalues: p27 (ref), var97 (ref)
			if p27.isHidden then
				var97(false)
			end
		end, { p27.isHidden })
	end
	local var98 = nil
	local var99 = nil
	local var100 = nil
	local var101 = nil
	
	if fFlagLuaAppGameDetailsAttributionFix then
		var98 = useRoactService(roactNetworking)
		var99 = if p27.entry.navigationUniverseId and p27.entry.navigationUniverseId ~= "" and p27.entry.navigationUniverseId ~= "0" then p27.entry.navigationUniverseId else p27.entry.universeId
		var101 = reactModule.useCallback(function() --[[ line: 1238 ]]
			-- upvalues: p27 (ref), sponsoredGamesRecordClick (copy), var98 (write)
			local entry = p27.entry
			
			if entry.isSponsored then
				sponsoredGamesRecordClick(var98, entry.adId)
			end
		end, { var98, p27.entry.isSponsored, p27.entry.adId })
		var100 = reactModule.useCallback(function(p31) --[[ line: 1247 ]]
			-- upvalues: p27 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppHomeTouchAutoplay (copy), videoEndReasonModule (copy), var99 (write), videoPlaybackCoordinator (copy), fFlagLuaAppGameTileInteractionFeedback (copy), gameCollectionItemTypes (copy), getFFlagEnableNavigationPerformanceIntervals (copy), intervalPerformanceTracker (copy), var101 (write)
			if p27.isHovered then
				hoverTileCoordinatorModule.default:reset()
			end
			if fFlagLuaAppHomeTouchAutoplay and p27.videoPlaybackContext and p27.videoPlaybackContext.videoPlaybackCoordinator then
				p27.videoPlaybackContext.videoPlaybackCoordinator:reset(videoEndReasonModule.TileClicked, nil, var99, nil)
			else
				videoPlaybackCoordinator.default:reset(videoEndReasonModule.TileClicked, nil, var99, nil)
			end
			if p31 then
				if fFlagLuaAppGameTileInteractionFeedback and p27.onActivated then
					p27.onActivated()
				end
				local t = {
					source = p27.source,
					index = p27.index,
					referralSource = p27.referralSource,
					onPeekViewClosed = p27.onPeekViewClosed,
					placeIdOverride = p27.entry.placeIdOverride,
					experienceJoinData = {
						launchData = if p27.entry.launchDataOverride then p27.entry.launchDataOverride else nil,
						tileType = p27.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						nativeAdData = p27.entry.adId
					}
				}
				
				if getFFlagEnableNavigationPerformanceIntervals() then
					intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
				end
				p27.navigateToGameDetails(var99, t)
				p27.reportGameDetailOpened(p27.index, var99)
				var101()
			end
		end, {
			p27.isHovered, p27.index, p27.videoAnalytics, p27.onActivated, p27.source,
			p27.referralSource, p27.onPeekViewClosed, p27.navigateToGameDetails,
			p27.reportGameDetailOpened, var99, var101, p27.entry.placeIdOverride,
			p27.entry.launchDataOverride,
			if fFlagLuaAppHomeTouchAutoplay and p27.videoPlaybackContext then p27.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	end
	local var102 = useOverflowMenuOpen(var86)
	local var103 = useTriggerFeedback()
	local var104 = reactModule.useMemo(function() --[[ line: 1322 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), p27 (ref), fFlagLuaAppEnableSponsoredReportAd (copy)
		return getAvailableGameTileOverflowMenuItemsModule({
			isSponsored = p27.entry.isSponsored,
			enableExplicitFeedback = p27.enableExplicitFeedback,
			enableSponsoredFeedback = p27.enableSponsoredFeedback,
			enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p27.enableReportAd else nil
		})
	end, {
		p27.entry.isSponsored,
		p27.enableExplicitFeedback,
		p27.enableSponsoredFeedback,
		if fFlagLuaAppEnableSponsoredReportAd then p27.enableReportAd else nil
	})
	local var105 = nil
	
	if luaAppStabilizeVideoTileReactRoot then
		local var106 = if p27.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p27.entry.universeId, p27.topicId) else true
		
		if fFlagLuaAppHomeTouchAutoplay then
			useTagAsViewportAutoplayCandidate(var84, p27.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var106 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p27.isHidden else nil)
		end
		local var107 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		
		if var106 and (if fFlagLuaAppHomeTouchAutoplay then not p27.isHidden else true) then
			local var110
			local createElement = reactModule.createElement
			local var108 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var86,
				itemIndex = p27.index,
				universeId = p27.entry.universeId,
				tileRef = var84,
				isHoverSupported = useHoverTile,
				isHovered = var86
			}
			
			if fFlagLuaAppEdpMediaGalleryVideoPreview then
				var110 = var107 == responsiveModule.Input.Touch
				var110 = nil
			else
				var110 = nil
			end
			t.autoplay = var110
			t.onPlaybackChange = var97
			t.videoAnalytics = p27.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p27.hasPrevalidatedVideoGamePlayability else nil
			t.pageContext = if fFlagLuaAppTileVideoDeviceMemoryBlocking then p27.appPage else nil
			t.videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then p27.videoPlaybackContext else nil
			var105 = createElement(var108, t)
		else
			var105 = nil
		end
	end
	local var111 = reactModule.createElement(appGameTile, cryoModule.Dictionary.join(p27, {
		useExperienceTileMetadata = var89,
		hasBackground = var88,
		hoverRef = var84,
		isHoverSupported = useHoverTile,
		isHovered = var86,
		isVideoPlaying = var96,
		tileBadges = var90,
		foundationTokens = var85,
		users = var92,
		inGameUsersByGame = var93,
		hasInGameFriends = var94,
		inGameUserIds = if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then var95 else nil,
		networking = if fFlagLuaAppGameDetailsAttributionFix then var98 else nil,
		navigationUniverseId = if fFlagLuaAppGameDetailsAttributionFix then var99 else nil,
		onGameTileActivated = if fFlagLuaAppGameDetailsAttributionFix then var100 else nil,
		recordSponsoredGameClick = if fFlagLuaAppGameDetailsAttributionFix then var101 else nil,
		overflowMenuOpen = var102,
		hoverKey = var86,
		triggerFeedback = var103,
		availableMenuItems = var104,
		videoPlaybackDetector = if luaAppStabilizeVideoTileReactRoot then var105 else nil
	}))
	
	if luaAppStabilizeVideoTileReactRoot then
		return var111
	end
	local var112 = if p27.entry.primaryWideVideoAssetId == nil then useHasVideoThumbnailSelectorModule(p27.entry.universeId, p27.topicId) else true
	
	if fFlagLuaAppHomeTouchAutoplay then
		useTagAsViewportAutoplayCandidate(var84, p27.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then var112 else nil, if fFlagLuaAppFixHiddenTileVideoCleanup then p27.isHidden else nil)
	end
	local var113 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
	
	if not var112 or not (if fFlagLuaAppHomeTouchAutoplay then not p27.isHidden else true) then
		return var111
	end
	local var118
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local t = {}
	local t_1 = { GameTile = var111 }
	local createElement_1 = reactModule.createElement
	local var116 = gameVideoPlaybackDetectorModule
	local t_2 = {
		videoKey = var86,
		itemIndex = p27.index,
		universeId = p27.entry.universeId,
		tileRef = var84,
		isHoverSupported = useHoverTile,
		isHovered = var86
	}
	
	if fFlagLuaAppEdpMediaGalleryVideoPreview then
		var118 = var113 == responsiveModule.Input.Touch
		var118 = nil
	else
		var118 = nil
	end
	t_2.autoplay = var118
	t_2.onPlaybackChange = var97
	t_2.videoAnalytics = p27.videoAnalytics
	t_2.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
	t_2.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
	t_2.hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p27.hasPrevalidatedVideoGamePlayability else nil
	t_2.pageContext = if fFlagLuaAppTileVideoDeviceMemoryBlocking then p27.appPage else nil
	t_2.videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then p27.videoPlaybackContext else nil
	t_1.VideoPlaybackDetector = createElement_1(var116, t_2)
	
	return createElement(fragment, t, t_1)
end