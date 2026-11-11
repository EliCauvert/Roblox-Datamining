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
local FormatExperienceIconModule = require(GameTile.formatExperienceIcon)
local FormatExperienceRatingModule = require(GameTile.formatExperienceRating)
local FormatExperienceThumbnailModule = require(GameTile.formatExperienceThumbnail)
local HiddenTileContentModule = require(GameTile.HiddenGameTile.HiddenTileContent)
local ItemLayoutDataParsingUtilsModule = require(GameTile.ItemLayoutDataParsingUtils)
local Parent = GameTile.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local AppBloxModule = require(Parent.AppBlox)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local AspectRatioModeEnum = UIBloxModule.App.Tile.AspectRatioModeEnum
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UiMode = require(Parent.RobloxAppEnums).UiMode
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local GameIconReducer = require(Parent.GameIconRodux).GameIcons.GameIconReducer
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
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
local FFlagLuaAppGameTileInteractionFeedback = require(Parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local FFlagLuaAppMigrateGameTileHoverFixes = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local FFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local FFlagLuaAppUnifyPlayButtonTile = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppGameDetailsAttributionFix = require(Parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local LuaAppUseRatingFormatHelper2 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local FFlagLuaAppGameTileOverflowMenuTelemetry = require(Parent.SharedFlags).FFlagLuaAppGameTileOverflowMenuTelemetry
local FFlagLuaAppHapticTriggeredTelemetry = require(Parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
local FFlagLuaAppFixExplicitFeedbackTelemetry = require(Parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppSupportSponsoredExplicitFeedback = require(Parent.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(Parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local FFlagLuaAppFixTwoByOneOverflowMenuTelemetry = require(Parent.SharedFlags).FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(Parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FIntLuaAppGameTileVideoDwellTimeInSec = require(Parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppFixHiddenTileVideoCleanup = require(Parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local LuaAppStabilizeVideoTileReactRoot = game:DefineFastFlag("LuaAppStabilizeVideoTileReactRoot", false)
local FFlagLuaAppHomeReduceRenders = require(Parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local FFlagLuaAppGenreRatingFooter = require(Parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local GameTileOverflowMenuModule = require(GameTile.GameTileOverflowMenu)
local GetAvailableGameTileOverflowMenuItemsModule = require(GameTile.getAvailableGameTileOverflowMenuItems)
local t = {}
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local function _()
	return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000
end

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
	onGuiStateChanged = if FFlagLuaAppGameTileInteractionFeedback then TModule.optional(TModule.callback) else nil,
	isDisabled = TModule.optional(TModule.boolean),
	onActivated = if FFlagLuaAppGameTileInteractionFeedback then TModule.optional(TModule.callback) else nil,
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
	videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.table) else nil,
	SelectionOrder = TModule.optional(TModule.number),
	enableExplicitFeedback = TModule.optional(TModule.boolean),
	setGameHidden = TModule.optional(TModule.callback),
	appPage = TModule.optional(TModule.string),
	isHidden = TModule.optional(TModule.boolean),
	isNarrowScreenXSmall = TModule.optional(TModule.boolean),
	onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
	sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then TModule.optional(TModule.string) else nil,
	enableSponsoredFeedback = TModule.optional(TModule.boolean),
	availableMenuItems = TModule.optional(TModule.table),
	enableReportAd = if FFlagLuaAppEnableSponsoredReportAd then TModule.optional(TModule.boolean) else nil,
	compactMetadataFormat = if FFlagLuaAppNarrowTileSmallerFooterFont then TModule.optional(TModule.boolean) else nil,
	hideRating = if FFlagLuaAppNarrowTileHideRating then TModule.optional(TModule.boolean) else nil,
	hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then TModule.optional(TModule.boolean) else nil,
	game = TModule.optional(TModule.table),
	universeId = TModule.string,
	navigationUniverseId = TModule.optional(TModule.string),
	name = TModule.string,
	totalUpVotes = TModule.number,
	totalDownVotes = TModule.number,
	friendActivityTitle = TModule.optional(TModule.string),
	friendVisitedString = TModule.optional(TModule.string),
	imageThumbnail = TModule.string,
	wideThumbnail = TModule.optional(TModule.string),
	videoThumbnail = TModule.optional(TModule.string),
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
	videoPlaybackDetector = if LuaAppStabilizeVideoTileReactRoot then TModule.optional(TModule.table) else nil
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

function AppGameTile.init(p1)
	-- upvalues: DiscoveryAppLaunchTracker (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), GetOverflowMenuSignalStoreFunction (copy), FFlagLuaAppGameDetailsAttributionFix (copy), HoverTileCoordinatorModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReasonModule (copy), VideoPlaybackCoordinator (copy), RoactModule (copy), AppExperienceActionRowModule (copy), FFlagLuaAppUnifyPlayButtonTile (copy), SponsoredGamesRecordClickFunction (copy), FFlagLuaAppGameTileInteractionFeedback (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervalsFunction (copy), IntervalPerformanceTracker (copy), ResponsiveModule (copy), ContentProvider (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), MemoizeFunction (copy), SortFriendsByPresenceAndRecencyFactoryModule (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileInit()
	end
	p1.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else false
	}
	p1.onMenuOpenChanged = if FFlagLuaAppGameTileOverflowMenuTelemetry then function(p2, AvailableMenuItems)
		-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (upval), p1 (copy), GameTileOverflowMenuActionFunction (upval), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (upval)
		GameTileOverflowMenuActionFunction({
			ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.props.appPage,
			universeId = p1.props.universeId,
			sortId = p1.props.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = AvailableMenuItems
		}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.props.appPage or (if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then "Unknown" else nil) else nil)
	end else nil
	
	function p1.onTouchLongPress()
		-- upvalues: p1 (copy), FFlagLuaAppHapticTriggeredTelemetry (upval), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (upval), GetOverflowMenuSignalStoreFunction (upval), FFlagLuaAppGameTileOverflowMenuTelemetry (upval)
		if next(p1.props.availableMenuItems) ~= nil then
			if p1.props.triggerFeedback and not p1.props.overflowMenuOpen then
				local Config = if FFlagLuaAppHapticTriggeredTelemetry then {
					universeId = p1.props.universeId,
					sortId = p1.props.topicId
				} else nil
				p1.props.triggerFeedback("TileLongPress", "Press", if FFlagLuaAppHapticTriggeredTelemetry then p1.props.appPage or (if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then "Unknown" else nil) else nil, if FFlagLuaAppHapticTriggeredTelemetry then Config else nil)
			end
			GetOverflowMenuSignalStoreFunction().openMenu(p1.props.hoverKey)
			
			if FFlagLuaAppGameTileOverflowMenuTelemetry then
				local List = {}
				
				for i, _ in p1.props.availableMenuItems do
					table.insert(List, i)
				end
				p1.onMenuOpenChanged(false, table.concat(List, ","))
			end
		end
	end
	
	function p1.reportExperienceLaunchedFromActionBar(...)
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (upval), p1 (copy), HoverTileCoordinatorModule (upval), FFlagLuaAppHomeTouchAutoplay (upval), VideoEndReasonModule (upval), VideoPlaybackCoordinator (upval)
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
		if FFlagLuaAppHomeTouchAutoplay and p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
			
			return
		else
			VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
		end
	end
	
	function p1:renderAppExperienceActionRow()
		-- upvalues: RoactModule (upval), AppExperienceActionRowModule (upval), p1 (copy), FFlagLuaAppGameDetailsAttributionFix (upval), FFlagLuaAppUnifyPlayButtonTile (upval)
		return RoactModule.createElement(AppExperienceActionRowModule, {
			launchSource = "ExperienceTile",
			universeId = p1.props.navigationUniverseId,
			referralSource = p1.props.referralSource,
			reportExperienceLaunched = p1.reportExperienceLaunchedFromActionBar,
			openGameDetails = if FFlagLuaAppGameDetailsAttributionFix then function()
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
	
	function p1.onHoverChanged(IsHovered)
		-- upvalues: p1 (copy)
		if IsHovered and p1.props.triggerFeedback then
			p1.props.triggerFeedback("Default", "Hover")
		end
		p1:setState({ isHovered = IsHovered })
	end
	
	p1.gameTileRef = RoactModule.createRef()
	
	function p1.getTilePosition()
		-- upvalues: p1 (copy)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsolutePosition else nil
	end
	
	function p1.getTileSize()
		-- upvalues: p1 (copy)
		return if p1.gameTileRef.current then p1.gameTileRef.current.AbsoluteSize else nil
	end
	
	p1.recordSponsoredGameClick = if FFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p1 (copy), SponsoredGamesRecordClickFunction (upval)
		local Networking = p1.props.networking
		local Entry = p1.props.entry
		
		if Entry.isSponsored then
			SponsoredGamesRecordClickFunction(Networking, Entry.adId)
		end
	end
	p1.onActivated = if FFlagLuaAppGameDetailsAttributionFix then nil else function()
		-- upvalues: p1 (copy), HoverTileCoordinatorModule (upval), FFlagLuaAppHomeTouchAutoplay (upval), VideoEndReasonModule (upval), VideoPlaybackCoordinator (upval), FFlagLuaAppGameTileInteractionFeedback (upval), GameCollectionItemTypes (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), IntervalPerformanceTracker (upval)
		if p1.props.isHovered then
			HoverTileCoordinatorModule.default:reset()
		end
		if FFlagLuaAppHomeTouchAutoplay and p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
			p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		else
			VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.TileClicked, nil, p1.props.navigationUniverseId, nil)
		end
		if p1.isMounted then
			if FFlagLuaAppGameTileInteractionFeedback and p1.props.onActivated then
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
	
	function p1.onFriendFooterActivated()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.openContextualMenu(p1.props.game, p1.getTileSize(), p1.getTilePosition())
		end
	end
	
	function p1.onActivateSponsoredTooltip()
		-- upvalues: p1 (copy), ResponsiveModule (upval)
		if p1.isMounted then
			p1.props.openSponsoredTooltip(ResponsiveModule.GetInputModeStore(false).getLastInputType(false))
		end
	end
	
	function p1.loadWideThumbnail()
		-- upvalues: p1 (copy), ContentProvider (upval)
		local WideThumbnail = p1.props.wideThumbnail
		
		if WideThumbnail ~= nil then
			task.spawn(function()
				-- upvalues: ContentProvider (upval), WideThumbnail (copy)
				ContentProvider:PreloadAsync({ WideThumbnail })
			end)
		end
	end
	
	function p1.getVisitedFriends()
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
	
	p1.getSortedFriends = MemoizeFunction(function(p2, List)
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
	
	function p1.onSelectionGained()
		-- upvalues: FFlagLuaAppGameTileSelectionVideoPlayback (upval), p1 (copy)
		if not FFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = true })
		end
		if p1.props.onSelectionGained or FFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionGained(p1.props.entry, p1.props.index, p1.props.navigationUniverseId)
		end
	end
	
	function p1.onSelectionLost()
		-- upvalues: FFlagLuaAppGameTileSelectionVideoPlayback (upval), p1 (copy)
		if not FFlagLuaAppGameTileSelectionVideoPlayback then
			p1:setState({ isSelected = false })
		end
		if p1.props.onSelectionLost or FFlagLuaAppGameTileSelectionVideoPlayback then
			p1.props.onSelectionLost()
		end
	end
end

local _ = function(p2)
	if p2 == nil then
		return nil
	elseif p2.type == "TextLabel" then
		local Text = p2.text
		
		return if Text == nil then nil else Text.textLiteral
	else
		return nil
	end
end

local Callback = if FFlagLuaAppGenreRatingFooter then function(p2)
	if p2 == nil then
		return nil
	elseif p2.type == "RatingWithGenre" then
		local Genre = p2.genre
		
		return if Genre == nil then nil else Genre.textLiteral
	else
		return nil
	end
end else nil

function AppGameTile.renderGridTilesFooter(p2)
	-- upvalues: FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), FFlagLuaAppGenreRatingFooter (copy), Callback (ref), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppMigrateGameTileFixConsoleMetadataText (copy), GameTileTypesModule (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), RoactModule (copy), GameStatsModule (copy), GameTileConstantsModule (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), ReactModule (copy), GridTileSponsoredFooterModule (copy), GridTileTextFooterModule (copy), RatingWithGenreFooterModule (copy), GridTileFriendFooter (copy), GridTileIconTextFooterModule (copy), Images (copy)
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
	local CallbackResult = if FFlagLuaAppGenreRatingFooter then Callback(p2.props.footerLayoutData) else nil
	local Flag = false
	
	if (p2.props.isHovered or (if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected)) and (p2.props.ageRatingText and not p2.props.hidePlayButton) then
		Text = p2.props.ageRatingText
		Flag = true
	end
	local HasText = Text ~= nil
	local HasCallbackResult = if FFlagLuaAppGenreRatingFooter then CallbackResult ~= nil else nil
	local Entry = p2.props.entry
	local IsShowSponsoredLabel = Entry.isSponsored and (Entry.isShowSponsoredLabel or (p2.props.isSponsoredFooterAllowed or p2.props.isSponsoredRatingFooterAllowed))
	
	if FFlagLuaAppMigrateGameTileFixConsoleMetadataText and p2.props.gameTileLayoutType == GameTileTypesModule.GameTileLayoutType.Narrow and p2.props.useExperienceTileMetadata and (IsShowSponsoredLabel or HasText or FFlagLuaAppGenreRatingFooter and HasCallbackResult) or FFlagLuaAppNarrowTileSmallerFooterFont and p2.props.compactMetadataFormat then
		UseHoverTile = false
	end
	local Element = RoactModule.createElement(GameStatsModule, {
		isUnifiedGameTile = true,
		stats = {
			totalUpVotes = p2.props.totalUpVotes,
			totalDownVotes = p2.props.totalDownVotes,
			playerCount = if p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Footer then p2.props.entry.playerCount else nil
		},
		isGridTile = p2.props.useGridTile,
		hideGameStats = p2.props.hideGameStats,
		useLargerFont = UseHoverTile,
		gameTileLayoutType = p2.props.gameTileLayoutType,
		compactMetadataFormat = if FFlagLuaAppNarrowTileSmallerFooterFont then p2.props.compactMetadataFormat else nil,
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
			totalUpVotes = p2.props.totalUpVotes,
			totalDownVotes = p2.props.totalDownVotes,
			genreText = CallbackResult
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

function AppGameTile.renderContent(p2, ReducedMotion, p3, _)
	-- upvalues: GameTileConstantsModule (copy), GameTileViewConfigModule (copy), ReactModule (copy), GameStatsModule (copy), HiddenTileContentModule (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), GameTileVideoThumbnailModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagLuaAppVideoTileDisableActivation (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppGameDetailsAttributionFix (copy), FFlagLuaAppHomeTouchAutoplay (copy), RoactModule (copy), GameTileThumbnailBadgesModule (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), GameTileOverflowMenuModule (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), GameTileViewModule (copy), FFlagLuaAppMigrateGameTileHoverFixes (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppGameTileInteractionFeedback (copy), AppExperienceActionRowModule (copy), FFlagLuaAppUnifyPlayButtonTile (copy), LuaAppStabilizeVideoTileReactRoot (copy)
	local ImageThumbnail = p2.props.imageThumbnail
	local OnGameTileActivatedFunction = p2.props.onGameTileActivated
	local IsPlayerCountStyleMatch: boolean = p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Always or p2.props.isHovered and p2.props.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Hover
	local ImageAspectRatio: number = GameTileViewConfigModule.getImageAspectRatio(p2.props.gameTileLayoutType)
	local RenderGridTilesFooterResult = p2:renderGridTilesFooter()
	local Name = if p2.props.hideTitle then nil else p2.props.name
	local Element = if IsPlayerCountStyleMatch then ReactModule.createElement(GameStatsModule, {
		stats = {
			displayConcurrentUsersPill = true,
			playerCount = p2.props.entry.playerCount
		}
	}) else nil
	local PlayButtonHeight = GameTileViewConfigModule.getElementSizes(p3.Tokens, p2.props.textSizeOffset, p2.props.contentTextLineCount, p2.props.foundationTokens, true).playButtonHeight
	local Fragment = if p2.props.isVideoPlaying then nil elseif p2.props.tileBadges then RoactModule.createFragment({
		SocialFeaturePill = Element,
		Badge = ReactModule.createElement(GameTileThumbnailBadgesModule, { tileBadgesByPosition = p2.props.tileBadges })
	}) else Element
	local IsHidden = p2.props.isHidden
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.props.Size or UDim2.fromScale(1, 1),
		ZIndex = p2.props.ZIndex,
		LayoutOrder = p2.props.layoutOrder,
		ref = p2.gameTileRef
	}, {
		Tile = ReactModule.createElement(GameTileViewModule, {
			isUnifiedGameTile = true,
			SelectionOrder = p2.props.SelectionOrder,
			Selectable = not IsHidden,
			hoverPadding = if FFlagLuaAppMigrateGameTileHoverFixes or p2.props.useGridTile then nil elseif FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_200 else p3.Tokens.Global.Space_100,
			numLinesForTitle = p2.props.contentTextLineCount,
			numLinesForMetadata = p2.props.metadataTextLineCount,
			imageAspectRatio = ImageAspectRatio,
			isContained = p2.props.isContained,
			containmentSidePadding = GameTileViewConfigModule.getContainmentSidePadding(p3.Tokens, p2.props.gameTileLayoutType, p2.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = ImageThumbnail,
			onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p2.props.onTileImageLoaded else nil,
			thumbnailComponent = if p2.props.isHidden then ReactModule.createElement(HiddenTileContentModule, {
				appPage = p2.props.appPage,
				collectionId = p2.props.topicId,
				setGameHidden = p2.props.setGameHidden,
				universeId = p2.props.universeId,
				parentRef = p2.props.hoverRef,
				isSponsored = if FFlagLuaAppSupportSponsoredExplicitFeedback then p2.props.entry.isSponsored else nil
			}) elseif p2.props.videoThumbnail then ReactModule.createElement(GameTileVideoThumbnailModule, {
				looped = true,
				ZIndex = -2,
				video = p2.props.videoThumbnail,
				image = ImageThumbnail,
				playing = p2.props.isVideoPlaying,
				Size = UDim2.fromScale(1, 1),
				isTileContained = p2.props.isContained,
				cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_200 else p3.Tokens.Global.Space_100,
				onActivated = if FFlagLuaAppVideoTileDisableActivation then nil elseif FFlagLuaAppEdpMediaGalleryFullScreen then if FFlagLuaAppGameDetailsAttributionFix then function()
					-- upvalues: OnGameTileActivatedFunction (copy), p2 (copy)
					OnGameTileActivatedFunction(p2.isMounted)
				end else p2.onActivated else nil,
				itemIndex = p2.props.index,
				videoAnalytics = p2.props.videoAnalytics,
				universeId = p2.props.universeId,
				videoPlaybackCoordinator = if FFlagLuaAppHomeTouchAutoplay and p2.props.videoPlaybackContext then p2.props.videoPlaybackContext.videoPlaybackCoordinator else nil
			}) else nil,
			title = if IsHidden then nil else Name,
			isDisabled = if IsHidden then true else p2.props.isDisabled,
			onActivated = if FFlagLuaAppGameDetailsAttributionFix and not IsHidden then function()
				-- upvalues: OnGameTileActivatedFunction (copy), p2 (copy)
				OnGameTileActivatedFunction(p2.isMounted)
			end else p2.onActivated,
			onGuiStateChanged = if FFlagLuaAppGameTileInteractionFeedback then p2.props.onGuiStateChanged else nil,
			onSelectionGained = p2.onSelectionGained,
			onSelectionLost = p2.onSelectionLost,
			onTouchLongPress = if IsHidden then nil else p2.onTouchLongPress,
			reducedMotion = ReducedMotion,
			isHovered = not IsHidden and p2.props.isHovered,
			forwardRef = p2.props.hoverRef,
			hidePlayButton = if IsHidden then true else p2.props.hidePlayButton,
			hoverActionRow = if p2.props.hidePlayButton or IsHidden then nil else ReactModule.createElement(AppExperienceActionRowModule, {
				launchSource = "ExperienceTile",
				horizontalPadding = 0,
				verticalPadding = 0,
				universeId = p2.props.navigationUniverseId,
				referralSource = p2.props.referralSource,
				reportExperienceLaunched = p2.reportExperienceLaunchedFromActionBar,
				openGameDetails = if FFlagLuaAppGameDetailsAttributionFix then function()
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
			overflowMenu = if next(p2.props.availableMenuItems) == nil then nil elseif p2.props.isHovered or p2.props.overflowMenuOpen then if IsHidden then nil else ReactModule.createElement(GameTileOverflowMenuModule, {
				isHovered = p2.props.isHovered,
				isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected,
				universeId = p2.props.universeId,
				collectionId = p2.props.topicId,
				appPage = p2.props.appPage,
				setGameHidden = p2.props.setGameHidden,
				menuKey = p2.props.hoverKey,
				menuOpen = p2.props.overflowMenuOpen,
				onMenuOpenChanged = if FFlagLuaAppGameTileOverflowMenuTelemetry then p2.onMenuOpenChanged else nil,
				parentRef = p2.props.hoverRef,
				isSponsored = if FFlagLuaAppEnableWhyThisAdModal then p2.props.entry.isSponsored else nil,
				payerName = if FFlagLuaAppEnableWhyThisAdModal then p2.props.entry.payerName else nil,
				sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then p2.props.sponsoredUserCohort else nil,
				adId = if FFlagLuaAppEnableSponsoredReportAd then p2.props.entry.adId else nil,
				availableMenuItems = p2.props.availableMenuItems
			}) elseif if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected then if IsHidden then nil else ReactModule.createElement(GameTileOverflowMenuModule, {
				isHovered = p2.props.isHovered,
				isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p2.props.isSelected else p2.state.isSelected,
				universeId = p2.props.universeId,
				collectionId = p2.props.topicId,
				appPage = p2.props.appPage,
				setGameHidden = p2.props.setGameHidden,
				menuKey = p2.props.hoverKey,
				menuOpen = p2.props.overflowMenuOpen,
				onMenuOpenChanged = if FFlagLuaAppGameTileOverflowMenuTelemetry then p2.onMenuOpenChanged else nil,
				parentRef = p2.props.hoverRef,
				isSponsored = if FFlagLuaAppEnableWhyThisAdModal then p2.props.entry.isSponsored else nil,
				payerName = if FFlagLuaAppEnableWhyThisAdModal then p2.props.entry.payerName else nil,
				sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then p2.props.sponsoredUserCohort else nil,
				adId = if FFlagLuaAppEnableSponsoredReportAd then p2.props.entry.adId else nil,
				availableMenuItems = p2.props.availableMenuItems
			}) else nil,
			footerMetadata = if IsHidden then nil else RenderGridTilesFooterResult,
			textSizeOffset = p2.props.textSizeOffset,
			hideMetadata = p2.props.hideMetadata
		}),
		VideoPlaybackDetector = if LuaAppStabilizeVideoTileReactRoot then p2.props.videoPlaybackDetector else nil
	})
end

function AppGameTile.render(p2)
	-- upvalues: DiscoveryAppLaunchTracker (copy), WithStyleFunction (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileRender()
	end
	return if p2.props.game == nil then nil else WithStyleFunction(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderContent(p3.Settings.ReducedMotion, p3, p2.props.foundationTokens)
	end)
end

function AppGameTile.didMount(p2)
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

function AppGameTile.willUnmount(p2)
	-- upvalues: ImpressionsTagUtility (copy)
	p2.isMounted = false
	ImpressionsTagUtility.RemoveTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)
end

function AppGameTile.didUpdate(p2, p3)
	-- upvalues: ImpressionsTagUtility (copy)
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

local _ = function(p2, p3): string
	return if p2 + p3 == 0 then "--" else tostring((math.floor(p2 / (p2 + p3) * 100 + 0.5))) .. "%"
end

local v1 = RoactRoduxModule.connect(function(p2, DefaultProps)
	-- upvalues: FFlagLuaAppGameDetailsAttributionFix (copy), GameInfosReducer (copy), GameTileConstantsModule (copy), GetGameTileLayoutDataModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), GameIconReducer (copy), FormatExperienceIconModule (copy), LuaAppUseRatingFormatHelper2 (copy), FormatExperienceRatingModule (copy), FFlagLuaAppHomeReduceRenders (copy), t (copy)
	local UniverseId = DefaultProps.entry.universeId
	local NavigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then nil elseif DefaultProps.entry.navigationUniverseId and DefaultProps.entry.navigationUniverseId ~= "" and DefaultProps.entry.navigationUniverseId ~= "0" then DefaultProps.entry.navigationUniverseId else DefaultProps.entry.universeId
	local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][UniverseId]
	local TotalUpVotes = PersonalizationEntry and PersonalizationEntry.totalUpVotes or 0
	local TotalDownVotes = PersonalizationEntry and PersonalizationEntry.totalDownVotes or 0
	local FriendActivityTitle = PersonalizationEntry and PersonalizationEntry.friendActivityTitle or nil
	local AgeRatingText = nil
	local MinimumAge = PersonalizationEntry and PersonalizationEntry.minimumAge or 0
	local AgeRecommendationDisplayName = PersonalizationEntry and PersonalizationEntry.ageRecommendationDisplayName or ""
	local IsNotPlayButtonStyleMatch: boolean = if DefaultProps.gameTileLayoutType == "Event" then DefaultProps.playButtonStyle ~= GameTileConstantsModule.PlayButtonStyleValues.Enabled else DefaultProps.gameTileLayoutType == "Wide" and DefaultProps.playButtonStyle == GameTileConstantsModule.PlayButtonStyleValues.Disabled
	local Flag = nil
	
	if IsNotPlayButtonStyleMatch or DefaultProps.forceHideAgeRatings then
		Flag = false
	elseif MinimumAge == 0 or AgeRecommendationDisplayName == "" then
		Flag = false
	else
		Flag = true
		AgeRatingText = AgeRecommendationDisplayName
	end
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(PersonalizationEntry, DefaultProps.topicId)
	local FormatExperienceThumbnailModuleResult = FormatExperienceThumbnailModule((if DefaultProps.entry.primaryWideImageAssetId then DefaultProps.entry.primaryWideImageAssetId else ItemLayoutDataParsingUtilsModule.getWideImageAssetId(GameTileLayoutDataModule)) or (PersonalizationEntry and PersonalizationEntry.primaryWideAssetId or nil), DefaultProps.entry.placeId)
	local PrimaryWideVideoAssetId = if DefaultProps.entry.primaryWideVideoAssetId then DefaultProps.entry.primaryWideVideoAssetId else GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
	local Url = p2[GameIconReducer.key][UniverseId] and p2[GameIconReducer.key][UniverseId].url or nil
	
	return {
		game = PersonalizationEntry,
		universeId = UniverseId,
		navigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then nil else NavigationUniverseId,
		name = GameTileLayoutDataModule and GameTileLayoutDataModule.title or (PersonalizationEntry and PersonalizationEntry.name or ""),
		totalUpVotes = TotalUpVotes,
		totalDownVotes = TotalDownVotes,
		imageThumbnail = if DefaultProps.useGridTile then FormatExperienceThumbnailModuleResult else FormatExperienceIconModule(Url, UniverseId),
		wideThumbnail = FormatExperienceThumbnailModuleResult,
		videoThumbnail = if PrimaryWideVideoAssetId then `rbxassetid://{PrimaryWideVideoAssetId}` else nil,
		friendActivityTitle = FriendActivityTitle,
		rating = if DefaultProps.useHoverTile or DefaultProps.useExperienceTileMetadata then if LuaAppUseRatingFormatHelper2 then FormatExperienceRatingModule(TotalUpVotes, TotalDownVotes, nil, true) elseif TotalUpVotes + TotalDownVotes == 0 then "--" else tostring((math.floor(TotalUpVotes / (TotalUpVotes + TotalDownVotes) * 100 + 0.5))) .. "%" else nil,
		showAgeRating = Flag,
		ageRatingText = AgeRatingText,
		friendVisits = PersonalizationEntry and PersonalizationEntry.friendVisits or (if FFlagLuaAppHomeReduceRenders then t else {}),
		friendVisitedString = if PersonalizationEntry and PersonalizationEntry.friendVisitedString ~= "" then PersonalizationEntry.friendVisitedString else nil,
		hidePlayButton = IsNotPlayButtonStyleMatch,
		footerLayoutData = GameTileLayoutDataModule and GameTileLayoutDataModule.footer or nil
	}
end, function(Callback)
	-- upvalues: OpenCentralOverlayForPlacesListModule (copy), OpenSponsoredTooltipModule (copy)
	return {
		openContextualMenu = function(p2, p3, p4)
			-- upvalues: Callback (copy), OpenCentralOverlayForPlacesListModule (upval)
			Callback(OpenCentralOverlayForPlacesListModule(p2, p3, p4))
		end,
		openSponsoredTooltip = function(p2)
			-- upvalues: Callback (copy), OpenSponsoredTooltipModule (upval)
			return Callback(OpenSponsoredTooltipModule(p2))
		end
	}
end)(AppGameTile)

if not FFlagLuaAppGameDetailsAttributionFix then
	v1 = RoactServices.connect({ networking = RoactNetworking })(v1)
end
return function(p2)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), UseIsHoveredTileModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), UseValidTileBadgesModule (copy), UseSelectorFunction (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), UseHasInGameFriendsModule (copy), UseInGameUserIdsModule (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), FFlagLuaAppGameDetailsAttributionFix (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), SponsoredGamesRecordClickFunction (copy), HoverTileCoordinatorModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReasonModule (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileInteractionFeedback (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervalsFunction (copy), IntervalPerformanceTracker (copy), UseOverflowMenuOpenFunction (copy), UseTriggerFeedbackFunction (copy), GetAvailableGameTileOverflowMenuItemsModule (copy), FFlagLuaAppEnableSponsoredReportAd (copy), LuaAppStabilizeVideoTileReactRoot (copy), UseHasVideoThumbnailSelectorModule (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), UsePreferredInputFunction (copy), GameVideoPlaybackDetectorModule (copy), ResponsiveModule (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), v1 (ref), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseHoverTile = p2.useHoverTile
	local Text: string = `{p2.impressionsTag or ""}_{p2.index or "0"}_{p2.gameTileLayoutType or "Narrow"}`
	
	if p2.impressionsTag == nil or p2.index == nil then
		UseHoverTile = false
	end
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, Text, UseHoverTile)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local UseHoverTile1 = if IsUiModeMatch then true else p2.useHoverTile
	local IsUiModeMatch1 = if p2.useExperienceTileMetadata == nil then IsUiModeMatch else p2.useExperienceTileMetadata
	local UseValidTileBadgesModuleResult = UseValidTileBadgesModule(p2.entry.universeId, p2.topicId, p2.badgeOverride)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		return p3.LocalUserId
	end)
	local UseSelectorResult1 = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else UseSelectorFunction(function(p3)
		return p3.Users
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p3)
		-- upvalues: p2 (copy)
		return p3.InGameUsersByGame[p2.entry.universeId]
	end)
	local UseHasInGameFriendsModuleResult = UseHasInGameFriendsModule(UseSelectorResult, UseSelectorResult1, UseSelectorResult2)
	local UseInGameUserIdsModuleResult = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then UseInGameUserIdsModule(UseSelectorResult, UseSelectorResult2) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v2 = nil
	local UseStateResult2_1 = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagLuaAppGameTileSelectionVideoPlayback then
		v2, UseStateResult2_1 = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function(p3, p4, p5)
			-- upvalues: UseStateResult2_1 (ref), p2 (copy)
			UseStateResult2_1(true)
			
			if p2.onSelectionGained then
				p2.onSelectionGained(p3, p4, p5)
			end
		end, { p2.onSelectionGained })
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (ref), p2 (copy)
			UseStateResult2_1(false)
			
			if p2.onSelectionLost then
				p2.onSelectionLost()
			end
		end, { p2.onSelectionLost })
	end
	if FFlagLuaAppFixHiddenTileVideoCleanup then
		ReactModule.useEffect(function()
			-- upvalues: p2 (copy), UseStateResult2 (copy)
			if p2.isHidden then
				UseStateResult2(false)
			end
		end, { p2.isHidden })
	end
	local v3 = nil
	local NavigationUniverseId = nil
	local UseResult2 = nil
	local Callback = nil
	
	if FFlagLuaAppGameDetailsAttributionFix then
		v3 = UseRoactServiceFunction(RoactNetworking)
		NavigationUniverseId = if p2.entry.navigationUniverseId and p2.entry.navigationUniverseId ~= "" and p2.entry.navigationUniverseId ~= "0" then p2.entry.navigationUniverseId else p2.entry.universeId
		Callback = ReactModule.useCallback(function()
			-- upvalues: p2 (copy), SponsoredGamesRecordClickFunction (upval), v3 (ref)
			local Entry = p2.entry
			
			if Entry.isSponsored then
				SponsoredGamesRecordClickFunction(v3, Entry.adId)
			end
		end, { v3, p2.entry.isSponsored, p2.entry.adId })
		UseResult2 = ReactModule.useCallback(function(p3)
			-- upvalues: p2 (copy), HoverTileCoordinatorModule (upval), FFlagLuaAppHomeTouchAutoplay (upval), VideoEndReasonModule (upval), NavigationUniverseId (ref), VideoPlaybackCoordinator (upval), FFlagLuaAppGameTileInteractionFeedback (upval), GameCollectionItemTypes (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), IntervalPerformanceTracker (upval), Callback (ref)
			if p2.isHovered then
				HoverTileCoordinatorModule.default:reset()
			end
			if FFlagLuaAppHomeTouchAutoplay and p2.videoPlaybackContext and p2.videoPlaybackContext.videoPlaybackCoordinator then
				p2.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReasonModule.TileClicked, nil, NavigationUniverseId, nil)
			else
				VideoPlaybackCoordinator.default:reset(VideoEndReasonModule.TileClicked, nil, NavigationUniverseId, nil)
			end
			if p3 then
				if FFlagLuaAppGameTileInteractionFeedback and p2.onActivated then
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
			if FFlagLuaAppHomeTouchAutoplay and p2.videoPlaybackContext then p2.videoPlaybackContext.videoPlaybackCoordinator else nil
		})
	end
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(Text)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetAvailableGameTileOverflowMenuItemsModule (upval), p2 (copy), FFlagLuaAppEnableSponsoredReportAd (upval)
		return GetAvailableGameTileOverflowMenuItemsModule({
			isSponsored = p2.entry.isSponsored,
			enableExplicitFeedback = p2.enableExplicitFeedback,
			enableSponsoredFeedback = p2.enableSponsoredFeedback,
			enableReportAd = if FFlagLuaAppEnableSponsoredReportAd then p2.enableReportAd else nil
		})
	end, {
		p2.entry.isSponsored,
		p2.enableExplicitFeedback,
		p2.enableSponsoredFeedback,
		if FFlagLuaAppEnableSponsoredReportAd then p2.enableReportAd else nil
	})
	local Element = nil
	
	if LuaAppStabilizeVideoTileReactRoot then
		local UseHasVideoThumbnailSelectorModuleResult = UseHasVideoThumbnailSelectorModule(p2.entry.universeId, p2.topicId)
		local HasPrimaryWideVideoAssetId = p2.entry.primaryWideVideoAssetId ~= nil or UseHasVideoThumbnailSelectorModuleResult
		
		if FFlagLuaAppHomeTouchAutoplay then
			UseTagAsViewportAutoplayCandidateFunction(UseRefResult, p2.videoPlaybackContext, if FFlagLuaAppTileVideoCandidateOnly then HasPrimaryWideVideoAssetId else nil, if FFlagLuaAppFixHiddenTileVideoCleanup then p2.isHidden else nil)
		end
		local UsePreferredInputResult = if not FFlagLuaAppGameTileSelectionVideoPlayback then if FFlagLuaAppEdpMediaGalleryVideoPreview then UsePreferredInputFunction() else nil else nil
		Element = if HasPrimaryWideVideoAssetId and (not FFlagLuaAppHomeTouchAutoplay or not p2.isHidden) then ReactModule.createElement(GameVideoPlaybackDetectorModule, {
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
			pageContext = if FFlagLuaAppTileVideoDeviceMemoryBlocking then p2.appPage else nil,
			videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p2.videoPlaybackContext else nil
		}) else nil
	end
	local Element1 = ReactModule.createElement(v1, CryoModule.Dictionary.join(p2, {
		useExperienceTileMetadata = IsUiModeMatch1,
		hasBackground = UseHoverTile1,
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
		inGameUserIds = if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then UseInGameUserIdsModuleResult else nil,
		networking = if FFlagLuaAppGameDetailsAttributionFix then v3 else nil,
		navigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then NavigationUniverseId else nil,
		onGameTileActivated = if FFlagLuaAppGameDetailsAttributionFix then UseResult2 else nil,
		recordSponsoredGameClick = if FFlagLuaAppGameDetailsAttributionFix then Callback else nil,
		overflowMenuOpen = UseOverflowMenuOpenResult,
		hoverKey = Text,
		triggerFeedback = UseTriggerFeedbackResult,
		availableMenuItems = UseMemoResult,
		onSelectionGained = if FFlagLuaAppGameTileSelectionVideoPlayback then UseResult else p2.onSelectionGained,
		onSelectionLost = if FFlagLuaAppGameTileSelectionVideoPlayback then UseResult1 else p2.onSelectionLost,
		videoPlaybackDetector = if LuaAppStabilizeVideoTileReactRoot then Element else nil
	}))
	
	if LuaAppStabilizeVideoTileReactRoot then
		return Element1
	end
	local UseHasVideoThumbnailSelectorModuleResult = UseHasVideoThumbnailSelectorModule(p2.entry.universeId, p2.topicId)
	local HasPrimaryWideVideoAssetId = p2.entry.primaryWideVideoAssetId ~= nil or UseHasVideoThumbnailSelectorModuleResult
	
	if FFlagLuaAppHomeTouchAutoplay then
		UseTagAsViewportAutoplayCandidateFunction(UseRefResult, p2.videoPlaybackContext, if FFlagLuaAppTileVideoCandidateOnly then HasPrimaryWideVideoAssetId else nil, if FFlagLuaAppFixHiddenTileVideoCleanup then p2.isHidden else nil)
	end
	local UsePreferredInputResult = if not FFlagLuaAppGameTileSelectionVideoPlayback then if FFlagLuaAppEdpMediaGalleryVideoPreview then UsePreferredInputFunction() else nil else nil
	
	if HasPrimaryWideVideoAssetId and (not FFlagLuaAppHomeTouchAutoplay or not p2.isHidden) then
		return ReactModule.createElement(ReactModule.Fragment, {}, {
			GameTile = Element1,
			VideoPlaybackDetector = ReactModule.createElement(GameVideoPlaybackDetectorModule, {
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
				pageContext = if FFlagLuaAppTileVideoDeviceMemoryBlocking then p2.appPage else nil,
				videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p2.videoPlaybackContext else nil
			})
		})
	else
		return Element1
	end
end