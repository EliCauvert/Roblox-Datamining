local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
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
local UseColdStartLayoutReadyModule = require(SocialCarousel.Hooks.useColdStartLayoutReady)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseTilesSeenCollectionModule = require(SocialCarousel.Analytics.useTilesSeenCollection)
local FFlagSocialCarouselShowLoadingSkeletonModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local FFlagSocialCarouselFixColdStartJitterModule = require(SocialCarousel.Flags.FFlagSocialCarouselFixColdStartJitter)
local FixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local FFlagFlyoutHideFriendsHeaderModule = require(SocialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppFriendsSortHeaderByPosition = SharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local UseCarouselMarquee = if FFlagSocialCarouselInGameTitleMarquee then require(SocialCarousel.Components.Carousel.useCarouselMarquee).useCarouselMarquee else nil

local function _(Friend, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: Tile (copy)
	if Friend ~= Tile.Friend or p2 == nil then
		return nil, nil, nil, nil, nil, nil
	end
	local P9 = p9 or p10
	local Paused: string = if p2[p1] == true then if p3 then "Paused" else "Playing" else "Idle"
	local v1 = if p8 then p5 else nil
	local v2 = if P9 then p6 else nil
	local v3 = if P9 then p7 else nil
	
	if p10 then
		return Paused, v1, p4, v2, v3, true
	else
		return Paused, v1, p4, v2, v3, nil
	end
end

local t = {}

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FixCarouselTileSizeScaling (copy), UseTokensFunction (copy), UseSocialCarouselContextModule (copy), UseTilesSeenCollectionModule (copy), ReactModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy), ConstantsModule (copy), UseLocalizationFunction (copy), UsePageSideMarginFunction (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), UseCollectionLayoutFunction (copy), FFlagSocialCarouselFixColdStartJitterModule (copy), RobloxAppHooksModule (copy), UseColdStartLayoutReadyModule (copy), FFlagSocialCarouselInGameTitleMarquee (copy), UseCarouselMarquee (ref), Tile (copy), TileComponentsModule (copy), t (copy), CollectionCarousel (copy), FFlagLuaAppFriendsSortHeaderByPosition (copy), FFlagFlyoutHideFriendsHeaderModule (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
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
		friendsLabel = if IsFriendCountAbove then {
			ConstantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = UseSocialCarouselContextModuleResult.friendCount
		} else ConstantsModule.LOCALIZATION.FRIENDS_LABEL
	})
	local UsePageSideMarginResult = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(UseStateResult)
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.XSmall, UseStateResult, true, {
		sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UsePageSideMarginResult
	})
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(CollectionItemSize.XSmall)
	local ItemsPerRow = UseCollectionLayoutResult.itemsPerRow
	local ItemsPerRow1 = if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseCollectionLayoutParamsResult.numColumns
	local IsColdStartLayoutReady = false
	local UseResult = nil
	
	if FFlagSocialCarouselFixColdStartJitterModule then
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
		IsColdStartLayoutReady = UseColdStartLayoutReadyModule(RobloxAppHooksModule.useDeviceOrientation() ~= nil, RobloxAppHooksModule.useScreenSize(), UseStateResult1.X, ItemsPerRow1)
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(p2)
		end, {})
	end
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
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: FixCarouselTileSizeScaling (upval), ConstantsModule (upval), UseTokensResult (copy)
		return p2 + (if FixCarouselTileSizeScaling then ConstantsModule.TILE_TEXT_HEIGHT * UseTokensResult.Config.UI.Scale else ConstantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local SelectionOrderBase = UseSocialCarouselContextModuleResult.selectionOrderBase
	local IsLoading = FFlagSocialCarouselShowLoadingSkeletonModule and UseSocialCarouselContextModuleResult.isLoading
	local ActiveByIndex = nil
	local IsPaused = false
	local OnMarqueeFinished = nil
	local OnManualMarqueeStart = nil
	local OnManualMarqueeEnd = nil
	local MarqueeRunId = nil
	local HandsOff = false
	local DesktopEnabled = false
	local ConsoleEnabled = false
	
	if FFlagSocialCarouselInGameTitleMarquee then
		local UseCarouselMarqueeResult = UseCarouselMarquee(UseRefResult, UseSocialCarouselContextModuleResult.tiles, UseSocialCarouselContextModuleResult.openGameJoinCardUserId, {
			defaultSkeletonCount = 5,
			appCompositionEnabled = FFlagLuaAppCompositionAlways1,
			itemsPerRow = ItemsPerRow1,
			showSkeleton = IsLoading,
			isColdStartLayoutReady = IsColdStartLayoutReady,
			containerFrame = UseStateResult,
			gutter = UseCollectionLayoutResult.gutter,
			carouselPeek = UseCollectionLayoutResult.carouselPeek,
			columnGap = UseCollectionLayoutParamsResult.columnGap,
			sideMargin = UseCollectionLayoutParamsResult.sideMargin,
			fractionalItemAmount = UseCollectionLayoutParamsResult.fractionalItemAmount,
			maxTilesToShow = UseCollectionLayoutParamsResult.maxTilesToShow
		})
		ActiveByIndex = UseCarouselMarqueeResult.activeByIndex
		IsPaused = UseCarouselMarqueeResult.isPaused
		OnMarqueeFinished = UseCarouselMarqueeResult.onMarqueeFinished
		OnManualMarqueeStart = UseCarouselMarqueeResult.onManualMarqueeStart
		OnManualMarqueeEnd = UseCarouselMarqueeResult.onManualMarqueeEnd
		MarqueeRunId = UseCarouselMarqueeResult.marqueeRunId
		HandsOff = UseCarouselMarqueeResult.handsOff
		DesktopEnabled = UseCarouselMarqueeResult.desktopEnabled
		ConsoleEnabled = UseCarouselMarqueeResult.consoleEnabled
	end
	local UseResult2 = ReactModule.useCallback(function(p2, p3)
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagSocialCarouselShowLoadingSkeletonModule (upval), ItemsPerRow1 (copy), Tile (upval)
		local t = {}
		
		if not FFlagSocialCarouselShowLoadingSkeletonModule then
			return t
		end
		for i = 1, (ItemsPerRow1 or 5) + 1 do
			t[i] = { id = "skeleton_" .. i, tileType = Tile.Skeleton }
		end
		return t
	end, { ItemsPerRow1 })
	local UseMemoResult1 = if IsLoading then UseMemoResult else UseSocialCarouselContextModuleResult.tiles
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			LayoutOrder = 1,
			containerRef = UseStateResult2,
			scrollingFrameRef = UseRefResult,
			onContainerSizeChanged = if FFlagSocialCarouselFixColdStartJitterModule then UseResult else nil,
			title = UseLocalizationResult.friendsLabel,
			items = if FFlagSocialCarouselFixColdStartJitterModule and not IsColdStartLayoutReady then t else UseMemoResult1,
			renderItem = ReactModule.useCallback(function(p4, p5, p6)
				-- upvalues: SelectionOrderBase (copy), FFlagSocialCarouselInGameTitleMarquee (upval), ActiveByIndex (ref), IsPaused (ref), MarqueeRunId (ref), OnMarqueeFinished (ref), OnManualMarqueeStart (ref), OnManualMarqueeEnd (ref), HandsOff (ref), DesktopEnabled (ref), ConsoleEnabled (ref), Tile (upval), TileComponentsModule (upval), p1 (copy)
				local NewSelectionOrderBase = if SelectionOrderBase then SelectionOrderBase + p5 else nil
				local v1: string? = nil
				local v2 = nil
				local v3 = nil
				local v4 = nil
				local v5 = nil
				local v6 = nil
				
				if FFlagSocialCarouselInGameTitleMarquee then
					local ActiveByIndex1 = ActiveByIndex
					local IsPaused1 = IsPaused
					local MarqueeRunId1 = MarqueeRunId
					local OnMarqueeFinished1 = OnMarqueeFinished
					local OnManualMarqueeStart1 = OnManualMarqueeStart
					local OnManualMarqueeEnd1 = OnManualMarqueeEnd
					local HandsOff1 = HandsOff
					local DesktopEnabled1 = DesktopEnabled
					local ConsoleEnabled1 = ConsoleEnabled
					local v7 = nil
					local Paused = nil
					local v8 = nil
					local v9 = nil
					local v10 = nil
					local v11 = nil
					
					if p4.tileType == Tile.Friend and ActiveByIndex1 ~= nil then
						local DesktopEnabled1_1 = DesktopEnabled1 or ConsoleEnabled1
						Paused = if ActiveByIndex1[p5] == true then if IsPaused1 then "Paused" else "Playing" else "Idle"
						v9 = if HandsOff1 then OnMarqueeFinished1 else nil
						v10 = MarqueeRunId1
						v11 = if DesktopEnabled1_1 then OnManualMarqueeStart1 else nil
						v7 = if DesktopEnabled1_1 then OnManualMarqueeEnd1 else nil
						v8 = if ConsoleEnabled1 then true else nil
					else
						Paused = nil
						v9 = nil
						v10 = nil
						v11 = nil
						v7 = nil
						v8 = nil
					end
					v1 = Paused
					v2 = v9
					v3 = v10
					v4 = v11
					v5 = v7
					v6 = v8
				end
				return TileComponentsModule[p4.tileType](p4, p5, p6, NewSelectionOrderBase, function(p7, p8)
					-- upvalues: p1 (upval), p4 (copy)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p7, p8, p4)
					end
				end, v1, v2, v3, v4, v5, v6), p4.tileType
			end, {
				SelectionOrderBase, p1.onTileContentChanged,
				if FFlagSocialCarouselInGameTitleMarquee then ActiveByIndex else nil,
				if FFlagSocialCarouselInGameTitleMarquee then IsPaused else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnMarqueeFinished else nil,
				if FFlagSocialCarouselInGameTitleMarquee then MarqueeRunId else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnManualMarqueeStart else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnManualMarqueeEnd else nil,
				if FFlagSocialCarouselInGameTitleMarquee then HandsOff else nil,
				if FFlagSocialCarouselInGameTitleMarquee then DesktopEnabled else nil,
				if FFlagSocialCarouselInGameTitleMarquee then ConsoleEnabled else nil
			}),
			getItemHeight = UseResult1,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then CollectionItemSize.XSmall else nil,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseCollectionLayoutParamsResult.maxTilesToShow,
			thresholdFromEnd = UseCollectionLayoutParamsResult.loadMoreThreshold,
			onViewableItemsChanged = if IsLoading or FFlagSocialCarouselFixColdStartJitterModule and not IsColdStartLayoutReady then nil else UseResult2,
			onChangeCanvasPosition = if UseSocialCarouselContextModuleResult.unifiedLogging and not IsLoading and (not FFlagSocialCarouselFixColdStartJitterModule or IsColdStartLayoutReady) then UseSocialCarouselContextModuleResult.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if FFlagLuaAppFriendsSortHeaderByPosition then if UseSocialCarouselContextModuleResult.hideCarouselHeader then ReactModule.createElement(ReactModule.Fragment, nil, {}) else nil elseif UseSocialCarouselContextModuleResult.hideCarouselHeader then ReactModule.createElement(ReactModule.Fragment, nil, {}) elseif FFlagFlyoutHideFriendsHeaderModule and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then ReactModule.createElement(ReactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if UseSocialCarouselContextModuleResult.unifiedLogging and (not FFlagSocialCarouselFixColdStartJitterModule or IsColdStartLayoutReady) then UseSocialCarouselContextModuleResult.unifiedLogging.renderImpressionsTrackerComponent(UseRefResult) else nil
	})
end