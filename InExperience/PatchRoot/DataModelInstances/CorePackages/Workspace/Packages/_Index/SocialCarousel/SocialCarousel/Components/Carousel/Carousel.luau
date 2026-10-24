local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local FoundationModule = require(Parent.Foundation)
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
local UseTokensFunction = FoundationModule.Hooks.useTokens
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
local UseMarqueeActiveTilesFunction = nil
local MarqueeTextMotionModule = nil
local RobloxAppEnumsModule = nil
local UseNavigationFocusFunction = nil
local Callback = nil

if FFlagSocialCarouselInGameTitleMarquee then
	UseMarqueeActiveTilesFunction = require(SocialCarousel.Components.Carousel.useMarqueeActiveTiles).useMarqueeActiveTiles
	MarqueeTextMotionModule = require(SocialCarousel.Components.MarqueeText.MarqueeTextMotion)
	RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
	UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
	Callback = require(SocialCarousel.Stores.MarqueeSession.createMarqueeSessionStore)
end
local function _(Enabled, p1): boolean
	return Enabled ~= true or p1 ~= nil
end

local _ = function(Phone): boolean
	-- upvalues: RobloxAppEnumsModule (ref)
	return RobloxAppEnumsModule ~= nil and (Phone == RobloxAppEnumsModule.DeviceType.Phone or Phone == RobloxAppEnumsModule.DeviceType.Tablet)
end

local _ = function(Desktop, Enabled, p1): boolean
	-- upvalues: RobloxAppEnumsModule (ref)
	return RobloxAppEnumsModule ~= nil and (Desktop == RobloxAppEnumsModule.DeviceType.Desktop and Enabled == true and p1 == nil)
end

local _ = function(Friend, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: Tile (copy)
	if Friend == Tile.Friend and p2 ~= nil then
		return if p2[p1] == true then if p3 then "Paused" else "Playing" else "Idle", if p8 then p5 else nil, p4, if p9 then p6 else nil, if p9 then p7 else nil
	else
		return nil, nil, nil, nil, nil
	end
end

local _ = function(p1)
	-- upvalues: FFlagSocialCarouselInGameTitleMarquee (copy)
	return if FFlagSocialCarouselInGameTitleMarquee then p1 else nil
end

local t = {}

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FixCarouselTileSizeScaling (copy), UseTokensFunction (copy), UseSocialCarouselContextModule (copy), UseTilesSeenCollectionModule (copy), ReactModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy), ConstantsModule (copy), UseLocalizationFunction (copy), UsePageSideMarginFunction (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), UseCollectionLayoutFunction (copy), FFlagSocialCarouselFixColdStartJitterModule (copy), RobloxAppHooksModule (copy), UseColdStartLayoutReadyModule (copy), FFlagSocialCarouselInGameTitleMarquee (copy), FoundationModule (copy), RobloxAppEnumsModule (ref), UseNavigationFocusFunction (ref), Callback (ref), Tile (copy), MarqueeTextMotionModule (ref), CollectionViewsModule (copy), UseMarqueeActiveTilesFunction (ref), TileComponentsModule (copy), t (copy), CollectionCarousel (copy), FFlagLuaAppFriendsSortHeaderByPosition (copy), FFlagFlyoutHideFriendsHeaderModule (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
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
	local v1 = false
	local UseResult = nil
	
	if FFlagSocialCarouselFixColdStartJitterModule then
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
		v1 = UseColdStartLayoutReadyModule(RobloxAppHooksModule.useDeviceOrientation() ~= nil, RobloxAppHooksModule.useScreenSize(), UseStateResult1.X, ItemsPerRow1)
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
	local OnMarqueeHover = nil
	local OnMarqueeHoverEnd = nil
	local MarqueeRunId = nil
	local v2 = false
	local v3 = false
	
	if FFlagSocialCarouselInGameTitleMarquee then
		local UseDeviceTypeResult = RobloxAppHooksModule.useDeviceType()
		local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
		local IsUseDeviceTypeResultMatch: boolean = RobloxAppEnumsModule ~= nil and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Phone or UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Tablet)
		local UseNavigationFocusResult = UseNavigationFocusFunction()
		local OpenGameJoinCardUserId = UseSocialCarouselContextModuleResult.openGameJoinCardUserId
		local IsNotUseNavigationFocusResult: boolean = UseNavigationFocusResult ~= true or OpenGameJoinCardUserId ~= nil
		local OpenGameJoinCardUserId1 = UseSocialCarouselContextModuleResult.openGameJoinCardUserId
		local NoOpenGameJoinCardUserId: boolean = RobloxAppEnumsModule ~= nil and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Desktop and UseNavigationFocusResult == true and OpenGameJoinCardUserId1 == nil)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Callback (upval)
			return Callback()
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseNavigationFocusResult (copy), UseMemoResult (copy)
			if UseNavigationFocusResult == true then
				UseMemoResult.notifyHomeFocused()
			end
		end, { UseNavigationFocusResult, UseMemoResult })
		local Tiles = UseSocialCarouselContextModuleResult.tiles
		local X = if UseStateResult then UseStateResult.AbsoluteSize.X else 0
		local Gutter = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.gutter else UseCollectionLayoutParamsResult.columnGap
		local SideMargin = if FFlagLuaAppCompositionAlways1 then 0 else UseCollectionLayoutParamsResult.sideMargin
		local CountTiles: number = if FFlagSocialCarouselFixColdStartJitterModule and not v1 then 0 elseif IsLoading then (ItemsPerRow1 or 5) + 1 elseif UseSocialCarouselContextModuleResult.tiles then #UseSocialCarouselContextModuleResult.tiles else 0
		local Smallest = math.min(UseCollectionLayoutParamsResult.maxTilesToShow or CountTiles, CountTiles)
		local FractionalItemAmount = if FFlagLuaAppCompositionAlways1 then 0 else UseCollectionLayoutParamsResult.fractionalItemAmount or 0
		local FractionalItemAmount1 = if (ItemsPerRow1 or 0) < Smallest then FractionalItemAmount else 0
		local CarouselPeek = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.carouselPeek else 0
		local UseMarqueeActiveTilesResult = UseMarqueeActiveTilesFunction(UseRefResult, {
			tileCount = if IsLoading or not UseSocialCarouselContextModuleResult.tiles then 0 else #UseSocialCarouselContextModuleResult.tiles,
			containerWidth = math.max(0, X - 2 * (SideMargin or 0)),
			tileWidth = if ItemsPerRow1 > 0 and X > 0 then CollectionViewsModule.calculateItemWidth(ItemsPerRow1, Gutter or 0, SideMargin or 0, X, FractionalItemAmount1 or 0, CarouselPeek or 0) else 0,
			columnGap = Gutter or 0,
			tiles = ReactModule.useMemo(function()
				-- upvalues: Tiles (copy), Tile (upval)
				local List = {}
				
				if Tiles == nil then
					return List
				end
				for _, tile in ipairs(Tiles) do
					local Presence = tile.presence
					table.insert(List, {
						id = if tile.id == nil then "" else tile.id,
						tileType = tile.tileType,
						subtitle = if tile.tileType == Tile.Friend and Presence ~= nil and Presence.userPresenceType == "InGame" then Presence.lastLocation else nil,
						presence = if Presence == nil then nil else {
							userPresenceType = Presence.userPresenceType,
							lastLocation = Presence.lastLocation
						}
					})
				end
				return List
			end, { Tiles }),
			direction = MarqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId),
			reducedMotion = ReducedMotion,
			idleSequenceEnabled = IsUseDeviceTypeResultMatch,
			hoverEnabled = NoOpenGameJoinCardUserId,
			loopsRemainingStore = UseMemoResult
		})
		ActiveByIndex = UseMarqueeActiveTilesResult.activeByIndex
		IsPaused = UseMarqueeActiveTilesResult.isPaused or IsNotUseNavigationFocusResult
		OnMarqueeFinished = UseMarqueeActiveTilesResult.onMarqueeFinished
		OnMarqueeHover = UseMarqueeActiveTilesResult.onMarqueeHover
		OnMarqueeHoverEnd = UseMarqueeActiveTilesResult.onMarqueeHoverEnd
		MarqueeRunId = UseMarqueeActiveTilesResult.marqueeRunId
		v2 = IsUseDeviceTypeResultMatch
		v3 = NoOpenGameJoinCardUserId
	end
	local ActiveByIndex1 = ActiveByIndex
	local IsPaused1: boolean = IsPaused
	local OnMarqueeFinished1 = OnMarqueeFinished
	local MarqueeRunId1 = MarqueeRunId
	local OnMarqueeHover1 = OnMarqueeHover
	local OnMarqueeHoverEnd1 = OnMarqueeHoverEnd
	local v4: boolean = v2
	local v5: boolean = v3
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
	local UseMemoResult1 = ReactModule.useMemo(function()
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
	local UseMemoResult2 = if IsLoading then UseMemoResult1 else UseSocialCarouselContextModuleResult.tiles
	
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
			items = if FFlagSocialCarouselFixColdStartJitterModule and not v1 then t else UseMemoResult2,
			renderItem = ReactModule.useCallback(function(p4, p5, p6)
				-- upvalues: SelectionOrderBase (copy), FFlagSocialCarouselInGameTitleMarquee (upval), ActiveByIndex (ref), IsPaused (ref), MarqueeRunId (ref), OnMarqueeFinished (ref), OnMarqueeHover (ref), OnMarqueeHoverEnd (ref), v2 (ref), v3 (ref), Tile (upval), TileComponentsModule (upval), p1 (copy)
				local NewSelectionOrderBase = if SelectionOrderBase then SelectionOrderBase + p5 else nil
				local v6: string? = nil
				local v7 = nil
				local v8 = nil
				local v9 = nil
				local v10 = nil
				
				if FFlagSocialCarouselInGameTitleMarquee then
					local ActiveByIndex1 = ActiveByIndex
					local IsPaused1 = IsPaused
					local MarqueeRunId1 = MarqueeRunId
					local OnMarqueeFinished1 = OnMarqueeFinished
					local OnMarqueeHover1 = OnMarqueeHover
					local OnMarqueeHoverEnd1 = OnMarqueeHoverEnd
					local v11 = v2
					local v12 = v3
					local v13 = nil
					local Paused = nil
					local v14 = nil
					local v15 = nil
					local v16 = nil
					
					if p4.tileType == Tile.Friend and ActiveByIndex1 ~= nil then
						Paused = if ActiveByIndex1[p5] == true then if IsPaused1 then "Paused" else "Playing" else "Idle"
						v14 = if v11 then OnMarqueeFinished1 else nil
						v15 = MarqueeRunId1
						v16 = if v12 then OnMarqueeHover1 else nil
						v13 = if v12 then OnMarqueeHoverEnd1 else nil
					else
						Paused = nil
						v14 = nil
						v15 = nil
						v16 = nil
						v13 = nil
					end
					v6 = Paused
					v7 = v14
					v8 = v15
					v9 = v16
					v10 = v13
				end
				return TileComponentsModule[p4.tileType](p4, p5, p6, NewSelectionOrderBase, function(p7, p8)
					-- upvalues: p1 (upval), p4 (copy)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p7, p8, p4)
					end
				end, if FFlagSocialCarouselInGameTitleMarquee then v6 else nil, if FFlagSocialCarouselInGameTitleMarquee then v7 else nil, if FFlagSocialCarouselInGameTitleMarquee then v8 else nil, if FFlagSocialCarouselInGameTitleMarquee then v9 else nil, if FFlagSocialCarouselInGameTitleMarquee then v10 else nil), p4.tileType
			end, {
				SelectionOrderBase, p1.onTileContentChanged,
				if FFlagSocialCarouselInGameTitleMarquee then ActiveByIndex1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then IsPaused1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnMarqueeFinished1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then MarqueeRunId1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnMarqueeHover1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnMarqueeHoverEnd1 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then v4 else nil,
				if FFlagSocialCarouselInGameTitleMarquee then v5 else nil
			}),
			getItemHeight = UseResult1,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then CollectionItemSize.XSmall else nil,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseCollectionLayoutParamsResult.maxTilesToShow,
			thresholdFromEnd = UseCollectionLayoutParamsResult.loadMoreThreshold,
			onViewableItemsChanged = if IsLoading or FFlagSocialCarouselFixColdStartJitterModule and not v1 then nil else UseResult2,
			onChangeCanvasPosition = if UseSocialCarouselContextModuleResult.unifiedLogging and not IsLoading and (not FFlagSocialCarouselFixColdStartJitterModule or v1) then UseSocialCarouselContextModuleResult.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if FFlagLuaAppFriendsSortHeaderByPosition then if UseSocialCarouselContextModuleResult.hideCarouselHeader then ReactModule.createElement(ReactModule.Fragment, nil, {}) else nil elseif UseSocialCarouselContextModuleResult.hideCarouselHeader then ReactModule.createElement(ReactModule.Fragment, nil, {}) elseif FFlagFlyoutHideFriendsHeaderModule and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then ReactModule.createElement(ReactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if UseSocialCarouselContextModuleResult.unifiedLogging and (not FFlagSocialCarouselFixColdStartJitterModule or v1) then UseSocialCarouselContextModuleResult.unifiedLogging.renderImpressionsTrackerComponent(UseRefResult) else nil
	})
end