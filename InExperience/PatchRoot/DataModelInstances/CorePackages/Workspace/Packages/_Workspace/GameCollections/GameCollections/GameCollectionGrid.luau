local gameCollections = script:FindFirstAncestor("GameCollections")
local useControllerBarFocusNavigationBindings = require(gameCollections.GameCollectionNavigationBindings).useControllerBarFocusNavigationBindings
local useGetGameTileHeightModule = require(gameCollections.useGetGameTileHeight)
local useIsHoldToPlayEnabledForGamesModule = require(gameCollections.useIsHoldToPlayEnabledForGames)
local useRenderGameCollectionItemModule = require(gameCollections.useRenderGameCollectionItem)
local useGameCollectionLayoutParamsModule = require(gameCollections.useGameCollectionLayoutParams)
local useGameSortAnalyticsModule = require(gameCollections.useGameSortAnalytics)
local gameSortImpressionsDetectorModule = require(gameCollections.Impressions.GameSortImpressionsDetector)
local useGameSortDataModule = require(gameCollections.useGameSortData)
local useGameSortImpressionsParamsModule = require(gameCollections.Impressions.useGameSortImpressionsParams)
local useGameSortTooltipParamsModule = require(gameCollections.useGameSortTooltipParams)
local waitForPropWrapperModule = require(gameCollections.Impressions.WaitForPropWrapper)
local useSizeAdjustedEntriesModule = require(gameCollections.useSizeAdjustedEntries)
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local tModule = require(parent.t)
local validateProps = require(parent.DiscoveryUtils).validateProps
local gameTileModule = require(parent.GameTile)
local getGameTileCollectionItemSize = gameTileModule.getGameTileCollectionItemSize
local getGameTileHiddenStore = gameTileModule.getGameTileHiddenStore
local gameTileConstants = gameTileModule.GameTileConstants
local _ = require(parent.VideoUtils)
local _ = require(parent.AppCommonLib)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local collectionGrid = require(parent.CollectionViews).CollectionGrid
local useCollectionLayout = require(parent.CollectionViews).useCollectionLayout
local appPage = require(parent.RobloxAppEnums).AppPage
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local holdToPlayModule = require(parent.HoldToPlay)
local holdToPlayLauncher = holdToPlayModule.HoldToPlayLauncher
local useHoldToPlayStateAndCallbacks = holdToPlayModule.useHoldToPlayStateAndCallbacks
local _ = require(parent.DiscoveryTypes)
local cryoModule = require(parent.Cryo)
local _ = require(parent.CollectionViews)
local fFlagLuaAppEnableWhyThisAdModal = require(parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppCompositionSupport = require(parent.SharedFlags).FFlagLuaAppCompositionSupport
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppFixCompositionSizeOverrideGap = require(parent.SharedFlags).FFlagLuaAppFixCompositionSizeOverrideGap
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppRfyRevealRows = require(parent.SharedFlags).FFlagLuaAppRfyRevealRows
local fFlagLuaAppSortHeaderAnchorTag = require(parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local luaAppGameGridBufferRowsBelowScreen = game:DefineFastInt("LuaAppGameGridBufferRowsBelowScreen", 2)
local luaAppGameGridBufferRowsAboveScreen = game:DefineFastInt("LuaAppGameGridBufferRowsAboveScreen", 1)
local var22 = tModule.strictInterface({
	entries = tModule.optional(tModule.table),
	title = tModule.optional(tModule.string),
	headerComponent = tModule.optional(tModule.table),
	headerTag = if fFlagLuaAppSortHeaderAnchorTag then tModule.optional(tModule.string) else nil,
	verticalScrollingFrameRef = tModule.table,
	LayoutOrder = if fFlagLuaAppRfyRevealRows then tModule.optional(tModule.number) else nil,
	ZIndex = if fFlagLuaAppRfyRevealRows then tModule.optional(tModule.number) else nil,
	maxNumRows = tModule.optional(tModule.number),
	useGridTiles = tModule.optional(tModule.boolean),
	gameSortId = tModule.string,
	sortIndex = tModule.number,
	pageContext = tModule.string,
	scrollViewPositionChangedSignal = tModule.optional(tModule.table),
	friendFooterEnabled = tModule.optional(tModule.boolean),
	playerCountStyle = tModule.optional(tModule.string),
	isSponsoredFooterAllowed = tModule.optional(tModule.boolean),
	componentType = tModule.optional(tModule.string),
	gameTileLayoutType = tModule.optional(tModule.string),
	infoText = tModule.optional(tModule.string),
	linkPath = tModule.optional(tModule.string),
	gridSupportAllowed = tModule.optional(tModule.boolean),
	isHoverSupportEnabled = tModule.optional(tModule.boolean),
	onItemsPerRowChanged = tModule.optional(tModule.callback),
	startRow = tModule.optional(tModule.number),
	playButtonStyle = tModule.optional(tModule.string),
	sideMargin = if not fFlagLuaAppCompositionAlways then tModule.optional(tModule.number) else nil,
	shouldHideTileMetadata = tModule.optional(tModule.boolean),
	shouldHideTileTitle = tModule.optional(tModule.boolean),
	containedTile = tModule.optional(tModule.boolean),
	numUpdatesToDelayImpressions = tModule.optional(tModule.number),
	selectionOrderBase = tModule.optional(tModule.number),
	enableExplicitFeedback = tModule.optional(tModule.boolean),
	sponsoredUserCohort = if fFlagLuaAppEnableWhyThisAdModal then tModule.optional(tModule.string) else nil,
	enableSponsoredFeedback = tModule.optional(tModule.boolean),
	enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then tModule.optional(tModule.boolean) else nil,
	searchParams = tModule.optional(tModule.table),
	layoutOverrides = tModule.optional(tModule.table),
	isSponsoredRatingFooterAllowed = tModule.optional(tModule.boolean),
	launchExperienceEventContextOverride = tModule.optional(tModule.string),
	appCompositionEnabled = if fFlagLuaAppCompositionSupport then tModule.optional(tModule.boolean) else nil,
	onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then tModule.optional(tModule.callback) else nil,
	videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then tModule.optional(tModule.table) else nil
})

return reactModule.memo(function(p0) --[[ line: 174 | named "GameCollectionGrid" ]]
	-- upvalues: validateProps (ref), var22 (ref), useAppPolicy (ref), usePreferredInput (ref), fFlagLuaAppHomeReduceRenders (ref), luaAppGameGridBufferRowsBelowScreen (ref), responsiveModule (ref), luaAppGameGridBufferRowsAboveScreen (ref), fFlagLuaAppCompositionAlways (ref), fFlagLuaAppCompositionSupport (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), useBreakpointXOrSmaller (ref), getGameTileCollectionItemSize (ref), reactModule (ref), useGameSortDataModule (ref), cryoModule (ref), useGameCollectionLayoutParamsModule (ref), fFlagLuaAppFixCompositionSizeOverrideGap (ref), useCollectionLayout (ref), useSizeAdjustedEntriesModule (ref), useGameSortAnalyticsModule (ref), fFlagLuaAppHomeTouchAutoplay (ref), gameTileModule (ref), useGameSortTooltipParamsModule (ref), useGameSortImpressionsParamsModule (ref), fFlagLuaAppFixSearchImpressions (ref), useIsHoldToPlayEnabledForGamesModule (ref), useHoldToPlayStateAndCallbacks (ref), useControllerBarFocusNavigationBindings (ref), useTextSizeOffset (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), getGameTileHiddenStore (ref), signalsReactModule (ref), useRenderGameCollectionItemModule (ref), appPage (ref), discoveryAnalyticsModule (ref), fFlagLuaAppEnableWhyThisAdModal (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), gameSortImpressionsDetectorModule (ref), collectionGrid (ref), fFlagLuaAppRfyRevealRows (ref), fFlagLuaAppSortHeaderAnchorTag (ref), waitForPropWrapperModule (ref), holdToPlayLauncher (ref)
	validateProps(var22, p0)
	local var23 = useAppPolicy(function(p1) --[[ line: 178 ]]
		return p1.useGridPageLayout()
	end)
	local var24 = usePreferredInput()
	local var25 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsBelowScreen elseif var24 == responsiveModule.Input.Directional then 4 else 2
	local var26 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsAboveScreen elseif var24 == responsiveModule.Input.Directional then 4 else 1
	local var27 = p0.isHoverSupportEnabled and (var23 and var24 == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or fFlagLuaAppCompositionSupport and p0.appCompositionEnabled
	local var30 = nil
	local var31 = nil
	local var32 = nil
	
	if fFlagLuaAppNarrowTileSmallerFooterFont or fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then
		local var33 = fFlagLuaAppCompositionAlways_1 and (gameTileLayoutType == "Narrow" and useBreakpointXOrSmaller(responsiveModule.Keys.Small))
		var30 = if fFlagLuaAppNarrowTileSmallerFooterFont then var33 else nil
		var31 = if fFlagLuaAppNarrowTileHideRating then var33 else nil
		var32 = if fFlagLuaAppNarrowTileHidePlayerCount then var33 else nil
	end
	local var40
	local var34 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var35, var36 = reactModule.useState(nil)
	local var37 = reactModule.useRef(var35)
	var37.current = var35
	local var38 = useGameSortDataModule(p0.gameSortId, p0.pageContext, p0.searchParams and p0.searchParams.searchUuid)
	local var39 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var35, false, reactModule.useMemo(function() --[[ line: 231 ]]
		-- upvalues: var23 (ref), p0 (ref), cryoModule (copy)
		local var65 = if var23 then nil else p0.sideMargin
		
		return if not (not p0.layoutOverrides and not var65) then cryoModule.Dictionary.join(p0.layoutOverrides or {}, {
			sideMargin = if p0.layoutOverrides and p0.layoutOverrides.sideMargin then p0.layoutOverrides.sideMargin else var65
		}) else nil
	end, { p0.layoutOverrides, var23, p0.sideMargin }))
	local _ = nil
	local itemsPerRow = nil
	
	if fFlagLuaAppFixCompositionSizeOverrideGap and fFlagLuaAppCompositionSupport then
		local var41 = useCollectionLayout(var34)
		itemsPerRow = var41.itemsPerRow
		var40 = useSizeAdjustedEntriesModule(p0.entries, if fFlagLuaAppCompositionAlways_1 then var41.gutter else var39.columnGap, if fFlagLuaAppCompositionAlways_1 then var41.verticalGap else var39.verticalPadding)
	else
		var40 = useSizeAdjustedEntriesModule(p0.entries, var39.columnGap, var39.verticalPadding)
		
		if fFlagLuaAppCompositionSupport then
			itemsPerRow = useCollectionLayout(var34).itemsPerRow
		end
	end
	local var42 = if fFlagLuaAppCompositionAlways_1 then itemsPerRow or 0 else var39.numColumns or 0
	local var43, var44 = useGameSortAnalyticsModule(var38.sort, var38.isOmni, p0.sortIndex, p0.pageContext, nil, var40, var42, p0.startRow)
	local var45 = if fFlagLuaAppHomeTouchAutoplay then gameTileModule.useVideoAnalytics(var38.sort, var38.isOmni, p0.pageContext, p0.sortIndex, var40) else nil
	local var46, var47 = useGameSortTooltipParamsModule(var38.sort, var38.isOmni, p0.infoText)
	local var48, var49, var50 = useGameSortImpressionsParamsModule(var38.sort, var38.isOmni, p0.sortIndex, p0.pageContext, p0.useGridTiles, p0.componentType, var38.gamesApiSortPageId, p0.gameSortId, p0.scrollViewPositionChangedSignal, var42, p0.startRow, var40, p0.searchParams)
	local var51 = if fFlagLuaAppFixSearchImpressions and p0.searchParams then p0.searchParams.searchUuid else nil
	local var52 = if fFlagLuaAppFixSearchImpressions then reactModule.useMemo(function() --[[ line: 316 ]]
		-- upvalues: p0 (ref), var51 (ref)
		local pageContext = `GameGrid_{p0.pageContext}`
		
		if var51 then
			pageContext ..= `_{var51}`
		end
		return pageContext .. `_{p0.gameSortId}_{p0.sortIndex}`
	end, { p0.pageContext, var51, p0.gameSortId, p0.sortIndex }) else `GameGrid_{p0.gameSortId}_{p0.sortIndex}`
	local var53 = useIsHoldToPlayEnabledForGamesModule()
	local var54 = useHoldToPlayStateAndCallbacks()
	local var55 = useControllerBarFocusNavigationBindings(nil, if var53 then var54.holdToPlayEventHandler else nil)
	reactModule.useEffect(function() --[[ line: 343 ]]
		-- upvalues: var55 (ref), var35 (ref)
		if var55 then
			var55(var35)
		end
	end, { var55, var35 })
	local shouldHideTileTitle = p0.shouldHideTileTitle or false
	local shouldHideTileMetadata = p0.shouldHideTileMetadata or false
	local containedTile = p0.containedTile or false
	local var59 = useTextSizeOffset()
	local titleTextLines = gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines
	local var61 = useGetGameTileHeightModule(var27, gameTileLayoutType, containedTile, shouldHideTileMetadata, shouldHideTileTitle, var59, nil, titleTextLines, if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then var31 or var32 else nil)
	local var62 = getGameTileHiddenStore(p0.gameSortId)
	local _ = nil
	local var63 = useRenderGameCollectionItemModule(if gameTileLayoutType == "Narrow" and not p0.playerCountStyle then gameTileConstants.PlayerCountStyleValues.Footer else p0.playerCountStyle, p0.isSponsoredFooterAllowed, gameTileLayoutType, p0.friendFooterEnabled, p0.pageContext == appPage.Home, var52, var27, var43, var44, if p0.launchExperienceEventContextOverride then p0.launchExperienceEventContextOverride else discoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if var38.isOmni then p0.gameSortId else nil, nil, nil, p0.playButtonStyle, containedTile, shouldHideTileTitle, shouldHideTileMetadata, if var53 then var54.onHoldableFocused else nil, if var53 then var54.onHoldableUnfocused else nil, if var53 then var54.shouldDisableHoldable else nil, var59, titleTextLines, nil, nil, if fFlagLuaAppHomeTouchAutoplay then var45 else nil, nil, p0.selectionOrderBase, p0.enableExplicitFeedback, signalsReactModule.useSignalState(var62.getHiddenGames), var62.setGameHidden, p0.pageContext, if fFlagLuaAppEnableWhyThisAdModal then p0.sponsoredUserCohort else nil, p0.enableSponsoredFeedback, if fFlagLuaAppEnableSponsoredReportAd then p0.enableReportAd else nil, #var40, p0.isSponsoredRatingFooterAllowed, nil, nil, nil, if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil, if fFlagLuaAppNarrowTileSmallerFooterFont then var30 else nil, if fFlagLuaAppNarrowTileHideRating then var31 else nil, if fFlagLuaAppNarrowTileHidePlayerCount then var32 else nil, if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackContext else nil)
	
	if not fFlagLuaAppCompositionAlways then
		local var64 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 442 ]]
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var39 (ref), var64 (ref), p0 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var39.numColumns ~= var64.current then
				var64.current = var39.numColumns
				
				if p0.onItemsPerRowChanged then
					p0.onItemsPerRowChanged(var39.numColumns)
				end
			end
		end, {
			var39.numColumns,
			p0.onItemsPerRowChanged,
			var64,
			if fFlagLuaAppCompositionSupport then fFlagLuaAppCompositionAlways_1 else nil
		})
	end
	return if var38.gameSortDataFound then reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var34 else nil,
			LayoutOrder = if fFlagLuaAppRfyRevealRows then p0.LayoutOrder else nil,
			ZIndex = if fFlagLuaAppRfyRevealRows then p0.ZIndex else nil,
			title = p0.title,
			subtitle = if var38.sort then var38.sort.subtitle else nil,
			onViewableItemsChanged = var50,
			containerRef = var36,
			tooltipInfoText = var47,
			items = var40,
			onActivateInfoIcon = var46,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			renderItem = var63,
			getItemHeight = var61,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var39.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var39.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var39.sideMargin,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var39.verticalPadding,
			maxNumRows = p0.maxNumRows,
			bufferRowsBelowScreen = var25,
			bufferRowsAboveScreen = var26,
			headerComponent = p0.headerComponent,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then p0.headerTag else nil,
			testId = if p0.gameSortId then `--{p0.gameSortId}-game-collection-grid` else nil
		}),
		GameSortImpressionsDetector = reactModule.createElement(waitForPropWrapperModule, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(gameSortImpressionsDetectorModule, {
				parentRef = var37,
				pageContext = p0.pageContext,
				impressionsTag = var52,
				scrollViewPositionChangedSignal = var49,
				sendGameImpressions = var48,
				dataUpdatedTimestamp = if var38.gameSortContents then var38.gameSortContents.updatedTimestamp else nil
			})
		}),
		HoldToPlayLauncher = if var53 and var54.shouldRenderHoldToPlayLauncher then reactModule.createElement(holdToPlayLauncher, {
			selectedIndex = var54.selectedIndex,
			selectedEntry = var54.selectedEntry,
			selectedNavigationUniverseId = var54.selectedNavigationUniverseId,
			holdState = var54.holdState,
			holdProgress = var54.holdProgress,
			cancelHold = var54.cancelHold,
			launchContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p0.pageContext,
			reportExperienceLaunched = var44
		}) else nil
	}) else nil
end)