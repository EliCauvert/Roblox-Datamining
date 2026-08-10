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
local var23 = tModule.strictInterface({
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

return reactModule.memo(function(p0) --[[ line: 174 | named "GameCollectionGrid" ]]
	-- upvalues: validateProps (ref), var23 (ref), useAppPolicy (ref), usePreferredInput (ref), fFlagLuaAppHomeReduceRenders (ref), luaAppGameGridBufferRowsBelowScreen (ref), responsiveModule (ref), luaAppGameGridBufferRowsAboveScreen (ref), fFlagLuaAppCompositionAlways (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), useBreakpointXOrSmaller (ref), getGameTileCollectionItemSize (ref), reactModule (ref), fFlagLuaAppRfyRevealRowsFocusFix (ref), composeRefs (ref), useGameSortDataModule (ref), cryoModule (ref), useGameCollectionLayoutParamsModule (ref), fFlagLuaAppFixCompositionSizeOverrideGap (ref), useCollectionLayout (ref), useSizeAdjustedEntriesModule (ref), useGameSortAnalyticsModule (ref), gameTileModule (ref), useGameSortTooltipParamsModule (ref), useGameSortImpressionsParamsModule (ref), fFlagLuaAppFixSearchImpressions (ref), useIsHoldToPlayEnabledForGamesModule (ref), useHoldToPlayStateAndCallbacks (ref), useControllerBarFocusNavigationBindings (ref), useTextSizeOffset (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), getGameTileHiddenStore (ref), signalsReactModule (ref), useRenderGameCollectionItemModule (ref), appPage (ref), discoveryAnalyticsModule (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), gameSortImpressionsDetectorModule (ref), collectionGrid (ref), fFlagLuaAppRfyRevealRows (ref), fFlagLuaAppSortHeaderAnchorTag (ref), waitForPropWrapperModule (ref), holdToPlayLauncher (ref)
	validateProps(var23, p0)
	local var24 = useAppPolicy(function(p1) --[[ line: 178 ]]
		return p1.useGridPageLayout()
	end)
	local var25 = usePreferredInput()
	local var26 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsBelowScreen elseif var25 == responsiveModule.Input.Directional then 4 else 2
	local var27 = if fFlagLuaAppHomeReduceRenders then luaAppGameGridBufferRowsAboveScreen elseif var25 == responsiveModule.Input.Directional then 4 else 1
	local var28 = p0.isHoverSupportEnabled and (var24 and var25 == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p0.appCompositionEnabled
	local var31 = nil
	local var32 = nil
	local var33 = nil
	
	if fFlagLuaAppNarrowTileSmallerFooterFont or fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then
		local var34 = fFlagLuaAppCompositionAlways_1 and (gameTileLayoutType == "Narrow" and useBreakpointXOrSmaller(responsiveModule.Keys.Small))
		var31 = if fFlagLuaAppNarrowTileSmallerFooterFont then var34 else nil
		var32 = if fFlagLuaAppNarrowTileHideRating then var34 else nil
		var33 = if fFlagLuaAppNarrowTileHidePlayerCount then var34 else nil
	end
	local itemsPerRow, var42
	local var35 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var36, var37 = reactModule.useState(nil)
	local var38 = reactModule.useRef(var36)
	var38.current = var36
	local var39 = if fFlagLuaAppRfyRevealRowsFocusFix then reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: composeRefs (copy), var37 (ref), p0 (ref)
		return composeRefs(var37, p0.gridContainerRef)
	end, { p0.gridContainerRef }) else nil
	local var40 = useGameSortDataModule(p0.gameSortId, p0.pageContext, p0.searchParams and p0.searchParams.searchUuid)
	local var41 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var36, false, reactModule.useMemo(function() --[[ line: 237 ]]
		-- upvalues: var24 (ref), p0 (ref), cryoModule (copy)
		local var67 = if var24 then nil else p0.sideMargin
		
		return if not (not p0.layoutOverrides and not var67) then cryoModule.Dictionary.join(p0.layoutOverrides or {}, {
			sideMargin = if p0.layoutOverrides and p0.layoutOverrides.sideMargin then p0.layoutOverrides.sideMargin else var67
		}) else nil
	end, { p0.layoutOverrides, var24, p0.sideMargin }))
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppFixCompositionSizeOverrideGap then
		local var43 = useCollectionLayout(var35)
		itemsPerRow = var43.itemsPerRow
		var42 = useSizeAdjustedEntriesModule(p0.entries, if fFlagLuaAppCompositionAlways_1 then var43.gutter else var41.columnGap, if fFlagLuaAppCompositionAlways_1 then var43.verticalGap else var41.verticalPadding)
	else
		var42 = useSizeAdjustedEntriesModule(p0.entries, var41.columnGap, var41.verticalPadding)
		itemsPerRow = useCollectionLayout(var35).itemsPerRow
	end
	local var44 = if fFlagLuaAppCompositionAlways_1 then itemsPerRow or 0 else var41.numColumns or 0
	local var45, var46 = useGameSortAnalyticsModule(var40.sort, var40.isOmni, p0.sortIndex, p0.pageContext, nil, var42, var44, p0.startRow)
	local var47 = gameTileModule.useVideoAnalytics(var40.sort, var40.isOmni, p0.pageContext, p0.sortIndex, var42)
	local var48, var49 = useGameSortTooltipParamsModule(var40.sort, var40.isOmni, p0.infoText)
	local var50, var51, var52 = useGameSortImpressionsParamsModule(var40.sort, var40.isOmni, p0.sortIndex, p0.pageContext, p0.useGridTiles, p0.componentType, var40.gamesApiSortPageId, p0.gameSortId, p0.scrollViewPositionChangedSignal, var44, p0.startRow, var42, p0.searchParams)
	local var53 = if fFlagLuaAppFixSearchImpressions and p0.searchParams then p0.searchParams.searchUuid else nil
	local var54 = if fFlagLuaAppFixSearchImpressions then reactModule.useMemo(function() --[[ line: 317 ]]
		-- upvalues: p0 (ref), var53 (ref)
		local pageContext = `GameGrid_{p0.pageContext}`
		
		if var53 then
			pageContext ..= `_{var53}`
		end
		return pageContext .. `_{p0.gameSortId}_{p0.sortIndex}`
	end, { p0.pageContext, var53, p0.gameSortId, p0.sortIndex }) else `GameGrid_{p0.gameSortId}_{p0.sortIndex}`
	local var55 = useIsHoldToPlayEnabledForGamesModule()
	local var56 = useHoldToPlayStateAndCallbacks()
	local var57 = useControllerBarFocusNavigationBindings(nil, if var55 then var56.holdToPlayEventHandler else nil)
	reactModule.useEffect(function() --[[ line: 344 ]]
		-- upvalues: var57 (ref), var36 (ref)
		if var57 then
			var57(var36)
		end
	end, { var57, var36 })
	local shouldHideTileTitle = p0.shouldHideTileTitle or false
	local shouldHideTileMetadata = p0.shouldHideTileMetadata or false
	local containedTile = p0.containedTile or false
	local var61 = useTextSizeOffset()
	local titleTextLines = gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines
	local var63 = useGetGameTileHeightModule(var28, gameTileLayoutType, containedTile, shouldHideTileMetadata, shouldHideTileTitle, var61, nil, titleTextLines, if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then var32 or var33 else nil)
	local var64 = getGameTileHiddenStore(p0.gameSortId)
	local _ = nil
	local var65 = useRenderGameCollectionItemModule(if gameTileLayoutType == "Narrow" and not p0.playerCountStyle then gameTileConstants.PlayerCountStyleValues.Footer else p0.playerCountStyle, p0.isSponsoredFooterAllowed, gameTileLayoutType, p0.friendFooterEnabled, p0.pageContext == appPage.Home, var54, var28, var45, var46, if p0.launchExperienceEventContextOverride then p0.launchExperienceEventContextOverride else discoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, if var40.isOmni then p0.gameSortId else nil, nil, nil, p0.playButtonStyle, containedTile, shouldHideTileTitle, shouldHideTileMetadata, if var55 then var56.onHoldableFocused else nil, if var55 then var56.onHoldableUnfocused else nil, if var55 then var56.shouldDisableHoldable else nil, var61, titleTextLines, nil, nil, var47, nil, p0.selectionOrderBase, p0.enableExplicitFeedback, signalsReactModule.useSignalState(var64.getHiddenGames), var64.setGameHidden, p0.pageContext, p0.sponsoredUserCohort, p0.enableSponsoredFeedback, if fFlagLuaAppEnableSponsoredReportAd then p0.enableReportAd else nil, #var42, p0.isSponsoredRatingFooterAllowed, nil, nil, nil, if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil, if fFlagLuaAppNarrowTileSmallerFooterFont then var31 else nil, if fFlagLuaAppNarrowTileHideRating then var32 else nil, if fFlagLuaAppNarrowTileHidePlayerCount then var33 else nil, p0.videoPlaybackContext)
	
	if not fFlagLuaAppCompositionAlways then
		local var66 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 443 ]]
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var41 (ref), var66 (ref), p0 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var41.numColumns ~= var66.current then
				var66.current = var41.numColumns
				
				if p0.onItemsPerRowChanged then
					p0.onItemsPerRowChanged(var41.numColumns)
				end
			end
		end, {
			var41.numColumns,
			p0.onItemsPerRowChanged,
			var66,
			fFlagLuaAppCompositionAlways_1
		})
	end
	return if var40.gameSortDataFound then reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var35 else nil,
			LayoutOrder = if fFlagLuaAppRfyRevealRows then p0.LayoutOrder else nil,
			ZIndex = if fFlagLuaAppRfyRevealRows then p0.ZIndex else nil,
			title = p0.title,
			subtitle = if var40.sort then var40.sort.subtitle else nil,
			onViewableItemsChanged = var52,
			containerRef = if fFlagLuaAppRfyRevealRowsFocusFix then var39 else var37,
			tooltipInfoText = var49,
			items = var42,
			onActivateInfoIcon = var48,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			renderItem = var65,
			getItemHeight = var63,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var41.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var41.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var41.sideMargin,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var41.verticalPadding,
			maxNumRows = p0.maxNumRows,
			bufferRowsBelowScreen = var26,
			bufferRowsAboveScreen = var27,
			headerComponent = p0.headerComponent,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then p0.headerTag else nil,
			testId = if p0.gameSortId then `--{p0.gameSortId}-game-collection-grid` else nil
		}),
		GameSortImpressionsDetector = reactModule.createElement(waitForPropWrapperModule, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(gameSortImpressionsDetectorModule, {
				parentRef = var38,
				pageContext = p0.pageContext,
				impressionsTag = var54,
				scrollViewPositionChangedSignal = var51,
				sendGameImpressions = var50,
				dataUpdatedTimestamp = if var40.gameSortContents then var40.gameSortContents.updatedTimestamp else nil
			})
		}),
		HoldToPlayLauncher = if var55 and var56.shouldRenderHoldToPlayLauncher then reactModule.createElement(holdToPlayLauncher, {
			selectedIndex = var56.selectedIndex,
			selectedEntry = var56.selectedEntry,
			selectedNavigationUniverseId = var56.selectedNavigationUniverseId,
			holdState = var56.holdState,
			holdProgress = var56.holdProgress,
			cancelHold = var56.cancelHold,
			launchContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
			referralSource = p0.pageContext,
			reportExperienceLaunched = var46
		}) else nil
	}) else nil
end)