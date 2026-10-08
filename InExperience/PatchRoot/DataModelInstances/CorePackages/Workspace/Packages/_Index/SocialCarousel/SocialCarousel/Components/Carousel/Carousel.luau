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
local enumsModule = require(socialCarousel.Common.Enums)
local tile = enumsModule.Tile
local marqueePlayStatus = enumsModule.MarqueePlayStatus
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
local fFlagSocialCarouselInGameTitleMarquee = require(parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local var1 = if fFlagSocialCarouselInGameTitleMarquee then require(socialCarousel.Components.Carousel.useMarqueeActiveTiles).useMarqueeActiveTiles else nil
local t = {}

return function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), fFlagSocialCarouselFixColdStartJitterModule (ref), robloxAppHooksModule (ref), useColdStartLayoutReadyModule (ref), fFlagSocialCarouselInGameTitleMarquee (ref), socialCarouselFixLoadingSkeletonSizing (ref), collectionViewsModule (ref), var1 (write), marqueePlayStatus (ref), tileComponentsModule (ref), tile (ref), t (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var2
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var3 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var4 = useSocialCarouselContextModule()
	local var5 = useTilesSeenCollectionModule()
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var2 = not var4.isLoading
		
		if var2 then
			var2 = var4.friendCount > 0
			var2 = nil
		end
	else
		var2 = var4.friendCount > 0
	end
	local var13 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var2 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var4.friendCount
		} elseif not var2 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var4.friendCount
		}
	})
	local var14 = useCollectionLayoutParams(collectionItemSize.XSmall, var6, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var6) else nil
	})
	local var15 = useCollectionLayout(collectionItemSize.XSmall)
	local var16 = if fFlagLuaAppCompositionAlways_1 then var15.itemsPerRow else var14.numColumns
	local var17 = false
	local var18 = nil
	
	if fFlagSocialCarouselFixColdStartJitterModule then
		local var19, var20 = reactModule.useState(Vector2.zero)
		var17 = useColdStartLayoutReadyModule(robloxAppHooksModule.useDeviceOrientation() ~= nil, robloxAppHooksModule.useScreenSize(), var19.X, var16)
		var18 = reactModule.useCallback(function(p2)
			-- upvalues: var20 (ref)
			var20(p2)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var11 (ref), var10 (ref), var12 (ref)
		if var16 ~= var11.current then
			var11.current = var16
			var10.current = false
			
			if var12.current then
				pcall(task.cancel, var12.current)
			end
			var12.current = task.delay(0.2, function()
				-- upvalues: var10 (copy), var12 (copy)
				var10.current = true
				var12.current = nil
			end)
		end
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			if var12.current then
				pcall(task.cancel, var12.current)
			end
		end
	end, {})
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var3 (ref)
		return p2 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var3.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var4.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var4.isLoading
	local activeByIndex = nil
	local isPaused = false
	
	if fFlagSocialCarouselInGameTitleMarquee then
		local var22 = if var6 then var6.AbsoluteSize.X else 0
		local var23 = if fFlagLuaAppCompositionAlways_1 then var15.gutter else var14.columnGap
		local var24 = if fFlagLuaAppCompositionAlways_1 then 0 else var14.sideMargin
		local var25 = if fFlagSocialCarouselFixColdStartJitterModule and not var17 then 0 elseif isLoading then (var16 or 5) + (if socialCarouselFixLoadingSkeletonSizing then 1 else 0) elseif var4.tiles then #var4.tiles else 0
		local var26 = var1(var8, {
			tileCount = if isLoading or not var4.tiles then 0 else #var4.tiles,
			containerWidth = math.max(0, var22 - 2 * (var24 or 0)),
			tileWidth = if var16 > 0 and var22 > 0 then collectionViewsModule.calculateItemWidth(var16, var23 or 0, var24 or 0, var22, (if (var16 or 0) < math.min(var14.maxTilesToShow or var25, var25) then if fFlagLuaAppCompositionAlways_1 then 0 else var14.fractionalItemAmount or 0 else 0) or 0, (if fFlagLuaAppCompositionAlways_1 then var15.carouselPeek else 0) or 0) else 0,
			columnGap = var23 or 0
		})
		activeByIndex = var26.activeByIndex
		isPaused = var26.isPaused
	end
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var7,
			scrollingFrameRef = var8,
			onContainerSizeChanged = if fFlagSocialCarouselFixColdStartJitterModule then var18 else nil,
			title = var13.friendsLabel,
			items = if fFlagSocialCarouselFixColdStartJitterModule and not var17 then t elseif isLoading then reactModule.useMemo(function()
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var16 (ref), socialCarouselFixLoadingSkeletonSizing (copy), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, (var16 or 5) + (if socialCarouselFixLoadingSkeletonSizing then 1 else 0) do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var16 }) else var4.tiles,
			renderItem = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: selectionOrderBase (ref), fFlagSocialCarouselInGameTitleMarquee (copy), activeByIndex (write), marqueePlayStatus (copy), isPaused (write), tileComponentsModule (copy), p1 (ref)
				return tileComponentsModule[p2.tileType](p2, p3, p4, if selectionOrderBase then selectionOrderBase + p3 else nil, function(p5, p6)
					-- upvalues: p1 (copy), p2 (ref)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p5, p6, p2)
					end
				end, if fFlagSocialCarouselInGameTitleMarquee and activeByIndex then if activeByIndex[p3] ~= true then if isPaused then marqueePlayStatus.Paused else marqueePlayStatus.Playing else marqueePlayStatus.Idle else nil), p2.tileType
			end, {
				selectionOrderBase,
				p1.onTileContentChanged,
				if fFlagSocialCarouselInGameTitleMarquee then activeByIndex else nil,
				if fFlagSocialCarouselInGameTitleMarquee then isPaused else nil
			}),
			getItemHeight = var21,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var14.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var14.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var14.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var14.sideMargin,
			maxItemsToShow = var14.maxTilesToShow,
			thresholdFromEnd = var14.loadMoreThreshold,
			onViewableItemsChanged = if isLoading or fFlagSocialCarouselFixColdStartJitterModule and not var17 then nil else reactModule.useCallback(function(p2, p3)
				-- upvalues: var4 (ref), var6 (ref), var8 (ref), var10 (ref), var16 (ref), var9 (ref), var5 (ref)
				if var4.unifiedLogging then
					var4.unifiedLogging.onCollectionViewabilityChanged(p2, p3)
				end
				if var4.tiles and var6 and (var8.current and var10.current) then
					local absoluteSize = var6.AbsoluteSize
					local var27 = absoluteSize.X / var16
					local x = var8.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var27) + 1)
					local minValue = math.min(#var4.tiles, math.ceil((x + absoluteSize.X) / var27))
					var9.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var28 = var4.tiles[i]
						
						if var28 and var28.id then
							var5.addTileToCollection(var28.id, i, var28)
						end
					end
				end
			end, {
				p1.onViewableItemsChanged, var4.tiles, var6, var8, var16, var5
			}),
			onChangeCanvasPosition = if var4.unifiedLogging and not isLoading and (not fFlagSocialCarouselFixColdStartJitterModule or var17) then var4.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var4.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var4.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var4.unifiedLogging and (not fFlagSocialCarouselFixColdStartJitterModule or var17) then var4.unifiedLogging.renderImpressionsTrackerComponent(var8) else nil
	})
end