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

return function(p0)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), fFlagSocialCarouselFixColdStartJitterModule (ref), robloxAppHooksModule (ref), useColdStartLayoutReadyModule (ref), tileComponentsModule (ref), socialCarouselFixLoadingSkeletonSizing (ref), tile (ref), t (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var29
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p0.appCompositionEnabled
	local var19 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var20 = useSocialCarouselContextModule()
	local var21 = useTilesSeenCollectionModule()
	local var22, var23 = reactModule.useState(nil)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var26 = reactModule.useRef(false)
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var29 = not var20.isLoading
		
		if var29 then
			var29 = var20.friendCount > 0
			var29 = nil
		end
	else
		var29 = var20.friendCount > 0
	end
	local var30 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var29 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var20.friendCount
		} elseif not var29 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var20.friendCount
		}
	})
	local var31 = useCollectionLayoutParams(collectionItemSize.XSmall, var22, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var22) else nil
	})
	local var32 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(collectionItemSize.XSmall).itemsPerRow else var31.numColumns
	local var33 = false
	local var34 = nil
	
	if fFlagSocialCarouselFixColdStartJitterModule then
		local var35, var36 = reactModule.useState(Vector2.zero)
		var33 = useColdStartLayoutReadyModule(robloxAppHooksModule.useDeviceOrientation() ~= nil, robloxAppHooksModule.useScreenSize(), var35.X, var32)
		var34 = reactModule.useCallback(function(p1)
			-- upvalues: var36 (ref)
			var36(p1)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var27 (ref), var26 (ref), var28 (ref)
		if var32 ~= var27.current then
			var27.current = var32
			var26.current = false
			
			if var28.current then
				pcall(task.cancel, var28.current)
			end
			var28.current = task.delay(0.2, function()
				-- upvalues: var26 (copy), var28 (copy)
				var26.current = true
				var28.current = nil
			end)
		end
	end, { var32 })
	reactModule.useEffect(function()
		-- upvalues: var28 (ref)
		return function()
			-- upvalues: var28 (copy)
			if var28.current then
				pcall(task.cancel, var28.current)
			end
		end
	end, {})
	local var37 = reactModule.useCallback(function(p2)
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var19 (ref)
		return p2 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var19.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var20.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var20.isLoading
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var23,
			scrollingFrameRef = var24,
			onContainerSizeChanged = if fFlagSocialCarouselFixColdStartJitterModule then var34 else nil,
			title = var30.friendsLabel,
			items = if fFlagSocialCarouselFixColdStartJitterModule and not var33 then t elseif isLoading then reactModule.useMemo(function()
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var32 (ref), socialCarouselFixLoadingSkeletonSizing (copy), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, (var32 or 5) + (if socialCarouselFixLoadingSkeletonSizing then 1 else 0) do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var32 }) else var20.tiles,
			renderItem = reactModule.useCallback(function(p3, p4, p5)
				-- upvalues: selectionOrderBase (ref), tileComponentsModule (copy), p0 (ref)
				return tileComponentsModule[p3.tileType](p3, p4, p5, if selectionOrderBase then selectionOrderBase + p4 else nil, function(p6, p7)
					-- upvalues: p0 (copy), p3 (ref)
					if p0.onTileContentChanged then
						p0.onTileContentChanged(p6, p7, p3)
					end
				end), p3.tileType
			end, { selectionOrderBase, p0.onTileContentChanged }),
			getItemHeight = var37,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var31.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var31.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var31.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var31.sideMargin,
			maxItemsToShow = var31.maxTilesToShow,
			thresholdFromEnd = var31.loadMoreThreshold,
			onViewableItemsChanged = if isLoading or fFlagSocialCarouselFixColdStartJitterModule and not var33 then nil else reactModule.useCallback(function(p8, p9)
				-- upvalues: var20 (ref), var22 (ref), var24 (ref), var26 (ref), var32 (ref), var25 (ref), var21 (ref)
				if var20.unifiedLogging then
					var20.unifiedLogging.onCollectionViewabilityChanged(p8, p9)
				end
				if var20.tiles and var22 and (var24.current and var26.current) then
					local absoluteSize = var22.AbsoluteSize
					local var40 = absoluteSize.X / var32
					local x = var24.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var40) + 1)
					local minValue = math.min(#var20.tiles, math.ceil((x + absoluteSize.X) / var40))
					var25.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var43 = var20.tiles[i]
						
						if var43 and var43.id then
							var21.addTileToCollection(var43.id, i, var43)
						end
					end
				end
			end, {
				p0.onViewableItemsChanged, var20.tiles, var22, var24, var32, var21
			}),
			onChangeCanvasPosition = if var20.unifiedLogging and not isLoading and (not fFlagSocialCarouselFixColdStartJitterModule or var33) then var20.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p0.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var20.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var20.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var20.unifiedLogging and (not fFlagSocialCarouselFixColdStartJitterModule or var33) then var20.unifiedLogging.renderImpressionsTrackerComponent(var24) else nil
	})
end