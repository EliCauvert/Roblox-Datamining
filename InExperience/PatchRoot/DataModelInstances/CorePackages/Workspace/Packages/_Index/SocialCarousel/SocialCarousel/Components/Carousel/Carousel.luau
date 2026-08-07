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
local fixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local fFlagFlyoutHideFriendsHeaderModule = require(socialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagEnableFlyoutFriendsHeaderFix = sharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppFriendsSortHeaderByPosition = sharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition

return function(p0) --[[ line: 41 | named "Carousel" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), tileComponentsModule (ref), tile (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var24
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p0.appCompositionEnabled
	local var14 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var15 = useSocialCarouselContextModule()
	local var16 = useTilesSeenCollectionModule()
	local var17, var18 = reactModule.useState(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var24 = not var15.isLoading
		
		if var24 then
			var24 = var15.friendCount > 0
			var24 = nil
		end
	else
		var24 = var15.friendCount > 0
	end
	local var25 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var24 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var15.friendCount
		} elseif not var24 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var15.friendCount
		}
	})
	local var26 = useCollectionLayoutParams(collectionItemSize.XSmall, var17, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var17) else nil
	})
	local var27 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(collectionItemSize.XSmall).itemsPerRow else var26.numColumns
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: var27 (ref), var22 (ref), var21 (ref), var23 (ref)
		if var27 ~= var22.current then
			var22.current = var27
			var21.current = false
			
			if var23.current then
				pcall(task.cancel, var23.current)
			end
			var23.current = task.delay(0.2, function() --[[ line: 95 ]]
				-- upvalues: var21 (copy), var23 (copy)
				var21.current = true
				var23.current = nil
			end)
		end
	end, { var27 })
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: var23 (ref)
		return function() --[[ line: 103 ]]
			-- upvalues: var23 (copy)
			if var23.current then
				pcall(task.cancel, var23.current)
			end
		end
	end, {})
	local var28 = reactModule.useCallback(function(p1) --[[ line: 110 ]]
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var14 (ref)
		return p1 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var14.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var15.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var15.isLoading
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var18,
			scrollingFrameRef = var19,
			title = var25.friendsLabel,
			items = if isLoading then reactModule.useMemo(function() --[[ line: 182 ]]
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var27 (ref), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, var27 or 5 do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var27 }) else var15.tiles,
			renderItem = reactModule.useCallback(function(p2, p3, p4) --[[ line: 120 ]]
				-- upvalues: selectionOrderBase (ref), tileComponentsModule (copy), p0 (ref)
				return tileComponentsModule[p2.tileType](p2, p3, p4, if selectionOrderBase then selectionOrderBase + p3 else nil, function(p5, p6) --[[ line: 127 ]]
					-- upvalues: p0 (copy), p2 (ref)
					if p0.onTileContentChanged then
						p0.onTileContentChanged(p5, p6, p2)
					end
				end), p2.tileType
			end, { selectionOrderBase, p0.onTileContentChanged }),
			getItemHeight = var28,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var26.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var26.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var26.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var26.sideMargin,
			maxItemsToShow = var26.maxTilesToShow,
			thresholdFromEnd = var26.loadMoreThreshold,
			onViewableItemsChanged = if isLoading then nil else reactModule.useCallback(function(p7, p8) --[[ line: 142 ]]
				-- upvalues: var15 (ref), var17 (ref), var19 (ref), var21 (ref), var27 (ref), var20 (ref), var16 (ref)
				if var15.unifiedLogging then
					var15.unifiedLogging.onCollectionViewabilityChanged(p7, p8)
				end
				if var15.tiles and var17 and (var19.current and var21.current) then
					local absoluteSize = var17.AbsoluteSize
					local var31 = absoluteSize.X / var27
					local x = var19.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var31) + 1)
					local minValue = math.min(#var15.tiles, math.ceil((x + absoluteSize.X) / var31))
					var20.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var34 = var15.tiles[i]
						
						if var34 and var34.id then
							var16.addTileToCollection(var34.id, i, var34)
						end
					end
				end
			end, {
				p0.onViewableItemsChanged, var15.tiles, var17, var19, var27, var16
			}),
			onChangeCanvasPosition = if var15.unifiedLogging and not isLoading then var15.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p0.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var15.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var15.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var15.unifiedLogging then var15.unifiedLogging.renderImpressionsTrackerComponent(var19) else nil
	})
end