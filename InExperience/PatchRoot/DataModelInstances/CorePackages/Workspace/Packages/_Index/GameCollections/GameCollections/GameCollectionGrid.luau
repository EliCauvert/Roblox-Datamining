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
local fFlagLuaAppEnableReportExperience = require(parent.SharedFlags).FFlagLuaAppEnableReportExperience
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppRfyRevealRows = require(parent.SharedFlags).FFlagLuaAppRfyRevealRows
local fFlagLuaAppSortHeaderAnchorTag = require(parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local luaAppGameGridBufferRowsBelowScreen = game:DefineFastInt("LuaAppGameGridBufferRowsBelowScreen", 2)
local luaAppGameGridBufferRowsAboveScreen = game:DefineFastInt("LuaAppGameGridBufferRowsAboveScreen", 1)
local var1 = tModule.strictInterface({
	entries = tModule.optional(tModule.table),
	title = tModule.optional(tModule.string),
	headerComponent = tModule.optional(tModule.table),
	headerTag = if fFlagLuaAppSortHeaderAnchorTag then tModule.optional(tModule.string) else nil,
	verticalScrollingFrameRef = tModule.table,
	gridContainerRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
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
	enableReportAd = tModule.optional(tModule.boolean),
	enableReportExperience = if fFlagLuaAppEnableReportExperience then tModule.optional(tModule.boolean) else nil,
	searchParams = tModule.optional(tModule.table),
	layoutOverrides = tModule.optional(tModule.table),
	isSponsoredRatingFooterAllowed = tModule.optional(tModule.boolean),
	launchExperienceEventContextOverride = tModule.optional(tModule.string),
	appCompositionEnabled = tModule.optional(tModule.boolean),
	videoPlaybackContext = tModule.optional(tModule.table)
})

return reactModule.memo(function(p1)
	-- upvalues: validateProps (ref), var1 (ref), useAppPolicy (ref), usePreferredInput (ref), fFlagLuaAppHomeReduceRenders (ref), luaAppGameGridBufferRowsBelowScreen (ref), responsiveModule (ref), luaAppGameGridBufferRowsAboveScreen (ref), fFlagLuaAppCompositionAlways (ref), useBreakpointXOrSmaller (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), getGameTileCollectionItemSize (ref), reactModule (ref), composeRefs (ref), useGameSortDataModule (ref), cryoModule (ref), useGameCollectionLayoutParamsModule (ref), useCollectionLayout (ref), useSizeAdjustedEntriesModule (ref), useGameSortAnalyticsModule (ref), gameTileModule (ref), useGameSortTooltipParamsModule (ref), useGameSortImpressionsParamsModule (ref), fFlagLuaAppFixSearchImpressions (ref), useIsHoldToPlayEnabledForGamesModule (ref), useHoldToPlayStateAndCallbacks (ref), useControllerBarFocusNavigationBindings (ref), useTextSizeOffset (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), getGameTileHiddenStore (ref), signalsReactModule (ref), useRenderGameCollectionItemModule (ref), appPage (ref), discoveryAnalyticsModule (ref), fFlagLuaAppEnableReportExperience (ref), gameSortImpressionsDetectorModule (ref), collectionGrid (ref), fFlagLuaAppRfyRevealRows (ref), fFlagLuaAppSortHeaderAnchorTag (ref), waitForPropWrapperModule (ref), holdToPlayLauncher (ref)
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
	local _ = nil
	local _ = nil
	local _ = nil
	local var7 = fFlagLuaAppCompositionAlways_1 and (gameTileLayoutType == "Narrow" and useBreakpointXOrSmaller(responsiveModule.Keys.Small))
	local var8 = if fFlagLuaAppNarrowTileHideRating then var7 else nil
	local var9 = if fFlagLuaAppNarrowTileHidePlayerCount then var7 else nil
	local var10 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(var11)
	var13.current = var11
	local var14 = reactModule.useMemo(function()
		-- upvalues: composeRefs (copy), var12 (ref), p1 (ref)
		return composeRefs(var12, p1.gridContainerRef)
	end, { p1.gridContainerRef })
	local var15 = useGameSortDataModule(p1.gameSortId, p1.pageContext, p1.searchParams and p1.searchParams.searchUuid)
	local var16 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var11, false, reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), cryoModule (copy)
		local var17 = if var2 then nil else p1.sideMargin
		
		return if not (not p1.layoutOverrides and not var17) then cryoModule.Dictionary.join(p1.layoutOverrides or {}, {
			sideMargin = if p1.layoutOverrides and p1.layoutOverrides.sideMargin then p1.layoutOverrides.sideMargin else var17
		}) else nil
	end, { p1.layoutOverrides, var2, p1.sideMargin }))
	local _ = nil
	local _ = nil
	local var17 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(var10).itemsPerRow or 0 else var16.numColumns or 0
	local var18, var19 = useGameSortAnalyticsModule(var15.sort, var15.isOmni, p1.sortIndex, p1.pageContext, nil, u705, var17, p1.startRow)
	local var20 = gameTileModule.useVideoAnalytics(var15.sort, var15.isOmni, p1.pageContext, p1.sortIndex, u705)
	local var21, var22 = useGameSortTooltipParamsModule(var15.sort, var15.isOmni, p1.infoText)
	local var23, var24, var25 = useGameSortImpressionsParamsModule(var15.sort, var15.isOmni, p1.sortIndex, p1.pageContext, p1.useGridTiles, p1.componentType, var15.gamesApiSortPageId, p1.gameSortId, p1.scrollViewPositionChangedSignal, var17, p1.startRow, u705, p1.searchParams)
	local var26 = if fFlagLuaAppFixSearchImpressions and p1.searchParams then p1.searchParams.searchUuid else nil
	local var27 = if fFlagLuaAppFixSearchImpressions then reactModule.useMemo(function()
		-- upvalues: p1 (ref), var26 (ref)
		local pageContext = `GameGrid_{p1.pageContext}`
		
		if var26 then
			pageContext ..= `_{var26}`
		end
		return pageContext .. `_{p1.gameSortId}_{p1.sortIndex}`
	end, { p1.pageContext, var26, p1.gameSortId, p1.sortIndex }) else `GameGrid_{p1.gameSortId}_{p1.sortIndex}`
	local var28 = useIsHoldToPlayEnabledForGamesModule()
	local var29 = useHoldToPlayStateAndCallbacks()
	local var30 = useControllerBarFocusNavigationBindings(nil, if var28 then var29.holdToPlayEventHandler else nil)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var11 (ref)
		if var30 then
			var30(var11)
		end
	end, { var30, var11 })
	local shouldHideTileTitle = p1.shouldHideTileTitle or false
	local shouldHideTileMetadata = p1.shouldHideTileMetadata or false
	local containedTile = p1.containedTile or false
	local var31 = useTextSizeOffset()
	local titleTextLines = gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines
	local var32 = useGetGameTileHeightModule(var6, gameTileLayoutType, containedTile, shouldHideTileMetadata, shouldHideTileTitle, var31, nil, titleTextLines, if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then var8 or var9 else nil)
	local var33 = getGameTileHiddenStore(p1.gameSortId)
	local _ = nil
	local var34 = useRenderGameCollectionItemModule(if gameTileLayoutType == "Narrow" and not p1.playerCountStyle then gameTileConstants.PlayerCountStyleValues.Footer else p1.playerCountStyle, p1.isSponsoredFooterAllowed, gameTileLayoutType, p1.friendFooterEnabled, p1.pageContext == appPage.Home, var27, var6, var18, var19, if p1.launchExperienceEventContextOverride then p1.launchExperienceEventContextOverride else discoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if var15.isOmni then p1.gameSortId else nil, nil, nil, p1.playButtonStyle, containedTile, shouldHideTileTitle, shouldHideTileMetadata, if var28 then var29.onHoldableFocused else nil, if var28 then var29.onHoldableUnfocused else nil, if var28 then var29.shouldDisableHoldable else nil, var31, titleTextLines, nil, nil, var20, nil, p1.selectionOrderBase, p1.enableExplicitFeedback, signalsReactModule.useSignalState(var33.getHiddenGames), var33.setGameHidden, p1.pageContext, p1.sponsoredUserCohort, p1.enableSponsoredFeedback, p1.enableReportAd, if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil, #u705, p1.isSponsoredRatingFooterAllowed, nil, nil, nil, var7, if fFlagLuaAppNarrowTileHideRating then var8 else nil, if fFlagLuaAppNarrowTileHidePlayerCount then var9 else nil, p1.videoPlaybackContext)
	
	if not fFlagLuaAppCompositionAlways then
		local var35 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var16 (ref), var35 (ref), p1 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var16.numColumns ~= var35.current then
				var35.current = var16.numColumns
				
				if p1.onItemsPerRowChanged then
					p1.onItemsPerRowChanged(var16.numColumns)
				end
			end
		end, {
			var16.numColumns,
			p1.onItemsPerRowChanged,
			var35,
			fFlagLuaAppCompositionAlways_1
		})
	end
	return if var15.gameSortDataFound then reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var10 else nil,
			LayoutOrder = if fFlagLuaAppRfyRevealRows then p1.LayoutOrder else nil,
			ZIndex = if fFlagLuaAppRfyRevealRows then p1.ZIndex else nil,
			title = p1.title,
			subtitle = if var15.sort then var15.sort.subtitle else nil,
			onViewableItemsChanged = var25,
			containerRef = var14,
			tooltipInfoText = var22,
			items = u705,
			onActivateInfoIcon = var21,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			renderItem = var34,
			getItemHeight = var32,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var16.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var16.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var16.sideMargin,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var16.verticalPadding,
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
				parentRef = var13,
				pageContext = p1.pageContext,
				impressionsTag = var27,
				scrollViewPositionChangedSignal = var24,
				sendGameImpressions = var23,
				dataUpdatedTimestamp = if var15.gameSortContents then var15.gameSortContents.updatedTimestamp else nil
			})
		}),
		HoldToPlayLauncher = if var28 and var29.shouldRenderHoldToPlayLauncher then reactModule.createElement(holdToPlayLauncher, {
			selectedIndex = var29.selectedIndex,
			selectedEntry = var29.selectedEntry,
			selectedNavigationUniverseId = var29.selectedNavigationUniverseId,
			holdState = var29.holdState,
			holdProgress = var29.holdProgress,
			cancelHold = var29.cancelHold,
			launchContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p1.pageContext,
			reportExperienceLaunched = var19
		}) else nil
	}) else nil
end)