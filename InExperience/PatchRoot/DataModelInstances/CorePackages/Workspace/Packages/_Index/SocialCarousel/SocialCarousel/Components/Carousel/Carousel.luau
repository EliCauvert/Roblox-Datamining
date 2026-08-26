local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local usePageSideMargin = collectionViewsModule.usePageSideMargin
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useLocalization = localizationModule.Hooks.useLocalization
local tileComponentsModule = require(socialCarousel.Common.TileComponents)
local tile = require(socialCarousel.Common.Enums).Tile
local constantsModule = require(socialCarousel.Common.Constants)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local useColdStartLayoutReadyModule = require(socialCarousel.Hooks.useColdStartLayoutReady)
local useTokens = foundationModule.Hooks.useTokens
local useTilesSeenCollectionModule = require(socialCarousel.Analytics.useTilesSeenCollection)
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fFlagSocialCarouselFixColdStartJitterModule = require(socialCarousel.Flags.FFlagSocialCarouselFixColdStartJitter)
local socialCarouselFixLoadingSkeletonSizing = game:DefineFastFlag("SocialCarouselFixLoadingSkeletonSizing", false)
local fixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local fFlagFlyoutHideFriendsHeaderModule = require(socialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagEnableFlyoutFriendsHeaderFix = sharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppFriendsSortHeaderByPosition = sharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition
local t = {}

return function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), fFlagSocialCarouselFixColdStartJitterModule (ref), robloxAppHooksModule (ref), useColdStartLayoutReadyModule (ref), tileComponentsModule (ref), socialCarouselFixLoadingSkeletonSizing (ref), tile (ref), t (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var1
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var2 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var3 = useSocialCarouselContextModule()
	local var4 = useTilesSeenCollectionModule()
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var1 = not var3.isLoading
		
		if var1 then
			var1 = var3.friendCount > 0
			var1 = nil
		end
	else
		var1 = var3.friendCount > 0
	end
	local var12 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var1 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var3.friendCount
		} elseif not var1 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var3.friendCount
		}
	})
	local var13 = useCollectionLayoutParams(collectionItemSize.XSmall, var5, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var5) else nil
	})
	local var14 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(collectionItemSize.XSmall).itemsPerRow else var13.numColumns
	local var15 = false
	local var16 = nil
	
	if fFlagSocialCarouselFixColdStartJitterModule then
		local var17, var18 = reactModule.useState(Vector2.zero)
		var15 = useColdStartLayoutReadyModule(robloxAppHooksModule.useDeviceOrientation() ~= nil, robloxAppHooksModule.useScreenSize(), var17.X, var14)
		var16 = reactModule.useCallback(function(p2)
			-- upvalues: var18 (ref)
			var18(p2)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var10 (ref), var9 (ref), var11 (ref)
		if var14 ~= var10.current then
			var10.current = var14
			var9.current = false
			
			if var11.current then
				pcall(task.cancel, var11.current)
			end
			var11.current = task.delay(0.2, function()
				-- upvalues: var9 (copy), var11 (copy)
				var9.current = true
				var11.current = nil
			end)
		end
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			if var11.current then
				pcall(task.cancel, var11.current)
			end
		end
	end, {})
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var2 (ref)
		return p2 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var2.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var3.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var3.isLoading
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var6,
			scrollingFrameRef = var7,
			onContainerSizeChanged = if fFlagSocialCarouselFixColdStartJitterModule then var16 else nil,
			title = var12.friendsLabel,
			items = if fFlagSocialCarouselFixColdStartJitterModule and not var15 then t elseif isLoading then reactModule.useMemo(function()
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var14 (ref), socialCarouselFixLoadingSkeletonSizing (copy), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, (var14 or 5) + (if socialCarouselFixLoadingSkeletonSizing then 1 else 0) do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var14 }) else var3.tiles,
			renderItem = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: selectionOrderBase (ref), tileComponentsModule (copy), p1 (ref)
				return tileComponentsModule[p2.tileType](p2, p3, p4, if selectionOrderBase then selectionOrderBase + p3 else nil, function(p5, p6)
					-- upvalues: p1 (copy), p2 (ref)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p5, p6, p2)
					end
				end), p2.tileType
			end, { selectionOrderBase, p1.onTileContentChanged }),
			getItemHeight = var19,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var13.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var13.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var13.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var13.sideMargin,
			maxItemsToShow = var13.maxTilesToShow,
			thresholdFromEnd = var13.loadMoreThreshold,
			onViewableItemsChanged = if isLoading or fFlagSocialCarouselFixColdStartJitterModule and not var15 then nil else reactModule.useCallback(function(p2, p3)
				-- upvalues: var3 (ref), var5 (ref), var7 (ref), var9 (ref), var14 (ref), var8 (ref), var4 (ref)
				if var3.unifiedLogging then
					var3.unifiedLogging.onCollectionViewabilityChanged(p2, p3)
				end
				if var3.tiles and var5 and (var7.current and var9.current) then
					local absoluteSize = var5.AbsoluteSize
					local var20 = absoluteSize.X / var14
					local x = var7.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var20) + 1)
					local minValue = math.min(#var3.tiles, math.ceil((x + absoluteSize.X) / var20))
					var8.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var21 = var3.tiles[i]
						
						if var21 and var21.id then
							var4.addTileToCollection(var21.id, i, var21)
						end
					end
				end
			end, {
				p1.onViewableItemsChanged, var3.tiles, var5, var7, var14, var4
			}),
			onChangeCanvasPosition = if var3.unifiedLogging and not isLoading and (not fFlagSocialCarouselFixColdStartJitterModule or var15) then var3.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var3.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var3.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var3.unifiedLogging and (not fFlagSocialCarouselFixColdStartJitterModule or var15) then var3.unifiedLogging.renderImpressionsTrackerComponent(var7) else nil
	})
end