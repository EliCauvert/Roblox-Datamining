local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local TModule = require(Parent.t)
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local GameTileModule = require(Parent.GameTile)
local GameTileConstants = GameTileModule.GameTileConstants
local GetGameTileCollectionItemSizeFunction = GameTileModule.getGameTileCollectionItemSize
local _ = require(Parent.VideoUtils)
local _ = require(Parent.AppCommonLib)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local GameCollectionsModule = require(Parent.GameCollections)
local UseCountdownSubtitleTextBindingFunction = GameCollectionsModule.useCountdownSubtitleTextBinding
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local UseRenderGameCollectionItemFunction = GameCollectionsModule.useRenderGameCollectionItem
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local IsSeeAllTileEnabledFunction = GameCollectionsModule.isSeeAllTileEnabled
local UseGameSortHeaderButtonParamsFunction = GameCollectionsModule.useGameSortHeaderButtonParams
local UseIsHoldToPlayEnabledForGamesFunction = GameCollectionsModule.useIsHoldToPlayEnabledForGames
local WaitForPropWrapper = GameCollectionsModule.WaitForPropWrapper
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local UseControllerBarFocusNavigationBindingsFunction = GameCollectionsModule.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings
local UseGameSortAnalyticsFunction = GameCollectionsModule.useGameSortAnalytics
local GameSortImpressionsDetector = GameCollectionsModule.GameSortImpressionsDetector
local UseGameSortDataFunction = GameCollectionsModule.useGameSortData
local UseGameSortImpressionsParamsFunction = GameCollectionsModule.useGameSortImpressionsParams
local UseGameSortTooltipParamsFunction = GameCollectionsModule.useGameSortTooltipParams
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ScrollDetector = require(Parent.ScrollTelemetry).ScrollDetector
local FrameBoundsImpressionsTracker = require(Parent.Impressions).FrameBoundsImpressionsTracker
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local HoldToPlayLauncher = require(Parent.HoldToPlay).HoldToPlayLauncher
local UseHoldToPlayStateAndCallbacksFunction = require(Parent.HoldToPlay).useHoldToPlayStateAndCallbacks
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local HoverTileCoordinator = require(Parent.GameTile).HoverTileCoordinator
local UseVideoAnalyticsFunction = require(Parent.GameTile).useVideoAnalytics
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local SocialUpsellModule = require(Parent.SocialUpsell)
local AnalyticsEnum = SocialUpsellModule.Analytics.Enum
local SocialUpsellType = SocialUpsellModule.Enum.SocialUpsellType
local Modules = DiscoveryMonolith.Modules
local UseAmpUpsellActionModule = require(Modules.Personalization.Games.useAmpUpsellAction)
local UseLoadGamesForSortFromGamesApiModule = require(Modules.Personalization.Games.useLoadGamesForSortFromGamesApi)
local UseLoadMoreGamesModule = require(Modules.Personalization.Games.useLoadMoreGames)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppHeaderButtonText = SharedFlagsModule.FFlagLuaAppHeaderButtonText
local FFlagSearchOmniAutocompletePage = SharedFlagsModule.FFlagSearchOmniAutocompletePage
local FFlagLuaAppHomeGameCarouselRemount = require(Parent.SharedFlags).FFlagLuaAppHomeGameCarouselRemount
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(Parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(Parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics = require(Parent.SharedFlags).FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics
local FFlagLuaAppHideCarouselSubtitleChevron = require(Parent.SharedFlags).FFlagLuaAppHideCarouselSubtitleChevron
local GameCarousel = if FFlagLuaAppGameCarouselAmpUpsellAction then "gameCarousel" else nil
local StrictInterfaceResult = TModule.strictInterface({
	useGridTiles = TModule.optional(TModule.boolean),
	gameSortId = TModule.string,
	sortIndex = TModule.number,
	pageContext = TModule.string,
	scrollViewPositionChangedSignal = TModule.optional(TModule.table),
	friendFooterEnabled = TModule.optional(TModule.boolean),
	playerCountStyle = TModule.optional(TModule.string),
	isSponsoredFooterAllowed = TModule.optional(TModule.boolean),
	componentType = TModule.optional(TModule.string),
	hideSeeAll = TModule.optional(TModule.boolean),
	gameTileLayoutType = TModule.optional(TModule.string),
	infoText = TModule.optional(TModule.string),
	endTimestamp = TModule.optional(TModule.number),
	countdownString = TModule.optional(TModule.string),
	linkPath = TModule.optional(TModule.string),
	subtitleLinkPath = TModule.optional(TModule.string),
	ampUpsellFeatureName = if FFlagLuaAppGameCarouselAmpUpsellAction then TModule.optional(TModule.string) else nil,
	ampUpsellNamespace = if FFlagLuaAppGameCarouselAmpUpsellAction then TModule.optional(TModule.string) else nil,
	refreshFeed = if FFlagLuaAppGameCarouselAmpUpsellAction then TModule.optional(TModule.callback) else nil,
	gridSupportAllowed = TModule.optional(TModule.boolean),
	isHoverSupportEnabled = TModule.optional(TModule.boolean),
	startRow = TModule.optional(TModule.number),
	playButtonStyle = TModule.optional(TModule.string),
	sideMargin = if FFlagLuaAppCompositionAlways then nil else TModule.optional(TModule.number),
	backgroundMuralUrl = TModule.optional(TModule.string),
	headerButtonText = if FFlagLuaAppHeaderButtonText then TModule.optional(TModule.string) else nil,
	shouldHideTileMetadata = TModule.optional(TModule.boolean),
	shouldHideTileTitle = TModule.optional(TModule.boolean),
	containedTile = TModule.optional(TModule.boolean),
	shouldUseFrameBoundsForImpressions = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.boolean) else nil,
	layoutOverrides = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.table) else nil,
	numUpdatesToDelayImpressions = TModule.optional(TModule.number),
	selectionOrderBase = TModule.optional(TModule.number),
	defaultContainerSize = TModule.optional(TModule.Vector2),
	appCompositionEnabled = TModule.optional(TModule.boolean),
	onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
	hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then TModule.optional(TModule.boolean) else nil,
	videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.table) else nil
})

return ReactModule.memo(function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), UseAppPolicyFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), UseBreakpointXOrSmallerFunction (copy), GetGameTileCollectionItemSizeFunction (copy), ReactModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), UseGameSortDataFunction (copy), UseLoadGamesForSortFromGamesApiModule (copy), DiscoveryTypesModule (copy), UseLoadMoreGamesModule (copy), UseGameSortAnalyticsFunction (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), OmniFeedConstants (copy), FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics (copy), AppPage (copy), AnalyticsEnum (copy), SocialUpsellType (copy), UseAmpUpsellActionModule (copy), GameCarousel (copy), UseGameSortHeaderButtonParamsFunction (copy), FFlagLuaAppHeaderButtonText (copy), UseGameSortTooltipParamsFunction (copy), UseGameSortImpressionsParamsFunction (copy), UseVideoAnalyticsFunction (copy), UseIsHoldToPlayEnabledForGamesFunction (copy), UseHoldToPlayStateAndCallbacksFunction (copy), UseControllerBarFocusNavigationBindingsFunction (copy), FFlagSearchOmniAutocompletePage (copy), UseGameCollectionLayoutParamsFunction (copy), UseCollectionLayoutFunction (copy), GameTileConstants (copy), UseTextSizeOffsetFunction (copy), UseGetGameTileHeightFunction (copy), IsSeeAllTileEnabledFunction (copy), UseRenderGameCollectionItemFunction (copy), DiscoveryAnalyticsModule (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), UseCountdownSubtitleTextBindingFunction (copy), HoverTileCoordinator (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy), GameSortImpressionsDetector (copy), FFlagLuaAppHomeGameCarouselRemount (copy), CollectionCarousel (copy), FFlagLuaAppHideCarouselSubtitleChevron (copy), WaitForPropWrapper (copy), ScrollDetector (copy), HoldToPlayLauncher (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local IsUsePreferredInputResultMatch: boolean = p1.isHoverSupportEnabled and (UseAppPolicyResult and UsePreferredInputResult == ResponsiveModule.Input.Pointer)
	local GameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppNarrowTileSmallerFooterFont or FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount then
		local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
		local UseBreakpointXOrSmallerResult1 = FFlagLuaAppCompositionAlways1 and (GameTileLayoutType == "Narrow" and UseBreakpointXOrSmallerResult)
		v1 = if FFlagLuaAppNarrowTileSmallerFooterFont then UseBreakpointXOrSmallerResult1 else nil
		v2 = if FFlagLuaAppNarrowTileHideRating then UseBreakpointXOrSmallerResult1 else nil
		v3 = if FFlagLuaAppNarrowTileHidePlayerCount then UseBreakpointXOrSmallerResult1 else nil
	end
	local GameTileCollectionItemSize = if FFlagLuaAppCompositionAlways1 then GetGameTileCollectionItemSizeFunction(GameTileLayoutType) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	UseRefResult.current = UseStateResult
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagLuaAppHomeTouchAutoplay then
		local ViewportVideoAutoplayController = if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
		UseResult = ReactModule.useCallback(function()
			-- upvalues: ViewportVideoAutoplayController (copy)
			if ViewportVideoAutoplayController then
				ViewportVideoAutoplayController:onScrollStart()
			end
		end, { ViewportVideoAutoplayController })
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: ViewportVideoAutoplayController (copy), UseRefResult (copy)
			if ViewportVideoAutoplayController then
				ViewportVideoAutoplayController:onScrollSettled("X", p2, UseRefResult)
			end
		end, { ViewportVideoAutoplayController, UseRefResult })
	end
	local UseGameSortDataResult = UseGameSortDataFunction(p1.gameSortId, p1.pageContext)
	local Entries = UseGameSortDataResult.gameSortContents and UseGameSortDataResult.gameSortContents.entries or {}
	local UseLoadGamesForSortFromGamesApiModuleResult = UseLoadGamesForSortFromGamesApiModule(p1.gameSortId)
	ReactModule.useEffect(function()
		-- upvalues: UseGameSortDataResult (copy), DiscoveryTypesModule (upval), UseLoadGamesForSortFromGamesApiModuleResult (copy)
		if UseGameSortDataResult.sort and UseGameSortDataResult.sort.dataSource == DiscoveryTypesModule.DataSourceType.ExploreApi then
			UseLoadGamesForSortFromGamesApiModuleResult()
		end
	end, { p1.gameSortId, UseGameSortDataResult.sort })
	local UseLoadMoreGamesModuleResult = UseLoadMoreGamesModule(UseGameSortDataResult.gameSortContents, UseGameSortDataResult.sort, UseGameSortDataResult.gameSortFetchingStatus, p1.pageContext, UseGameSortDataResult.sortIndex)
	local UseGameSortAnalyticsResult, UseGameSortAnalyticsResult2, UseGameSortAnalyticsResult3, UseGameSortAnalyticsResult4 = UseGameSortAnalyticsFunction(UseGameSortDataResult.sort, UseGameSortDataResult.isOmni, p1.sortIndex, p1.pageContext, UseRefResult1, Entries, #Entries, p1.startRow)
	local UseResult2 = if FFlagLuaAppGameCarouselAmpUpsellAction then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), OmniFeedConstants (upval)
		if p1.refreshFeed then
			p1.refreshFeed(OmniFeedConstants.OmniRecommendationsRequestIntent.AmpUpsellFeatureGranted)
			
			return
		end
	end, { p1.refreshFeed }) else nil
	local UseMemoResult = if FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), AppPage (upval), AnalyticsEnum (upval), SocialUpsellType (upval)
		return {
			upsellEntrySurface = if p1.pageContext == AppPage.Home then AnalyticsEnum.UpsellEntrySurfaceType.Homepage else nil,
			upsellComponent = AnalyticsEnum.UpsellComponent.Carousel,
			upsellStage = AnalyticsEnum.UpsellStage.Fae,
			upsellPurpose = SocialUpsellType.FacialAgeEstimation
		}
	end, { p1.pageContext }) else nil
	local UseAmpUpsellActionModuleResult = if FFlagLuaAppGameCarouselAmpUpsellAction then UseAmpUpsellActionModule(p1.ampUpsellFeatureName, p1.ampUpsellNamespace, UseResult2, GameCarousel, if FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics then UseMemoResult else nil) else nil
	local UseGameSortHeaderButtonParamsResult, UseGameSortHeaderButtonParamsResult2, UseGameSortHeaderButtonParamsResult3 = UseGameSortHeaderButtonParamsFunction(UseGameSortAnalyticsResult3, UseGameSortDataResult.sort, UseGameSortDataResult.isOmni, UseGameSortDataResult.sortIndex, UseGameSortDataResult.gamesApiSortPageId, p1.gameSortId, p1.pageContext, p1.linkPath, p1.subtitleLinkPath, if FFlagLuaAppHeaderButtonText then p1.headerButtonText else nil, if FFlagLuaAppGameCarouselAmpUpsellAction then UseAmpUpsellActionModuleResult else nil)
	local UseGameSortTooltipParamsResult, UseGameSortTooltipParamsResult2 = UseGameSortTooltipParamsFunction(UseGameSortDataResult.sort, UseGameSortDataResult.isOmni, p1.infoText)
	local UseGameSortImpressionsParamsResult, UseGameSortImpressionsParamsResult2, UseGameSortImpressionsParamsResult3 = UseGameSortImpressionsParamsFunction(UseGameSortDataResult.sort, UseGameSortDataResult.isOmni, p1.sortIndex, p1.pageContext, p1.useGridTiles, p1.componentType, UseGameSortDataResult.gamesApiSortPageId, p1.gameSortId, p1.scrollViewPositionChangedSignal, nil, p1.startRow, Entries)
	local GameCarouselName: string = `GameCarousel_{p1.gameSortId}{p1.sortIndex}`
	local UseVideoAnalyticsResult = UseVideoAnalyticsFunction(UseGameSortDataResult.sort, UseGameSortDataResult.isOmni, p1.pageContext, p1.sortIndex, Entries)
	local UseIsHoldToPlayEnabledForGamesResult = UseIsHoldToPlayEnabledForGamesFunction()
	local UseHoldToPlayStateAndCallbacksResult = UseHoldToPlayStateAndCallbacksFunction()
	local UseControllerBarFocusNavigationBindingsResult = UseControllerBarFocusNavigationBindingsFunction(UseGameSortHeaderButtonParamsResult, if UseIsHoldToPlayEnabledForGamesResult then UseHoldToPlayStateAndCallbacksResult.holdToPlayEventHandler else nil)
	ReactModule.useEffect(function()
		-- upvalues: UseControllerBarFocusNavigationBindingsResult (copy), UseStateResult (copy)
		if UseControllerBarFocusNavigationBindingsResult then
			UseControllerBarFocusNavigationBindingsResult(UseStateResult)
		end
	end, {
		UseControllerBarFocusNavigationBindingsResult,
		UseStateResult
	})
	local UseGameCollectionLayoutParamsResult = UseGameCollectionLayoutParamsFunction(GameTileLayoutType, UseStateResult, false, if FFlagSearchOmniAutocompletePage and p1.layoutOverrides then p1.layoutOverrides elseif UseAppPolicyResult then nil else { sideMargin = p1.sideMargin }, p1.defaultContainerSize)
	local ItemsPerRow = UseCollectionLayoutFunction(GameTileCollectionItemSize).itemsPerRow
	local BackgroundMuralUrl = p1.backgroundMuralUrl
	local ShouldHideTileTitle = p1.shouldHideTileTitle or false
	local ShouldHideTileMetadata = p1.shouldHideTileMetadata or false
	local IsNarrow = if p1.containedTile == nil then UseAppPolicyResult and p1.gridSupportAllowed and p1.gameTileLayoutType == "Narrow" or BackgroundMuralUrl ~= nil and BackgroundMuralUrl ~= "" else p1.containedTile
	local TitleTextLines = GameTileConstants.TileTextLines[GameTileLayoutType] and GameTileConstants.TileTextLines[GameTileLayoutType].titleTextLines
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseGetGameTileHeightResult = UseGetGameTileHeightFunction(IsUsePreferredInputResultMatch, GameTileLayoutType, IsNarrow, ShouldHideTileMetadata, ShouldHideTileTitle, UseTextSizeOffsetResult, nil, TitleTextLines, if FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount then v2 or v3 else nil)
	local UseRenderGameCollectionItemResult = UseRenderGameCollectionItemFunction(if GameTileLayoutType == "Narrow" and not p1.playerCountStyle then GameTileConstants.PlayerCountStyleValues.Footer else p1.playerCountStyle, p1.isSponsoredFooterAllowed, GameTileLayoutType, p1.friendFooterEnabled, p1.pageContext == AppPage.Home, GameCarouselName, IsUsePreferredInputResultMatch, UseGameSortAnalyticsResult, UseGameSortAnalyticsResult2, DiscoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, UseGameSortHeaderButtonParamsResult, if UseGameSortDataResult.isOmni and UseGameSortDataResult.sort then UseGameSortDataResult.sort.topicId else nil, if IsSeeAllTileEnabledFunction(p1.hideSeeAll, UseGameCollectionLayoutParamsResult.maxTilesToShow, if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseGameCollectionLayoutParamsResult.numColumns, #Entries, UseGameSortHeaderButtonParamsResult) then UseGameCollectionLayoutParamsResult.maxTilesToShow or #Entries + 1 else nil, nil, p1.playButtonStyle, IsNarrow, ShouldHideTileTitle, ShouldHideTileMetadata, if UseIsHoldToPlayEnabledForGamesResult then UseHoldToPlayStateAndCallbacksResult.onHoldableFocused else nil, if UseIsHoldToPlayEnabledForGamesResult then UseHoldToPlayStateAndCallbacksResult.onHoldableUnfocused else nil, if UseIsHoldToPlayEnabledForGamesResult then UseHoldToPlayStateAndCallbacksResult.shouldDisableHoldable else nil, UseTextSizeOffsetResult, TitleTextLines, nil, nil, UseVideoAnalyticsResult, nil, p1.selectionOrderBase, nil, nil, nil, if FFlagLuaAppTileVideoDeviceMemoryBlocking then p1.pageContext else nil, nil, nil, nil, nil, nil, nil, nil, nil, if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil, if FFlagLuaAppNarrowTileSmallerFooterFont then v1 else nil, if FFlagLuaAppNarrowTileHideRating then v2 else nil, if FFlagLuaAppNarrowTileHidePlayerCount then v3 else nil, if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil, if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil)
	local UseCountdownSubtitleTextBindingResult = UseCountdownSubtitleTextBindingFunction(p1.endTimestamp, p1.countdownString, UseGameSortDataResult.sort and UseGameSortDataResult.sort.subtitle or "")
	local UseCountdownSubtitleTextBindingResult1 = if p1.endTimestamp and p1.countdownString then UseCountdownSubtitleTextBindingResult else UseGameSortDataResult.sort and UseGameSortDataResult.sort.subtitle or nil
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: HoverTileCoordinator (upval)
		HoverTileCoordinator.default:reset()
	end, {})
	
	return if UseGameSortDataResult.gameSortDataFound then ReactModule.createElement(ReactModule.Fragment, nil, {
		[if FFlagLuaAppHomeGameCarouselRemount and p1.pageContext == AppPage.Home then `GameCarousel_{p1.gameSortId}` else "GameCarousel"] = ReactModule.createElement(CollectionCarousel, {
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then GameTileCollectionItemSize else nil,
			title = UseGameSortDataResult.sort and UseGameSortDataResult.sort.displayName or "",
			subtitle = UseCountdownSubtitleTextBindingResult1,
			backgroundMuralUrl = BackgroundMuralUrl,
			onViewableItemsChanged = UseGameSortImpressionsParamsResult3,
			onChangeCanvasPosition = UseGameSortImpressionsParamsResult3,
			containerRef = UseStateResult2,
			scrollingFrameRef = UseRefResult1,
			tooltipInfoText = UseGameSortTooltipParamsResult2,
			hideHeaderButton = p1.hideSeeAll,
			items = Entries,
			onActivateHeader = UseGameSortHeaderButtonParamsResult,
			onActivateSubtitle = if p1.subtitleLinkPath or FFlagLuaAppGameCarouselAmpUpsellAction and UseAmpUpsellActionModuleResult then UseGameSortHeaderButtonParamsResult3 else nil,
			hideSubtitleChevron = if FFlagLuaAppHideCarouselSubtitleChevron then not p1.subtitleLinkPath else nil,
			onActivateInfoIcon = UseGameSortTooltipParamsResult,
			renderItem = UseRenderGameCollectionItemResult,
			getItemHeight = UseGetGameTileHeightResult,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseGameCollectionLayoutParamsResult.maxTilesToShow,
			headerButtonText = UseGameSortHeaderButtonParamsResult2,
			thresholdFromEnd = UseGameCollectionLayoutParamsResult.loadMoreThreshold,
			onReachedThresholdFromEnd = UseLoadMoreGamesModuleResult,
			onScrollButtonEnter = UseResult3,
			enableHoverOverflow = if FFlagLuaAppCompositionAlways1 then IsUsePreferredInputResultMatch else nil,
			testId = if p1.gameSortId then `--{p0.gameSortId}-game-collection-carousel` else nil
		}),
		GameSortImpressionsDetector = ReactModule.createElement(WaitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if FFlagSearchOmniAutocompletePage then (FFlagLuaAppUseFrameBoundsImpressions or p1.shouldUseFrameBoundsForImpressions) and ReactModule.createElement(FrameBoundsImpressionsTracker, {
				parentRef = UseRefResult1,
				pageContext = p1.pageContext,
				impressionsTag = GameCarouselName,
				scrollViewPositionChangedSignal = UseGameSortImpressionsParamsResult2,
				sendImpressions = UseGameSortImpressionsParamsResult,
				dataUpdatedTimestamp = UseGameSortDataResult.gameSortContents and UseGameSortDataResult.gameSortContents.updatedTimestamp or nil
			}) or ReactModule.createElement(ScreenSizeImpressionsTracker, {
				parentRef = UseRefResult1,
				pageContext = p1.pageContext,
				impressionsTag = GameCarouselName,
				scrollViewPositionChangedSignal = UseGameSortImpressionsParamsResult2,
				sendImpressions = UseGameSortImpressionsParamsResult,
				dataUpdatedTimestamp = UseGameSortDataResult.gameSortContents and UseGameSortDataResult.gameSortContents.updatedTimestamp or nil
			}) else ReactModule.createElement(GameSortImpressionsDetector, {
				parentRef = UseRefResult1,
				pageContext = p1.pageContext,
				impressionsTag = GameCarouselName,
				scrollViewPositionChangedSignal = UseGameSortImpressionsParamsResult2,
				sendGameImpressions = UseGameSortImpressionsParamsResult,
				dataUpdatedTimestamp = UseGameSortDataResult.gameSortContents and UseGameSortDataResult.gameSortContents.updatedTimestamp or nil
			})
		}),
		ScrollDetector = ReactModule.createElement(ScrollDetector, {
			scrollingFrameRef = UseRefResult1,
			sendScrollEvent = UseGameSortAnalyticsResult4,
			onScrollStart = if FFlagLuaAppHomeTouchAutoplay then UseResult else nil,
			onScrollSettled = if FFlagLuaAppHomeTouchAutoplay then UseResult1 else nil
		}),
		HoldToPlayLauncher = if UseIsHoldToPlayEnabledForGamesResult and UseHoldToPlayStateAndCallbacksResult.shouldRenderHoldToPlayLauncher then ReactModule.createElement(HoldToPlayLauncher, {
			selectedIndex = UseHoldToPlayStateAndCallbacksResult.selectedIndex,
			selectedEntry = UseHoldToPlayStateAndCallbacksResult.selectedEntry,
			selectedNavigationUniverseId = UseHoldToPlayStateAndCallbacksResult.selectedNavigationUniverseId,
			holdState = UseHoldToPlayStateAndCallbacksResult.holdState,
			holdProgress = UseHoldToPlayStateAndCallbacksResult.holdProgress,
			cancelHold = UseHoldToPlayStateAndCallbacksResult.cancelHold,
			launchContext = DiscoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p1.pageContext,
			reportExperienceLaunched = UseGameSortAnalyticsResult2
		}) else nil
	}) else nil
end)