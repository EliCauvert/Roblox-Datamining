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
	-- upvalues: validateProps (ref), var1 (ref), useAppPolicy (ref), usePreferredInput (ref), luaAppGameGridBufferRowsBelowScreen (ref), luaAppGameGridBufferRowsAboveScreen (ref), responsiveModule (ref), fFlagLuaAppCompositionAlways (ref), useBreakpointXOrSmaller (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), getGameTileCollectionItemSize (ref), reactModule (ref), composeRefs (ref), useGameSortDataModule (ref), cryoModule (ref), useGameCollectionLayoutParamsModule (ref), useCollectionLayout (ref), useSizeAdjustedEntriesModule (ref), useGameSortAnalyticsModule (ref), gameTileModule (ref), useGameSortTooltipParamsModule (ref), useGameSortImpressionsParamsModule (ref), fFlagLuaAppFixSearchImpressions (ref), useIsHoldToPlayEnabledForGamesModule (ref), useHoldToPlayStateAndCallbacks (ref), useControllerBarFocusNavigationBindings (ref), useTextSizeOffset (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), getGameTileHiddenStore (ref), signalsReactModule (ref), useRenderGameCollectionItemModule (ref), appPage (ref), discoveryAnalyticsModule (ref), fFlagLuaAppEnableReportExperience (ref), gameSortImpressionsDetectorModule (ref), collectionGrid (ref), fFlagLuaAppRfyRevealRows (ref), fFlagLuaAppSortHeaderAnchorTag (ref), waitForPropWrapperModule (ref), holdToPlayLauncher (ref)
	validateProps(var1, p1)
	local var2 = useAppPolicy(function(p2)
		return p2.useGridPageLayout()
	end)
	local var3 = p1.isHoverSupportEnabled and (var2 and usePreferredInput() == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local _ = nil
	local _ = nil
	local _ = nil
	local var4 = fFlagLuaAppCompositionAlways_1 and (gameTileLayoutType == "Narrow" and useBreakpointXOrSmaller(responsiveModule.Keys.Small))
	local var5 = if fFlagLuaAppNarrowTileHideRating then var4 else nil
	local var6 = if fFlagLuaAppNarrowTileHidePlayerCount then var4 else nil
	local var7 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useRef(var8)
	var10.current = var8
	local var11 = reactModule.useMemo(function()
		-- upvalues: composeRefs (copy), var9 (ref), p1 (ref)
		return composeRefs(var9, p1.gridContainerRef)
	end, { p1.gridContainerRef })
	local var12 = useGameSortDataModule(p1.gameSortId, p1.pageContext, p1.searchParams and p1.searchParams.searchUuid)
	local var13 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var8, false, reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), cryoModule (copy)
		local var14 = if var2 then nil else p1.sideMargin
		
		return if not (not p1.layoutOverrides and not var14) then cryoModule.Dictionary.join(p1.layoutOverrides or {}, {
			sideMargin = if p1.layoutOverrides and p1.layoutOverrides.sideMargin then p1.layoutOverrides.sideMargin else var14
		}) else nil
	end, { p1.layoutOverrides, var2, p1.sideMargin }))
	local _ = nil
	local _ = nil
	local var14 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(var7).itemsPerRow or 0 else var13.numColumns or 0
	local var15, var16 = useGameSortAnalyticsModule(var12.sort, var12.isOmni, p1.sortIndex, p1.pageContext, nil, u683, var14, p1.startRow)
	local var17 = gameTileModule.useVideoAnalytics(var12.sort, var12.isOmni, p1.pageContext, p1.sortIndex, u683)
	local var18, var19 = useGameSortTooltipParamsModule(var12.sort, var12.isOmni, p1.infoText)
	local var20, var21, var22 = useGameSortImpressionsParamsModule(var12.sort, var12.isOmni, p1.sortIndex, p1.pageContext, p1.useGridTiles, p1.componentType, var12.gamesApiSortPageId, p1.gameSortId, p1.scrollViewPositionChangedSignal, var14, p1.startRow, u683, p1.searchParams)
	local var23 = if fFlagLuaAppFixSearchImpressions and p1.searchParams then p1.searchParams.searchUuid else nil
	local var24 = if fFlagLuaAppFixSearchImpressions then reactModule.useMemo(function()
		-- upvalues: p1 (ref), var23 (ref)
		local pageContext = `GameGrid_{p1.pageContext}`
		
		if var23 then
			pageContext ..= `_{var23}`
		end
		return pageContext .. `_{p1.gameSortId}_{p1.sortIndex}`
	end, { p1.pageContext, var23, p1.gameSortId, p1.sortIndex }) else `GameGrid_{p1.gameSortId}_{p1.sortIndex}`
	local var25 = useIsHoldToPlayEnabledForGamesModule()
	local var26 = useHoldToPlayStateAndCallbacks()
	local var27 = useControllerBarFocusNavigationBindings(nil, if var25 then var26.holdToPlayEventHandler else nil)
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), var8 (ref)
		if var27 then
			var27(var8)
		end
	end, { var27, var8 })
	local shouldHideTileTitle = p1.shouldHideTileTitle or false
	local shouldHideTileMetadata = p1.shouldHideTileMetadata or false
	local containedTile = p1.containedTile or false
	local var28 = useTextSizeOffset()
	local titleTextLines = gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines
	local var29 = useGetGameTileHeightModule(var3, gameTileLayoutType, containedTile, shouldHideTileMetadata, shouldHideTileTitle, var28, nil, titleTextLines, if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then var5 or var6 else nil)
	local var30 = getGameTileHiddenStore(p1.gameSortId)
	local _ = nil
	local var31 = useRenderGameCollectionItemModule(if gameTileLayoutType == "Narrow" and not p1.playerCountStyle then gameTileConstants.PlayerCountStyleValues.Footer else p1.playerCountStyle, p1.isSponsoredFooterAllowed, gameTileLayoutType, p1.friendFooterEnabled, p1.pageContext == appPage.Home, var24, var3, var15, var16, if p1.launchExperienceEventContextOverride then p1.launchExperienceEventContextOverride else discoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if var12.isOmni then p1.gameSortId else nil, nil, nil, p1.playButtonStyle, containedTile, shouldHideTileTitle, shouldHideTileMetadata, if var25 then var26.onHoldableFocused else nil, if var25 then var26.onHoldableUnfocused else nil, if var25 then var26.shouldDisableHoldable else nil, var28, titleTextLines, nil, nil, var17, nil, p1.selectionOrderBase, p1.enableExplicitFeedback, signalsReactModule.useSignalState(var30.getHiddenGames), var30.setGameHidden, p1.pageContext, p1.sponsoredUserCohort, p1.enableSponsoredFeedback, p1.enableReportAd, if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil, #u683, p1.isSponsoredRatingFooterAllowed, nil, nil, nil, var4, if fFlagLuaAppNarrowTileHideRating then var5 else nil, if fFlagLuaAppNarrowTileHidePlayerCount then var6 else nil, p1.videoPlaybackContext)
	
	if not fFlagLuaAppCompositionAlways then
		local var32 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var13 (ref), var32 (ref), p1 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var13.numColumns ~= var32.current then
				var32.current = var13.numColumns
				
				if p1.onItemsPerRowChanged then
					p1.onItemsPerRowChanged(var13.numColumns)
				end
			end
		end, {
			var13.numColumns,
			p1.onItemsPerRowChanged,
			var32,
			fFlagLuaAppCompositionAlways_1
		})
	end
	return if var12.gameSortDataFound then reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var7 else nil,
			LayoutOrder = if fFlagLuaAppRfyRevealRows then p1.LayoutOrder else nil,
			ZIndex = if fFlagLuaAppRfyRevealRows then p1.ZIndex else nil,
			title = p1.title,
			subtitle = if var12.sort then var12.sort.subtitle else nil,
			onViewableItemsChanged = var22,
			containerRef = var11,
			tooltipInfoText = var19,
			items = u683,
			onActivateInfoIcon = var18,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			renderItem = var31,
			getItemHeight = var29,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var13.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var13.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var13.sideMargin,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var13.verticalPadding,
			maxNumRows = p1.maxNumRows,
			bufferRowsBelowScreen = luaAppGameGridBufferRowsBelowScreen,
			bufferRowsAboveScreen = luaAppGameGridBufferRowsAboveScreen,
			headerComponent = p1.headerComponent,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then p1.headerTag else nil,
			testId = if p1.gameSortId then `--{p0.gameSortId}-game-collection-grid` else nil
		}),
		GameSortImpressionsDetector = reactModule.createElement(waitForPropWrapperModule, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(gameSortImpressionsDetectorModule, {
				parentRef = var10,
				pageContext = p1.pageContext,
				impressionsTag = var24,
				scrollViewPositionChangedSignal = var21,
				sendGameImpressions = var20,
				dataUpdatedTimestamp = if var12.gameSortContents then var12.gameSortContents.updatedTimestamp else nil
			})
		}),
		HoldToPlayLauncher = if var25 and var26.shouldRenderHoldToPlayLauncher then reactModule.createElement(holdToPlayLauncher, {
			selectedIndex = var26.selectedIndex,
			selectedEntry = var26.selectedEntry,
			selectedNavigationUniverseId = var26.selectedNavigationUniverseId,
			holdState = var26.holdState,
			holdProgress = var26.holdProgress,
			cancelHold = var26.cancelHold,
			launchContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p1.pageContext,
			reportExperienceLaunched = var16
		}) else nil
	}) else nil
end)