local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TileComponentsModule = require(SocialCarousel.Common.TileComponents)
local Tile = require(SocialCarousel.Common.Enums).Tile
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseTilesSeenCollectionModule = require(SocialCarousel.Analytics.useTilesSeenCollection)
local FFlagSocialCarouselShowLoadingSkeletonModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local FixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local FFlagFlyoutHideFriendsHeaderModule = require(SocialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FixCarouselTileSizeScaling (copy), UseTokensFunction (copy), UseSocialCarouselContextModule (copy), UseTilesSeenCollectionModule (copy), ReactModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy), FFlagConnectionsToFriendsRename (copy), ConstantsModule (copy), UseLocalizationFunction (copy), UsePageSideMarginFunction (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), UseCollectionLayoutFunction (copy), TileComponentsModule (copy), Tile (copy), CollectionCarousel (copy), FFlagFlyoutHideFriendsHeaderModule (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local UseTokensResult = if FixCarouselTileSizeScaling then UseTokensFunction() else nil
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseTilesSeenCollectionModuleResult = UseTilesSeenCollectionModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({ startIndex = 1, endIndex = 1 })
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local IsFriendCountAbove: boolean = if FFlagSocialCarouselShowLoadingSkeletonModule then not UseSocialCarouselContextModuleResult.isLoading and UseSocialCarouselContextModuleResult.friendCount > 0 else UseSocialCarouselContextModuleResult.friendCount > 0
	local UseLocalizationResult = UseLocalizationFunction({
		friendsLabel = if FFlagConnectionsToFriendsRename then if IsFriendCountAbove then {
			ConstantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = UseSocialCarouselContextModuleResult.friendCount
		} else ConstantsModule.LOCALIZATION.FRIENDS_LABEL elseif IsFriendCountAbove then {
			ConstantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = UseSocialCarouselContextModuleResult.friendCount
		} else ConstantsModule.LOCALIZATION.CONNECTIONS_LABEL
	})
	local UsePageSideMarginResult = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(UseStateResult)
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.XSmall, UseStateResult, true, {
		sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UsePageSideMarginResult
	})
	local ItemsPerRow = UseCollectionLayoutFunction(CollectionItemSize.XSmall).itemsPerRow
	local ItemsPerRow1 = if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseCollectionLayoutParamsResult.numColumns
	ReactModule.useEffect(function()
		-- upvalues: ItemsPerRow1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult4 (copy)
		if ItemsPerRow1 ~= UseRefResult3.current then
			UseRefResult3.current = ItemsPerRow1
			UseRefResult2.current = false
			
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
			end
			UseRefResult4.current = task.delay(0.2, function()
				-- upvalues: UseRefResult2 (upval), UseRefResult4 (upval)
				UseRefResult2.current = true
				UseRefResult4.current = nil
			end)
		end
	end, { ItemsPerRow1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy)
		return function()
			-- upvalues: UseRefResult4 (upval)
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
			end
		end
	end, {})
	local SelectionOrderBase = UseSocialCarouselContextModuleResult.selectionOrderBase
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseSocialCarouselContextModuleResult (copy), UseStateResult (copy), UseRefResult (copy), UseRefResult2 (copy), ItemsPerRow1 (copy), UseRefResult1 (copy), UseTilesSeenCollectionModuleResult (copy)
		if UseSocialCarouselContextModuleResult.unifiedLogging then
			UseSocialCarouselContextModuleResult.unifiedLogging.onCollectionViewabilityChanged(p2, p3)
		end
		if UseSocialCarouselContextModuleResult.tiles and UseStateResult and UseRefResult.current and UseRefResult2.current then
			local AbsoluteSize = UseStateResult.AbsoluteSize
			local XRatio = AbsoluteSize.X / ItemsPerRow1
			local X = UseRefResult.current.CanvasPosition.X
			local Largest = math.max(1, math.floor(X / XRatio) + 1)
			local Smallest = math.min(#UseSocialCarouselContextModuleResult.tiles, (math.ceil((X + AbsoluteSize.X) / XRatio)))
			UseRefResult1.current = { startIndex = Largest, endIndex = Smallest }
			
			for i = Largest, Smallest do
				local Tile = UseSocialCarouselContextModuleResult.tiles[i]
				
				if Tile and Tile.id then
					UseTilesSeenCollectionModuleResult.addTileToCollection(Tile.id, i, Tile)
				end
			end
		end
	end, {
		p1.onViewableItemsChanged, UseSocialCarouselContextModuleResult.tiles,
		UseStateResult, UseRefResult, ItemsPerRow1, UseTilesSeenCollectionModuleResult
	})
	local IsLoading = FFlagSocialCarouselShowLoadingSkeletonModule and UseSocialCarouselContextModuleResult.isLoading
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagSocialCarouselShowLoadingSkeletonModule (upval), ItemsPerRow1 (copy), Tile (upval)
		local t = {}
		
		if not FFlagSocialCarouselShowLoadingSkeletonModule then
			return t
		end
		for i = 1, ItemsPerRow1 or 5 do
			t[i] = { id = "skeleton_" .. i, tileType = Tile.Skeleton }
		end
		return t
	end, { ItemsPerRow1 })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			LayoutOrder = 1,
			containerRef = UseStateResult2,
			scrollingFrameRef = UseRefResult,
			title = UseLocalizationResult.friendsLabel,
			items = if IsLoading then UseMemoResult else UseSocialCarouselContextModuleResult.tiles,
			renderItem = ReactModule.useCallback(function(p4, p5, p6)
				-- upvalues: SelectionOrderBase (copy), TileComponentsModule (upval), p1 (copy)
				return TileComponentsModule[p4.tileType](p4, p5, p6, if SelectionOrderBase then SelectionOrderBase + p5 else nil, function(p7, p8)
					-- upvalues: p1 (upval), p4 (copy)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p7, p8, p4)
					end
				end), p4.tileType
			end, { SelectionOrderBase, p1.onTileContentChanged }),
			getItemHeight = ReactModule.useCallback(function(p4)
				-- upvalues: FixCarouselTileSizeScaling (upval), ConstantsModule (upval), UseTokensResult (copy)
				return p4 + (if FixCarouselTileSizeScaling then ConstantsModule.TILE_TEXT_HEIGHT * UseTokensResult.Config.UI.Scale else ConstantsModule.TILE_TEXT_HEIGHT)
			end, {}),
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then CollectionItemSize.XSmall else nil,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseCollectionLayoutParamsResult.maxTilesToShow,
			thresholdFromEnd = UseCollectionLayoutParamsResult.loadMoreThreshold,
			onViewableItemsChanged = if IsLoading then nil else UseResult,
			onChangeCanvasPosition = if UseSocialCarouselContextModuleResult.unifiedLogging and not IsLoading then UseSocialCarouselContextModuleResult.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if UseSocialCarouselContextModuleResult.hideCarouselHeader then ReactModule.createElement(ReactModule.Fragment, nil, {}) elseif FFlagFlyoutHideFriendsHeaderModule and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then ReactModule.createElement(ReactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if UseSocialCarouselContextModuleResult.unifiedLogging then UseSocialCarouselContextModuleResult.unifiedLogging.renderImpressionsTrackerComponent(UseRefResult) else nil
	})
end