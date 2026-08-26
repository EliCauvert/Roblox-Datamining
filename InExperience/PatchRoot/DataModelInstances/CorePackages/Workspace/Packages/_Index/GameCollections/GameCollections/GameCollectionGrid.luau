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
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local validateProps = discoveryUtilsModule.validateProps
local composeRefs = discoveryUtilsModule.composeRefs
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
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppFixCompositionSizeOverrideGap = require(parent.SharedFlags).FFlagLuaAppFixCompositionSizeOverrideGap
local fFlagLuaAppRfyRevealRows = require(parent.SharedFlags).FFlagLuaAppRfyRevealRows
local fFlagLuaAppSortHeaderAnchorTag = require(parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppRfyRevealRowsFocusFix = require(parent.SharedFlags).FFlagLuaAppRfyRevealRowsFocusFix
local luaAppGameGridBufferRowsBelowScreen = game:DefineFastInt("LuaAppGameGridBufferRowsBelowScreen", 2)
local luaAppGameGridBufferRowsAboveScreen = game:DefineFastInt("LuaAppGameGridBufferRowsAboveScreen", 1)
local var1 = tModule.strictInterface({
	entries = tModule.optional(tModule.table),
	title = tModule.optional(tModule.string),
	headerComponent = tModule.optional(tModule.table),
	headerTag = if fFlagLuaAppSortHeaderAnchorTag then tModule.optional(tModule.string) else nil,
	verticalScrollingFrameRef = tModule.table,
	gridContainerRef = if fFlagLuaAppRfyRevealRowsFocusFix then tModule.optional(tModule.union(tModule.table, tModule.callback)) else nil,
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
	sponsoredUserCohort = tModule.optional(tModule.string),
	enableSponsoredFeedback = tModule.optional(tModule.boolean),
	enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then tModule.optional(tModule.boolean) else nil,
	searchParams = tModule.optional(tModule.table),
	layoutOverrides = tModule.optional(tModule.table),
	isSponsoredRatingFooterAllowed = tModule.optional(tModule.boolean),
	launchExperienceEventContextOverride = tModule.optional(tModule.string),
	appCompositionEnabled = tModule.optional(tModule.boolean),
	onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then tModule.optional(tModule.callback) else nil,
	videoPlaybackContext = tModule.optional(tModule.table)
})

return reactModule.memo(function(p1)
	-- upvalues: validateProps (ref), var1 (ref), useAppPolicy (ref), usePreferredInput (ref), fFlagLuaAppHomeReduceRenders (ref), luaAppGameGridBufferRowsBelowScreen (ref), responsiveModule (ref), luaAppGameGridBufferRowsAboveScreen (ref), fFlagLuaAppCompositionAlways (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), useBreakpointXOrSmaller (ref), getGameTileCollectionItemSize (ref), reactModule (ref), fFlagLuaAppRfyRevealRowsFocusFix (ref), composeRefs (ref), useGameSortDataModule (ref), cryoModule (ref), useGameCollectionLayoutParamsModule (ref), fFlagLuaAppFixCompositionSizeOverrideGap (ref), useCollectionLayout (ref), useSizeAdjustedEntriesModule (ref), useGameSortAnalyticsModule (ref), gameTileModule (ref), useGameSortTooltipParamsModule (ref), useGameSortImpressionsParamsModule (ref), fFlagLuaAppFixSearchImpressions (ref), useIsHoldToPlayEnabledForGamesModule (ref), useHoldToPlayStateAndCallbacks (ref), useControllerBarFocusNavigationBindings (ref), useTextSizeOffset (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), getGameTileHiddenStore (ref), signalsReactModule (ref), useRenderGameCollectionItemModule (ref), appPage (ref), discoveryAnalyticsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), gameSortImpressionsDetectorModule (ref), collectionGrid (ref), fFlagLuaAppRfyRevealRows (ref), fFlagLuaAppSortHeaderAnchorTag (ref), waitForPropWrapperModule (ref), holdToPlayLauncher (ref)
	validateProps(var1, p1)
	local var2 = useAppPolicy(function(p2)
		return p2.useGridPageLayout()
	end)
	local var3 = usePreferredInput()
	local var4 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsBelowScreen elseif var3 == responsiveModule.Input.Directional then 4 else 2
	local var5 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsAboveScreen elseif var3 == responsiveModule.Input.Directional then 4 else 1
	local var6 = p1.isHoverSupportEnabled and (var2 and var3 == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var7 = nil
	local var8 = nil
	local var9 = nil
	
	if fFlagLuaAppNarrowTileSmallerFooterFont or fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then
		local var10 = fFlagLuaAppCompositionAlways_1 and (gameTileLayoutType == "Narrow" and useBreakpointXOrSmaller(responsiveModule.Keys.Small))
		var7 = if fFlagLuaAppNarrowTileSmallerFooterFont then var10 else nil
		var8 = if fFlagLuaAppNarrowTileHideRating then var10 else nil
		var9 = if fFlagLuaAppNarrowTileHidePlayerCount then var10 else nil
	end
	local itemsPerRow, var11
	local var12 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var13, var14 = reactModule.useState(nil)
	local var15 = reactModule.useRef(var13)
	var15.current = var13
	local var16 = if fFlagLuaAppRfyRevealRowsFocusFix then reactModule.useMemo(function()
		-- upvalues: composeRefs (copy), var14 (ref), p1 (ref)
		return composeRefs(var14, p1.gridContainerRef)
	end, { p1.gridContainerRef }) else nil
	local var17 = useGameSortDataModule(p1.gameSortId, p1.pageContext, p1.searchParams and p1.searchParams.searchUuid)
	local var18 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var13, false, reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), cryoModule (copy)
		local var19 = if var2 then nil else p1.sideMargin
		
		return if not (not p1.layoutOverrides and not var19) then cryoModule.Dictionary.join(p1.layoutOverrides or {}, {
			sideMargin = if p1.layoutOverrides and p1.layoutOverrides.sideMargin then p1.layoutOverrides.sideMargin else var19
		}) else nil
	end, { p1.layoutOverrides, var2, p1.sideMargin }))
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppFixCompositionSizeOverrideGap then
		local var19 = useCollectionLayout(var12)
		itemsPerRow = var19.itemsPerRow
		var11 = useSizeAdjustedEntriesModule(p1.entries, if fFlagLuaAppCompositionAlways_1 then var19.gutter else var18.columnGap, if fFlagLuaAppCompositionAlways_1 then var19.verticalGap else var18.verticalPadding)
	else
		var11 = useSizeAdjustedEntriesModule(p1.entries, var18.columnGap, var18.verticalPadding)
		itemsPerRow = useCollectionLayout(var12).itemsPerRow
	end
	local var20 = if fFlagLuaAppCompositionAlways_1 then itemsPerRow or 0 else var18.numColumns or 0
	local var21, var22 = useGameSortAnalyticsModule(var17.sort, var17.isOmni, p1.sortIndex, p1.pageContext, nil, var11, var20, p1.startRow)
	local var23 = gameTileModule.useVideoAnalytics(var17.sort, var17.isOmni, p1.pageContext, p1.sortIndex, var11)
	local var24, var25 = useGameSortTooltipParamsModule(var17.sort, var17.isOmni, p1.infoText)
	local var26, var27, var28 = useGameSortImpressionsParamsModule(var17.sort, var17.isOmni, p1.sortIndex, p1.pageContext, p1.useGridTiles, p1.componentType, var17.gamesApiSortPageId, p1.gameSortId, p1.scrollViewPositionChangedSignal, var20, p1.startRow, var11, p1.searchParams)
	local var29 = if fFlagLuaAppFixSearchImpressions and p1.searchParams then p1.searchParams.searchUuid else nil
	local var30 = if fFlagLuaAppFixSearchImpressions then reactModule.useMemo(function()
		-- upvalues: p1 (ref), var29 (ref)
		local pageContext = `GameGrid_{p1.pageContext}`
		
		if var29 then
			pageContext ..= `_{var29}`
		end
		return pageContext .. `_{p1.gameSortId}_{p1.sortIndex}`
	end, { p1.pageContext, var29, p1.gameSortId, p1.sortIndex }) else `GameGrid_{p1.gameSortId}_{p1.sortIndex}`
	local var31 = useIsHoldToPlayEnabledForGamesModule()
	local var32 = useHoldToPlayStateAndCallbacks()
	local var33 = useControllerBarFocusNavigationBindings(nil, if var31 then var32.holdToPlayEventHandler else nil)
	reactModule.useEffect(function()
		-- upvalues: var33 (ref), var13 (ref)
		if var33 then
			var33(var13)
		end
	end, { var33, var13 })
	local shouldHideTileTitle = p1.shouldHideTileTitle or false
	local shouldHideTileMetadata = p1.shouldHideTileMetadata or false
	local containedTile = p1.containedTile or false
	local var34 = useTextSizeOffset()
	local titleTextLines = gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines
	local var35 = useGetGameTileHeightModule(var6, gameTileLayoutType, containedTile, shouldHideTileMetadata, shouldHideTileTitle, var34, nil, titleTextLines, if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then var8 or var9 else nil)
	local var36 = getGameTileHiddenStore(p1.gameSortId)
	local _ = nil
	local var37 = useRenderGameCollectionItemModule(if gameTileLayoutType == "Narrow" and not p1.playerCountStyle then gameTileConstants.PlayerCountStyleValues.Footer else p1.playerCountStyle, p1.isSponsoredFooterAllowed, gameTileLayoutType, p1.friendFooterEnabled, p1.pageContext == appPage.Home, var30, var6, var21, var22, if p1.launchExperienceEventContextOverride then p1.launchExperienceEventContextOverride else discoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if var17.isOmni then p1.gameSortId else nil, nil, nil, p1.playButtonStyle, containedTile, shouldHideTileTitle, shouldHideTileMetadata, if var31 then var32.onHoldableFocused else nil, if var31 then var32.onHoldableUnfocused else nil, if var31 then var32.shouldDisableHoldable else nil, var34, titleTextLines, nil, nil, var23, nil, p1.selectionOrderBase, p1.enableExplicitFeedback, signalsReactModule.useSignalState(var36.getHiddenGames), var36.setGameHidden, p1.pageContext, p1.sponsoredUserCohort, p1.enableSponsoredFeedback, if fFlagLuaAppEnableSponsoredReportAd then p1.enableReportAd else nil, #var11, p1.isSponsoredRatingFooterAllowed, nil, nil, nil, if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil, if fFlagLuaAppNarrowTileSmallerFooterFont then var7 else nil, if fFlagLuaAppNarrowTileHideRating then var8 else nil, if fFlagLuaAppNarrowTileHidePlayerCount then var9 else nil, p1.videoPlaybackContext)
	
	if not fFlagLuaAppCompositionAlways then
		local var38 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var18 (ref), var38 (ref), p1 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var18.numColumns ~= var38.current then
				var38.current = var18.numColumns
				
				if p1.onItemsPerRowChanged then
					p1.onItemsPerRowChanged(var18.numColumns)
				end
			end
		end, {
			var18.numColumns,
			p1.onItemsPerRowChanged,
			var38,
			fFlagLuaAppCompositionAlways_1
		})
	end
	return if var17.gameSortDataFound then reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var12 else nil,
			LayoutOrder = if fFlagLuaAppRfyRevealRows then p1.LayoutOrder else nil,
			ZIndex = if fFlagLuaAppRfyRevealRows then p1.ZIndex else nil,
			title = p1.title,
			subtitle = if var17.sort then var17.sort.subtitle else nil,
			onViewableItemsChanged = var28,
			containerRef = if fFlagLuaAppRfyRevealRowsFocusFix then var16 else var14,
			tooltipInfoText = var25,
			items = var11,
			onActivateInfoIcon = var24,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			renderItem = var37,
			getItemHeight = var35,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var18.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var18.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var18.sideMargin,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var18.verticalPadding,
			maxNumRows = p1.maxNumRows,
			bufferRowsBelowScreen = var4,
			bufferRowsAboveScreen = var5,
			headerComponent = p1.headerComponent,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then p1.headerTag else nil,
			testId = if p1.gameSortId then `--{p0.gameSortId}-game-collection-grid` else nil
		}),
		GameSortImpressionsDetector = reactModule.createElement(waitForPropWrapperModule, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(gameSortImpressionsDetectorModule, {
				parentRef = var15,
				pageContext = p1.pageContext,
				impressionsTag = var30,
				scrollViewPositionChangedSignal = var27,
				sendGameImpressions = var26,
				dataUpdatedTimestamp = if var17.gameSortContents then var17.gameSortContents.updatedTimestamp else nil
			})
		}),
		HoldToPlayLauncher = if var31 and var32.shouldRenderHoldToPlayLauncher then reactModule.createElement(holdToPlayLauncher, {
			selectedIndex = var32.selectedIndex,
			selectedEntry = var32.selectedEntry,
			selectedNavigationUniverseId = var32.selectedNavigationUniverseId,
			holdState = var32.holdState,
			holdProgress = var32.holdProgress,
			cancelHold = var32.cancelHold,
			launchContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p1.pageContext,
			reportExperienceLaunched = var22
		}) else nil
	}) else nil
end)