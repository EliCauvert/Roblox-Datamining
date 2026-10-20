local GameCollections = script:FindFirstAncestor("GameCollections")
local UseControllerBarFocusNavigationBindingsFunction = require(GameCollections.GameCollectionNavigationBindings).useControllerBarFocusNavigationBindings
local UseGetGameTileHeightModule = require(GameCollections.useGetGameTileHeight)
local UseIsHoldToPlayEnabledForGamesModule = require(GameCollections.useIsHoldToPlayEnabledForGames)
local UseRenderGameCollectionItemModule = require(GameCollections.useRenderGameCollectionItem)
local UseGameCollectionLayoutParamsModule = require(GameCollections.useGameCollectionLayoutParams)
local UseGameSortAnalyticsModule = require(GameCollections.useGameSortAnalytics)
local GameSortImpressionsDetectorModule = require(GameCollections.Impressions.GameSortImpressionsDetector)
local UseGameSortDataModule = require(GameCollections.useGameSortData)
local UseGameSortImpressionsParamsModule = require(GameCollections.Impressions.useGameSortImpressionsParams)
local UseGameSortTooltipParamsModule = require(GameCollections.useGameSortTooltipParams)
local WaitForPropWrapperModule = require(GameCollections.Impressions.WaitForPropWrapper)
local UseSizeAdjustedEntriesModule = require(GameCollections.useSizeAdjustedEntries)
local Parent = GameCollections.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local TModule = require(Parent.t)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local ValidatePropsFunction = DiscoveryUtilsModule.validateProps
local ComposeRefsFunction = DiscoveryUtilsModule.composeRefs
local GameTileModule = require(Parent.GameTile)
local GetGameTileCollectionItemSizeFunction = GameTileModule.getGameTileCollectionItemSize
local GetGameTileHiddenStoreFunction = GameTileModule.getGameTileHiddenStore
local GameTileConstants = GameTileModule.GameTileConstants
local _ = require(Parent.VideoUtils)
local _ = require(Parent.AppCommonLib)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local CollectionGrid = require(Parent.CollectionViews).CollectionGrid
local UseCollectionLayoutFunction = require(Parent.CollectionViews).useCollectionLayout
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local HoldToPlayModule = require(Parent.HoldToPlay)
local HoldToPlayLauncher = HoldToPlayModule.HoldToPlayLauncher
local UseHoldToPlayStateAndCallbacksFunction = HoldToPlayModule.useHoldToPlayStateAndCallbacks
local _ = require(Parent.DiscoveryTypes)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.CollectionViews)
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(Parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppFixSearchImpressions = require(Parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local FFlagLuaAppFixCompositionSizeOverrideGap = require(Parent.SharedFlags).FFlagLuaAppFixCompositionSizeOverrideGap
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppRfyRevealRows = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagLuaAppSortHeaderAnchorTag = require(Parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local FFlagLuaAppHomeReduceRenders = require(Parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local FFlagLuaAppRfyRevealRowsFocusFix = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRowsFocusFix
local LuaAppGameGridBufferRowsBelowScreen = game:DefineFastInt("LuaAppGameGridBufferRowsBelowScreen", 2)
local LuaAppGameGridBufferRowsAboveScreen = game:DefineFastInt("LuaAppGameGridBufferRowsAboveScreen", 1)
local StrictInterfaceResult = TModule.strictInterface({
	entries = TModule.optional(TModule.table),
	title = TModule.optional(TModule.string),
	headerComponent = TModule.optional(TModule.table),
	headerTag = if FFlagLuaAppSortHeaderAnchorTag then TModule.optional(TModule.string) else nil,
	verticalScrollingFrameRef = TModule.table,
	gridContainerRef = if FFlagLuaAppRfyRevealRowsFocusFix then TModule.optional(TModule.union(TModule.table, TModule.callback)) else nil,
	LayoutOrder = if FFlagLuaAppRfyRevealRows then TModule.optional(TModule.number) else nil,
	ZIndex = if FFlagLuaAppRfyRevealRows then TModule.optional(TModule.number) else nil,
	maxNumRows = TModule.optional(TModule.number),
	useGridTiles = TModule.optional(TModule.boolean),
	gameSortId = TModule.string,
	sortIndex = TModule.number,
	pageContext = TModule.string,
	scrollViewPositionChangedSignal = TModule.optional(TModule.table),
	friendFooterEnabled = TModule.optional(TModule.boolean),
	playerCountStyle = TModule.optional(TModule.string),
	isSponsoredFooterAllowed = TModule.optional(TModule.boolean),
	componentType = TModule.optional(TModule.string),
	gameTileLayoutType = TModule.optional(TModule.string),
	infoText = TModule.optional(TModule.string),
	linkPath = TModule.optional(TModule.string),
	gridSupportAllowed = TModule.optional(TModule.boolean),
	isHoverSupportEnabled = TModule.optional(TModule.boolean),
	onItemsPerRowChanged = TModule.optional(TModule.callback),
	startRow = TModule.optional(TModule.number),
	playButtonStyle = TModule.optional(TModule.string),
	sideMargin = if FFlagLuaAppCompositionAlways then nil else TModule.optional(TModule.number),
	shouldHideTileMetadata = TModule.optional(TModule.boolean),
	shouldHideTileTitle = TModule.optional(TModule.boolean),
	containedTile = TModule.optional(TModule.boolean),
	numUpdatesToDelayImpressions = TModule.optional(TModule.number),
	selectionOrderBase = TModule.optional(TModule.number),
	enableExplicitFeedback = TModule.optional(TModule.boolean),
	sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then TModule.optional(TModule.string) else nil,
	enableSponsoredFeedback = TModule.optional(TModule.boolean),
	enableReportAd = if FFlagLuaAppEnableSponsoredReportAd then TModule.optional(TModule.boolean) else nil,
	searchParams = TModule.optional(TModule.table),
	layoutOverrides = TModule.optional(TModule.table),
	isSponsoredRatingFooterAllowed = TModule.optional(TModule.boolean),
	launchExperienceEventContextOverride = TModule.optional(TModule.string),
	appCompositionEnabled = TModule.optional(TModule.boolean),
	onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
	videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.table) else nil
})

return ReactModule.memo(function(Frame)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), UseAppPolicyFunction (copy), UsePreferredInputFunction (copy), FFlagLuaAppHomeReduceRenders (copy), LuaAppGameGridBufferRowsBelowScreen (copy), ResponsiveModule (copy), LuaAppGameGridBufferRowsAboveScreen (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), UseBreakpointXOrSmallerFunction (copy), GetGameTileCollectionItemSizeFunction (copy), ReactModule (copy), FFlagLuaAppRfyRevealRowsFocusFix (copy), ComposeRefsFunction (copy), UseGameSortDataModule (copy), CryoModule (copy), UseGameCollectionLayoutParamsModule (copy), FFlagLuaAppFixCompositionSizeOverrideGap (copy), UseCollectionLayoutFunction (copy), UseSizeAdjustedEntriesModule (copy), UseGameSortAnalyticsModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), GameTileModule (copy), UseGameSortTooltipParamsModule (copy), UseGameSortImpressionsParamsModule (copy), FFlagLuaAppFixSearchImpressions (copy), UseIsHoldToPlayEnabledForGamesModule (copy), UseHoldToPlayStateAndCallbacksFunction (copy), UseControllerBarFocusNavigationBindingsFunction (copy), UseTextSizeOffsetFunction (copy), GameTileConstants (copy), UseGetGameTileHeightModule (copy), GetGameTileHiddenStoreFunction (copy), SignalsReactModule (copy), UseRenderGameCollectionItemModule (copy), AppPage (copy), DiscoveryAnalyticsModule (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), GameSortImpressionsDetectorModule (copy), CollectionGrid (copy), FFlagLuaAppRfyRevealRows (copy), FFlagLuaAppSortHeaderAnchorTag (copy), WaitForPropWrapperModule (copy), HoldToPlayLauncher (copy)
	ValidatePropsFunction(StrictInterfaceResult, Frame)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.useGridPageLayout()
	end)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local LuaAppGameGridBufferRowsBelowScreen1 = if FFlagLuaAppHomeReduceRenders then LuaAppGameGridBufferRowsBelowScreen elseif UsePreferredInputResult == ResponsiveModule.Input.Directional then 4 else 2
	local LuaAppGameGridBufferRowsAboveScreen1 = if FFlagLuaAppHomeReduceRenders then LuaAppGameGridBufferRowsAboveScreen elseif UsePreferredInputResult == ResponsiveModule.Input.Directional then 4 else 1
	local IsUsePreferredInputResultMatch: boolean = Frame.isHoverSupportEnabled and (UseAppPolicyResult and UsePreferredInputResult == ResponsiveModule.Input.Pointer)
	local GameTileLayoutType = Frame.gameTileLayoutType or "Narrow"
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or Frame.appCompositionEnabled
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
	local UseMemoResult = if FFlagLuaAppRfyRevealRowsFocusFix then ReactModule.useMemo(function()
		-- upvalues: ComposeRefsFunction (upval), UseStateResult2 (copy), Frame (copy)
		return (ComposeRefsFunction(UseStateResult2, Frame.gridContainerRef))
	end, { Frame.gridContainerRef }) else nil
	local UseGameSortDataModuleResult = UseGameSortDataModule(Frame.gameSortId, Frame.pageContext, Frame.searchParams and Frame.searchParams.searchUuid)
	local UseGameCollectionLayoutParamsModuleResult = UseGameCollectionLayoutParamsModule(GameTileLayoutType, UseStateResult, false, (ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyResult (copy), Frame (copy), CryoModule (upval)
		local SideMargin = if UseAppPolicyResult then nil else Frame.sideMargin
		
		return if Frame.layoutOverrides or SideMargin then CryoModule.Dictionary.join(Frame.layoutOverrides or {}, {
			sideMargin = if Frame.layoutOverrides and Frame.layoutOverrides.sideMargin then Frame.layoutOverrides.sideMargin else SideMargin
		}) else nil
	end, {
		Frame.layoutOverrides,
		UseAppPolicyResult,
		Frame.sideMargin
	})))
	local ItemsPerRow = nil
	local UseSizeAdjustedEntriesModuleResult = nil
	
	if FFlagLuaAppFixCompositionSizeOverrideGap then
		local UseCollectionLayoutResult = UseCollectionLayoutFunction(GameTileCollectionItemSize)
		ItemsPerRow = UseCollectionLayoutResult.itemsPerRow
		UseSizeAdjustedEntriesModuleResult = UseSizeAdjustedEntriesModule(Frame.entries, if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.gutter else UseGameCollectionLayoutParamsModuleResult.columnGap, if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.verticalGap else UseGameCollectionLayoutParamsModuleResult.verticalPadding)
	else
		UseSizeAdjustedEntriesModuleResult = UseSizeAdjustedEntriesModule(Frame.entries, UseGameCollectionLayoutParamsModuleResult.columnGap, UseGameCollectionLayoutParamsModuleResult.verticalPadding)
		ItemsPerRow = UseCollectionLayoutFunction(GameTileCollectionItemSize).itemsPerRow
	end
	local ItemsPerRow1 = (if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseGameCollectionLayoutParamsModuleResult.numColumns) or 0
	local UseGameSortAnalyticsModuleResult, UseGameSortAnalyticsModuleResult2 = UseGameSortAnalyticsModule(UseGameSortDataModuleResult.sort, UseGameSortDataModuleResult.isOmni, Frame.sortIndex, Frame.pageContext, nil, UseSizeAdjustedEntriesModuleResult, ItemsPerRow1, Frame.startRow)
	local UseVideoAnalyticsResult = if FFlagLuaAppHomeTouchAutoplay then GameTileModule.useVideoAnalytics(UseGameSortDataModuleResult.sort, UseGameSortDataModuleResult.isOmni, Frame.pageContext, Frame.sortIndex, UseSizeAdjustedEntriesModuleResult) else nil
	local UseGameSortTooltipParamsModuleResult, UseGameSortTooltipParamsModuleResult2 = UseGameSortTooltipParamsModule(UseGameSortDataModuleResult.sort, UseGameSortDataModuleResult.isOmni, Frame.infoText)
	local UseGameSortImpressionsParamsModuleResult, UseGameSortImpressionsParamsModuleResult2, UseGameSortImpressionsParamsModuleResult3 = UseGameSortImpressionsParamsModule(UseGameSortDataModuleResult.sort, UseGameSortDataModuleResult.isOmni, Frame.sortIndex, Frame.pageContext, Frame.useGridTiles, Frame.componentType, UseGameSortDataModuleResult.gamesApiSortPageId, Frame.gameSortId, Frame.scrollViewPositionChangedSignal, ItemsPerRow1, Frame.startRow, UseSizeAdjustedEntriesModuleResult, Frame.searchParams)
	local SearchUuid = if FFlagLuaAppFixSearchImpressions and Frame.searchParams then Frame.searchParams.searchUuid else nil
	local UseMemoResult1 = if FFlagLuaAppFixSearchImpressions then ReactModule.useMemo(function(): string
		-- upvalues: Frame (copy), SearchUuid (copy)
		local GameGridName: string = `GameGrid_{Frame.pageContext}`
		
		if SearchUuid then
			GameGridName ..= `_{SearchUuid}`
		end
		return GameGridName .. `_{Frame.gameSortId}_{Frame.sortIndex}`
	end, {
		Frame.pageContext,
		SearchUuid,
		Frame.gameSortId,
		Frame.sortIndex
	}) else `GameGrid_{Frame.gameSortId}_{Frame.sortIndex}`
	local UseIsHoldToPlayEnabledForGamesModuleResult = UseIsHoldToPlayEnabledForGamesModule()
	local UseHoldToPlayStateAndCallbacksResult = UseHoldToPlayStateAndCallbacksFunction()
	local UseControllerBarFocusNavigationBindingsResult = UseControllerBarFocusNavigationBindingsFunction(nil, if UseIsHoldToPlayEnabledForGamesModuleResult then UseHoldToPlayStateAndCallbacksResult.holdToPlayEventHandler else nil)
	ReactModule.useEffect(function()
		-- upvalues: UseControllerBarFocusNavigationBindingsResult (copy), UseStateResult (copy)
		if UseControllerBarFocusNavigationBindingsResult then
			UseControllerBarFocusNavigationBindingsResult(UseStateResult)
		end
	end, {
		UseControllerBarFocusNavigationBindingsResult,
		UseStateResult
	})
	local ShouldHideTileTitle = Frame.shouldHideTileTitle or false
	local ShouldHideTileMetadata = Frame.shouldHideTileMetadata or false
	local ContainedTile = Frame.containedTile or false
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local TitleTextLines = GameTileConstants.TileTextLines[GameTileLayoutType] and GameTileConstants.TileTextLines[GameTileLayoutType].titleTextLines
	local UseGetGameTileHeightModuleResult = UseGetGameTileHeightModule(IsUsePreferredInputResultMatch, GameTileLayoutType, ContainedTile, ShouldHideTileMetadata, ShouldHideTileTitle, UseTextSizeOffsetResult, nil, TitleTextLines, if FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount then v2 or v3 else nil)
	local GameTileHiddenStore = GetGameTileHiddenStoreFunction(Frame.gameSortId)
	local UseRenderGameCollectionItemModuleResult = UseRenderGameCollectionItemModule(if GameTileLayoutType == "Narrow" and not Frame.playerCountStyle then GameTileConstants.PlayerCountStyleValues.Footer else Frame.playerCountStyle, Frame.isSponsoredFooterAllowed, GameTileLayoutType, Frame.friendFooterEnabled, Frame.pageContext == AppPage.Home, UseMemoResult1, IsUsePreferredInputResultMatch, UseGameSortAnalyticsModuleResult, UseGameSortAnalyticsModuleResult2, if Frame.launchExperienceEventContextOverride then Frame.launchExperienceEventContextOverride else DiscoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if UseGameSortDataModuleResult.isOmni then Frame.gameSortId else nil, nil, nil, Frame.playButtonStyle, ContainedTile, ShouldHideTileTitle, ShouldHideTileMetadata, if UseIsHoldToPlayEnabledForGamesModuleResult then UseHoldToPlayStateAndCallbacksResult.onHoldableFocused else nil, if UseIsHoldToPlayEnabledForGamesModuleResult then UseHoldToPlayStateAndCallbacksResult.onHoldableUnfocused else nil, if UseIsHoldToPlayEnabledForGamesModuleResult then UseHoldToPlayStateAndCallbacksResult.shouldDisableHoldable else nil, UseTextSizeOffsetResult, TitleTextLines, nil, nil, if FFlagLuaAppHomeTouchAutoplay then UseVideoAnalyticsResult else nil, nil, Frame.selectionOrderBase, Frame.enableExplicitFeedback, SignalsReactModule.useSignalState(GameTileHiddenStore.getHiddenGames), GameTileHiddenStore.setGameHidden, Frame.pageContext, if FFlagLuaAppEnableWhyThisAdModal then Frame.sponsoredUserCohort else nil, Frame.enableSponsoredFeedback, if FFlagLuaAppEnableSponsoredReportAd then Frame.enableReportAd else nil, #UseSizeAdjustedEntriesModuleResult, Frame.isSponsoredRatingFooterAllowed, nil, nil, nil, if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then Frame.onTileImageLoaded else nil, if FFlagLuaAppNarrowTileSmallerFooterFont then v1 else nil, if FFlagLuaAppNarrowTileHideRating then v2 else nil, if FFlagLuaAppNarrowTileHidePlayerCount then v3 else nil, if FFlagLuaAppHomeTouchAutoplay then Frame.videoPlaybackContext else nil)
	
	if not FFlagLuaAppCompositionAlways then
		local UseRefResult1 = ReactModule.useRef(0)
		ReactModule.useEffect(function()
			-- upvalues: FFlagLuaAppCompositionAlways1 (copy), UseGameCollectionLayoutParamsModuleResult (copy), UseRefResult1 (copy), Frame (copy)
			if not FFlagLuaAppCompositionAlways1 and UseGameCollectionLayoutParamsModuleResult.numColumns ~= UseRefResult1.current then
				UseRefResult1.current = UseGameCollectionLayoutParamsModuleResult.numColumns
				
				if Frame.onItemsPerRowChanged then
					Frame.onItemsPerRowChanged(UseGameCollectionLayoutParamsModuleResult.numColumns)
				end
			end
		end, {
			UseGameCollectionLayoutParamsModuleResult.numColumns,
			Frame.onItemsPerRowChanged,
			UseRefResult1,
			FFlagLuaAppCompositionAlways1
		})
	end
	return if UseGameSortDataModuleResult.gameSortDataFound then ReactModule.createElement(ReactModule.Fragment, nil, {
		GameGrid = ReactModule.createElement(CollectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then GameTileCollectionItemSize else nil,
			LayoutOrder = if FFlagLuaAppRfyRevealRows then Frame.LayoutOrder else nil,
			ZIndex = if FFlagLuaAppRfyRevealRows then Frame.ZIndex else nil,
			title = Frame.title,
			subtitle = UseGameSortDataModuleResult.sort and UseGameSortDataModuleResult.sort.subtitle or nil,
			onViewableItemsChanged = UseGameSortImpressionsParamsModuleResult3,
			containerRef = if FFlagLuaAppRfyRevealRowsFocusFix then UseMemoResult else UseStateResult2,
			tooltipInfoText = UseGameSortTooltipParamsModuleResult2,
			items = UseSizeAdjustedEntriesModuleResult,
			onActivateInfoIcon = UseGameSortTooltipParamsModuleResult,
			verticalScrollingFrameRef = Frame.verticalScrollingFrameRef,
			renderItem = UseRenderGameCollectionItemModuleResult,
			getItemHeight = UseGetGameTileHeightModuleResult,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.numColumns,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.sideMargin,
			verticalPadding = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.verticalPadding,
			maxNumRows = Frame.maxNumRows,
			bufferRowsBelowScreen = LuaAppGameGridBufferRowsBelowScreen1,
			bufferRowsAboveScreen = LuaAppGameGridBufferRowsAboveScreen1,
			headerComponent = Frame.headerComponent,
			headerTag = if FFlagLuaAppSortHeaderAnchorTag then Frame.headerTag else nil,
			testId = if Frame.gameSortId then `--{Frame.gameSortId}-game-collection-grid` else nil
		}),
		GameSortImpressionsDetector = ReactModule.createElement(WaitForPropWrapperModule, {
			waitForProp = Frame.startRow,
			maxUpdatesToDelay = Frame.numUpdatesToDelayImpressions,
			wrappedComponent = ReactModule.createElement(GameSortImpressionsDetectorModule, {
				parentRef = UseRefResult,
				pageContext = Frame.pageContext,
				impressionsTag = UseMemoResult1,
				scrollViewPositionChangedSignal = UseGameSortImpressionsParamsModuleResult2,
				sendGameImpressions = UseGameSortImpressionsParamsModuleResult,
				dataUpdatedTimestamp = UseGameSortDataModuleResult.gameSortContents and UseGameSortDataModuleResult.gameSortContents.updatedTimestamp or nil
			})
		}),
		HoldToPlayLauncher = if UseIsHoldToPlayEnabledForGamesModuleResult and UseHoldToPlayStateAndCallbacksResult.shouldRenderHoldToPlayLauncher then ReactModule.createElement(HoldToPlayLauncher, {
			selectedIndex = UseHoldToPlayStateAndCallbacksResult.selectedIndex,
			selectedEntry = UseHoldToPlayStateAndCallbacksResult.selectedEntry,
			selectedNavigationUniverseId = UseHoldToPlayStateAndCallbacksResult.selectedNavigationUniverseId,
			holdState = UseHoldToPlayStateAndCallbacksResult.holdState,
			holdProgress = UseHoldToPlayStateAndCallbacksResult.holdProgress,
			cancelHold = UseHoldToPlayStateAndCallbacksResult.cancelHold,
			launchContext = DiscoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = Frame.pageContext,
			reportExperienceLaunched = UseGameSortAnalyticsModuleResult2
		}) else nil
	}) else nil
end)