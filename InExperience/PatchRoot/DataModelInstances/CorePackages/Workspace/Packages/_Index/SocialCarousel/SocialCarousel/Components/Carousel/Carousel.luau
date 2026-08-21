local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
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
local useTokens = foundationModule.Hooks.useTokens
local useTilesSeenCollectionModule = require(socialCarousel.Analytics.useTilesSeenCollection)
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local socialCarouselFixLoadingSkeletonSizing = game:DefineFastFlag("SocialCarouselFixLoadingSkeletonSizing", false)
local fixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local fFlagFlyoutHideFriendsHeaderModule = require(socialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagEnableFlyoutFriendsHeaderFix = sharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppFriendsSortHeaderByPosition = sharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition

return function(p0) --[[ line: 42 | named "Carousel" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), tileComponentsModule (ref), socialCarouselFixLoadingSkeletonSizing (ref), tile (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var25
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p0.appCompositionEnabled
	local var15 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var16 = useSocialCarouselContextModule()
	local var17 = useTilesSeenCollectionModule()
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var25 = not var16.isLoading
		
		if var25 then
			var25 = var16.friendCount > 0
			var25 = nil
		end
	else
		var25 = var16.friendCount > 0
	end
	local var26 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var25 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var16.friendCount
		} elseif not var25 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var16.friendCount
		}
	})
	local var27 = useCollectionLayoutParams(collectionItemSize.XSmall, var18, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var18) else nil
	})
	local var28 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(collectionItemSize.XSmall).itemsPerRow else var27.numColumns
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var28 (ref), var23 (ref), var22 (ref), var24 (ref)
		if var28 ~= var23.current then
			var23.current = var28
			var22.current = false
			
			if var24.current then
				pcall(task.cancel, var24.current)
			end
			var24.current = task.delay(0.2, function() --[[ line: 96 ]]
				-- upvalues: var22 (copy), var24 (copy)
				var22.current = true
				var24.current = nil
			end)
		end
	end, { var28 })
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: var24 (ref)
		return function() --[[ line: 104 ]]
			-- upvalues: var24 (copy)
			if var24.current then
				pcall(task.cancel, var24.current)
			end
		end
	end, {})
	local var29 = reactModule.useCallback(function(p1) --[[ line: 111 ]]
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var15 (ref)
		return p1 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var15.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var16.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var16.isLoading
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var19,
			scrollingFrameRef = var20,
			title = var26.friendsLabel,
			items = if isLoading then reactModule.useMemo(function() --[[ line: 183 ]]
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var28 (ref), socialCarouselFixLoadingSkeletonSizing (copy), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, (var28 or 5) + (if socialCarouselFixLoadingSkeletonSizing then 1 else 0) do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var28 }) else var16.tiles,
			renderItem = reactModule.useCallback(function(p2, p3, p4) --[[ line: 121 ]]
				-- upvalues: selectionOrderBase (ref), tileComponentsModule (copy), p0 (ref)
				return tileComponentsModule[p2.tileType](p2, p3, p4, if selectionOrderBase then selectionOrderBase + p3 else nil, function(p5, p6) --[[ line: 128 ]]
					-- upvalues: p0 (copy), p2 (ref)
					if p0.onTileContentChanged then
						p0.onTileContentChanged(p5, p6, p2)
					end
				end), p2.tileType
			end, { selectionOrderBase, p0.onTileContentChanged }),
			getItemHeight = var29,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var27.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var27.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var27.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var27.sideMargin,
			maxItemsToShow = var27.maxTilesToShow,
			thresholdFromEnd = var27.loadMoreThreshold,
			onViewableItemsChanged = if isLoading then nil else reactModule.useCallback(function(p7, p8) --[[ line: 143 ]]
				-- upvalues: var16 (ref), var18 (ref), var20 (ref), var22 (ref), var28 (ref), var21 (ref), var17 (ref)
				if var16.unifiedLogging then
					var16.unifiedLogging.onCollectionViewabilityChanged(p7, p8)
				end
				if var16.tiles and var18 and (var20.current and var22.current) then
					local absoluteSize = var18.AbsoluteSize
					local var32 = absoluteSize.X / var28
					local x = var20.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var32) + 1)
					local minValue = math.min(#var16.tiles, math.ceil((x + absoluteSize.X) / var32))
					var21.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var35 = var16.tiles[i]
						
						if var35 and var35.id then
							var17.addTileToCollection(var35.id, i, var35)
						end
					end
				end
			end, {
				p0.onViewableItemsChanged, var16.tiles, var18, var20, var28, var17
			}),
			onChangeCanvasPosition = if var16.unifiedLogging and not isLoading then var16.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p0.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var16.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var16.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var16.unifiedLogging then var16.unifiedLogging.renderImpressionsTrackerComponent(var20) else nil
	})
end