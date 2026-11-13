local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
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
local UseAddFriendsTileSeenImpressionModule = require(SocialCarousel.Hooks.useAddFriendsTileSeenImpression)
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
local FFlagSocialCarouselBuildPresence = SharedFlagsModule.FFlagSocialCarouselBuildPresence
local FFlagSocialCarouselLogNewFriendRequestsBadgeModule = require(SocialCarousel.Flags.FFlagSocialCarouselLogNewFriendRequestsBadge)
local FFlagShowRequestsInCarouselForAllUsers = SharedFlagsModule.FFlagShowRequestsInCarouselForAllUsers
local FFlagSocialCarouselXXSmallTilesModule = require(SocialCarousel.Flags.FFlagSocialCarouselXXSmallTiles)
local FFlagSocialCarouselXSmallTileTextModule = require(SocialCarousel.Flags.FFlagSocialCarouselXSmallTileText)
local MarqueeScrollContext = require(SocialCarousel.Stores.MarqueeSession.MarqueeScrollContext).MarqueeScrollContext
local UseCarouselMarquee = if FFlagSocialCarouselInGameTitleMarquee then require(SocialCarousel.Components.Carousel.useCarouselMarquee).useCarouselMarquee else nil

local function _(Friend, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: Tile (copy)
	if Friend == Tile.Friend and p2 ~= nil then
		local P9 = p9 or p10
		
		return if p2[p1] == true then if p3 then "Paused" else "Playing" else "Idle", if p8 then p5 else nil, p4, if P9 then p6 else nil, if P9 then p7 else nil, if p10 then true else nil, p11
	else
		return nil, nil, nil, nil, nil, nil, nil
	end
end

local t = {}
local config = {
	[Tile.AddFriends] = "add-friends",
	[Tile.ShareQR] = "share-qr",
	[Tile.StartSquad] = "start-squad",
	[Tile.Skeleton] = "skeleton"
}

local _ = function(List)
	-- upvalues: Tile (copy)
	if List == nil then
		return nil
	end
	for i, value in ipairs(List) do
		if value and value.tileType == Tile.AddFriends then
			return i
		end
	end
	return nil
end

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FixCarouselTileSizeScaling (copy), UseTokensFunction (copy), UseSocialCarouselContextModule (copy), UseTilesSeenCollectionModule (copy), ReactModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy), ConstantsModule (copy), UseLocalizationFunction (copy), UsePageSideMarginFunction (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), FFlagSocialCarouselXXSmallTilesModule (copy), FFlagSocialCarouselXSmallTileTextModule (copy), RobloxAppHooksModule (copy), RobloxAppEnumsModule (copy), UseCollectionLayoutFunction (copy), FFlagSocialCarouselFixColdStartJitterModule (copy), UseColdStartLayoutReadyModule (copy), FFlagSocialCarouselLogNewFriendRequestsBadgeModule (copy), Tile (copy), UseAddFriendsTileSeenImpressionModule (copy), FFlagSocialCarouselInGameTitleMarquee (copy), UseCarouselMarquee (ref), FFlagSocialCarouselBuildPresence (copy), TileComponentsModule (copy), FFlagShowRequestsInCarouselForAllUsers (copy), config (copy), t (copy), CollectionCarousel (copy), FFlagLuaAppFriendsSortHeaderByPosition (copy), FFlagFlyoutHideFriendsHeaderModule (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy), MarqueeScrollContext (copy)
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
	local IsUseDeviceTypeResultMatch: boolean = if FFlagSocialCarouselXXSmallTilesModule or FFlagSocialCarouselXSmallTileTextModule then RobloxAppHooksModule.useDeviceType() == RobloxAppEnumsModule.DeviceType.Phone else false
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(CollectionItemSize.XSmall)
	local NewItemsPerRow = if FFlagSocialCarouselXXSmallTilesModule and IsUseDeviceTypeResultMatch then UseCollectionLayoutResult.itemsPerRow + 1 else UseCollectionLayoutResult.itemsPerRow
	local NewItemsPerRow1 = if FFlagLuaAppCompositionAlways1 then NewItemsPerRow else UseCollectionLayoutParamsResult.numColumns
	local IsColdStartLayoutReady = false
	local UseResult = nil
	
	if FFlagSocialCarouselFixColdStartJitterModule then
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
		IsColdStartLayoutReady = UseColdStartLayoutReadyModule(RobloxAppHooksModule.useDeviceOrientation() ~= nil, RobloxAppHooksModule.useScreenSize(), UseStateResult1.X, NewItemsPerRow1)
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(p2)
		end, {})
	end
	local Callback = nil
	local UseRefResult5 = nil
	
	if FFlagSocialCarouselLogNewFriendRequestsBadgeModule then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSocialCarouselContextModuleResult (copy), Tile (upval)
			local Tiles = UseSocialCarouselContextModuleResult.tiles
			
			if Tiles == nil then
				return nil
			end
			for i, tile in ipairs(Tiles) do
				if tile and tile.tileType == Tile.AddFriends then
					return i
				end
			end
			return nil
		end, { UseSocialCarouselContextModuleResult.tiles })
		UseRefResult5 = ReactModule.useRef(nil)
		local UseStateResult3
		UseStateResult3, Callback = ReactModule.useState(nil)
		UseAddFriendsTileSeenImpressionModule(if UseStateResult3 == nil or UseMemoResult == nil or UseStateResult3.startIndex > UseMemoResult or UseMemoResult > UseStateResult3.endIndex then nil else UseMemoResult)
	end
	ReactModule.useEffect(function()
		-- upvalues: NewItemsPerRow1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult4 (copy)
		if NewItemsPerRow1 ~= UseRefResult3.current then
			UseRefResult3.current = NewItemsPerRow1
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
	end, { NewItemsPerRow1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy)
		return function()
			-- upvalues: UseRefResult4 (upval)
			if UseRefResult4.current then
				pcall(task.cancel, UseRefResult4.current)
			end
		end
	end, {})
	local XSMALLTILETEXTHEIGHT = if FFlagSocialCarouselXSmallTileTextModule and IsUseDeviceTypeResultMatch then ConstantsModule.XSMALL_TILE_TEXT_HEIGHT else ConstantsModule.TILE_TEXT_HEIGHT
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: FixCarouselTileSizeScaling (upval), XSMALLTILETEXTHEIGHT (copy), UseTokensResult (copy)
		return p2 + (if FixCarouselTileSizeScaling then XSMALLTILETEXTHEIGHT * UseTokensResult.Config.UI.Scale else XSMALLTILETEXTHEIGHT)
	end, {
		if FFlagSocialCarouselXSmallTileTextModule then XSMALLTILETEXTHEIGHT else nil,
		if FFlagSocialCarouselXSmallTileTextModule and UseTokensResult then UseTokensResult.Config.UI.Scale else nil
	})
	local SelectionOrderBase = UseSocialCarouselContextModuleResult.selectionOrderBase
	local IsLoading = FFlagSocialCarouselShowLoadingSkeletonModule and UseSocialCarouselContextModuleResult.isLoading
	local ScrollContext = nil
	local ActiveByIndex = nil
	local IsPaused = false
	local OnMarqueeFinished = nil
	local OnManualMarqueeStart = nil
	local OnManualMarqueeEnd = nil
	local MarqueeRunId = nil
	local HandsOff = false
	local DesktopEnabled = false
	local ConsoleEnabled = false
	local IsMarqueeShortTitlesEnabled = false
	
	if FFlagSocialCarouselInGameTitleMarquee then
		local UseCarouselMarqueeResult = UseCarouselMarquee(UseRefResult, UseSocialCarouselContextModuleResult.tiles, if FFlagSocialCarouselBuildPresence then UseSocialCarouselContextModuleResult.openGameJoinCardUserId or UseSocialCarouselContextModuleResult.openBuildCardUserId else UseSocialCarouselContextModuleResult.openGameJoinCardUserId, {
			defaultSkeletonCount = 5,
			appCompositionEnabled = FFlagLuaAppCompositionAlways1,
			itemsPerRow = NewItemsPerRow1,
			showSkeleton = IsLoading,
			isColdStartLayoutReady = IsColdStartLayoutReady,
			containerFrame = UseStateResult,
			gutter = UseCollectionLayoutResult.gutter,
			carouselPeek = UseCollectionLayoutResult.carouselPeek,
			columnGap = UseCollectionLayoutParamsResult.columnGap,
			sideMargin = UseCollectionLayoutParamsResult.sideMargin,
			fractionalItemAmount = UseCollectionLayoutParamsResult.fractionalItemAmount,
			maxTilesToShow = UseCollectionLayoutParamsResult.maxTilesToShow
		}, UseSocialCarouselContextModuleResult.joinPopoverUserIdRef, UseSocialCarouselContextModuleResult.joinSheetUserIdRef, UseSocialCarouselContextModuleResult.source, UseSocialCarouselContextModuleResult.source == ConstantsModule.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL)
		ActiveByIndex = UseCarouselMarqueeResult.activeByIndex
		IsPaused = UseCarouselMarqueeResult.isPaused
		OnMarqueeFinished = UseCarouselMarqueeResult.onMarqueeFinished
		OnManualMarqueeStart = UseCarouselMarqueeResult.onManualMarqueeStart
		OnManualMarqueeEnd = UseCarouselMarqueeResult.onManualMarqueeEnd
		MarqueeRunId = UseCarouselMarqueeResult.marqueeRunId
		HandsOff = UseCarouselMarqueeResult.handsOff
		DesktopEnabled = UseCarouselMarqueeResult.desktopEnabled
		ConsoleEnabled = UseCarouselMarqueeResult.consoleEnabled
		IsMarqueeShortTitlesEnabled = UseCarouselMarqueeResult.marqueeShortTitlesEnabled == true
		ScrollContext = UseCarouselMarqueeResult.scrollContext
	end
	local IsFFlagLuaAppCompositionAlways = if FFlagSocialCarouselXXSmallTilesModule then IsUseDeviceTypeResultMatch and FFlagLuaAppCompositionAlways1 == true else nil
	local UseResult2 = ReactModule.useCallback(function(StartIndex, EndIndex)
		-- upvalues: FFlagSocialCarouselLogNewFriendRequestsBadgeModule (upval), Callback (ref), UseRefResult5 (ref), UseSocialCarouselContextModuleResult (copy), UseStateResult (copy), UseRefResult (copy), UseRefResult2 (copy), NewItemsPerRow1 (copy), UseRefResult1 (copy), UseTilesSeenCollectionModuleResult (copy)
		if FFlagSocialCarouselLogNewFriendRequestsBadgeModule and Callback ~= nil and UseRefResult5 ~= nil then
			local Current = UseRefResult5.current
			
			if Current == nil or Current.startIndex ~= StartIndex or Current.endIndex ~= EndIndex then
				local Current1 = { startIndex = StartIndex, endIndex = EndIndex }
				UseRefResult5.current = Current1
				Callback(Current1)
			end
		end
		if UseSocialCarouselContextModuleResult.unifiedLogging then
			UseSocialCarouselContextModuleResult.unifiedLogging.onCollectionViewabilityChanged(StartIndex, EndIndex)
		end
		if UseSocialCarouselContextModuleResult.tiles and UseStateResult and UseRefResult.current and UseRefResult2.current then
			local AbsoluteSize = UseStateResult.AbsoluteSize
			local XRatio = AbsoluteSize.X / NewItemsPerRow1
			local X = UseRefResult.current.CanvasPosition.X
			local X1 = AbsoluteSize.X
			local Largest = math.max(1, math.floor(X / XRatio) + 1)
			local Smallest = math.min(#UseSocialCarouselContextModuleResult.tiles, (math.ceil((X + X1) / XRatio)))
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
		UseSocialCarouselContextModuleResult.unifiedLogging, UseStateResult,
		UseRefResult, NewItemsPerRow1, UseTilesSeenCollectionModuleResult, Callback,
		UseRefResult5
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagSocialCarouselShowLoadingSkeletonModule (upval), NewItemsPerRow1 (copy), Tile (upval)
		local t = {}
		
		if not FFlagSocialCarouselShowLoadingSkeletonModule then
			return t
		end
		for i = 1, (NewItemsPerRow1 or 5) + 1 do
			t[i] = { id = "skeleton_" .. i, tileType = Tile.Skeleton }
		end
		return t
	end, { NewItemsPerRow1 })
	local UseMemoResult1 = if IsLoading then UseMemoResult else UseSocialCarouselContextModuleResult.tiles
	local Frame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
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
			renderItem = ReactModule.useCallback(function(p2, p3, p4)
				-- upvalues: SelectionOrderBase (copy), FFlagSocialCarouselInGameTitleMarquee (upval), ActiveByIndex (ref), IsPaused (ref), MarqueeRunId (ref), OnMarqueeFinished (ref), OnManualMarqueeStart (ref), OnManualMarqueeEnd (ref), HandsOff (ref), DesktopEnabled (ref), ConsoleEnabled (ref), IsMarqueeShortTitlesEnabled (ref), Tile (upval), TileComponentsModule (upval), FFlagShowRequestsInCarouselForAllUsers (upval), UseRefResult1 (copy), UseTilesSeenCollectionModuleResult (copy), p1 (copy), IsFFlagLuaAppCompositionAlways (copy), config (upval), UseSocialCarouselContextModuleResult (copy), ReactModule (upval)
				local NewSelectionOrderBase = if SelectionOrderBase then SelectionOrderBase + p3 else nil
				local v1: string? = nil
				local v2 = nil
				local v3 = nil
				local v4 = nil
				local v5 = nil
				local v6 = nil
				local v7 = nil
				
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
					local IsMarqueeShortTitlesEnabled1 = IsMarqueeShortTitlesEnabled
					local v8 = nil
					local Paused = nil
					local v9 = nil
					local v10 = nil
					local v11 = nil
					local v12 = nil
					local v13 = nil
					
					if p2.tileType == Tile.Friend and ActiveByIndex1 ~= nil then
						local DesktopEnabled1_1 = DesktopEnabled1 or ConsoleEnabled1
						Paused = if ActiveByIndex1[p3] == true then if IsPaused1 then "Paused" else "Playing" else "Idle"
						v10 = if HandsOff1 then OnMarqueeFinished1 else nil
						v12 = MarqueeRunId1
						v13 = if DesktopEnabled1_1 then OnManualMarqueeStart1 else nil
						v8 = if DesktopEnabled1_1 then OnManualMarqueeEnd1 else nil
						v9 = if ConsoleEnabled1 then true else nil
						v11 = IsMarqueeShortTitlesEnabled1
					else
						Paused = nil
						v10 = nil
						v12 = nil
						v13 = nil
						v8 = nil
						v9 = nil
						v11 = nil
					end
					v1 = Paused
					v2 = v10
					v3 = v12
					v4 = v13
					v5 = v8
					v6 = v9
					v7 = v11
				end
				local CloneElementResult = TileComponentsModule[p2.tileType](p2, p3, p4, NewSelectionOrderBase, function(p5, p6, p7)
					-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), UseRefResult1 (upval), UseTilesSeenCollectionModuleResult (upval), p1 (upval), p2 (copy)
					if FFlagShowRequestsInCarouselForAllUsers and p7 then
						local Current = UseRefResult1.current
						
						if Current.startIndex <= p6 and p6 <= Current.endIndex then
							UseTilesSeenCollectionModuleResult.addTileToCollection(p5, p6, p7)
						end
					end
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p5, p6, if FFlagShowRequestsInCarouselForAllUsers and p7 then p7 else p2)
					end
				end, IsFFlagLuaAppCompositionAlways, v1, v2, v3, v4, v5, v6, v7)
				local Entry = config[p2.tileType]
				
				if Entry then
					local SortAnalyticsData = UseSocialCarouselContextModuleResult.sortAnalyticsData
					CloneElementResult = ReactModule.cloneElement(CloneElementResult, {
						testId = `--social-social-carousel-view-{Entry}-{UseSocialCarouselContextModuleResult.source or "carousel"}-{if SortAnalyticsData then SortAnalyticsData.sortIndex else 1}-{p17}`
					})
				end
				return CloneElementResult, p2.tileType
			end, {
				SelectionOrderBase, IsFFlagLuaAppCompositionAlways, p1.onTileContentChanged,
				UseSocialCarouselContextModuleResult.source,
				UseSocialCarouselContextModuleResult.sortAnalyticsData,
				if FFlagShowRequestsInCarouselForAllUsers then UseTilesSeenCollectionModuleResult else nil,
				if FFlagSocialCarouselInGameTitleMarquee then ActiveByIndex else nil,
				if FFlagSocialCarouselInGameTitleMarquee then IsPaused else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnMarqueeFinished else nil,
				if FFlagSocialCarouselInGameTitleMarquee then MarqueeRunId else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnManualMarqueeStart else nil,
				if FFlagSocialCarouselInGameTitleMarquee then OnManualMarqueeEnd else nil,
				if FFlagSocialCarouselInGameTitleMarquee then HandsOff else nil,
				if FFlagSocialCarouselInGameTitleMarquee then DesktopEnabled else nil,
				if FFlagSocialCarouselInGameTitleMarquee then ConsoleEnabled else nil,
				if FFlagSocialCarouselInGameTitleMarquee then IsMarqueeShortTitlesEnabled else nil
			}),
			getItemHeight = UseResult1,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then CollectionItemSize.XSmall else nil,
			numColumns = if FFlagLuaAppCompositionAlways1 then if FFlagSocialCarouselXXSmallTilesModule and IsUseDeviceTypeResultMatch then NewItemsPerRow else nil else UseCollectionLayoutParamsResult.numColumns,
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
	
	return if ScrollContext == nil then Frame else ReactModule.createElement(MarqueeScrollContext.Provider, { value = ScrollContext }, { Carousel = Frame })
end