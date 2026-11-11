local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FlatList = require(CorePackages.Packages.VirtualizedList).FlatList
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local EndOfScrollModule = require(Modules.LuaApp.Components.EndOfScroll)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(CorePackages.Packages.LuauPolyfill)
local _ = require(Modules.AvatarExperience.Common.Components.WidgetList.Types)
local GetItemSizeModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getItemSize)
local UseRestoreYPositionOnDefocusEffectModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useRestoreYPositionOnDefocusEffect)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseRenderInfoModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useRenderInfo)
local UseTallTileV2Module = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileV2)
local UseTallTileV3Module = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileV3)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local GetFStringAXTallTilesThumbnailSizeModule = require(Modules.AvatarExperience.Flags.GetFStringAXTallTilesThumbnailSize)
local AXHighResolutionTallTilesIXPModule = require(Modules.AvatarExperience.Experiments.AXHighResolutionTallTilesIXP)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetAXMarketplaceWidgetStoreFunction = AvatarExperienceCatalogModule.Stores.getAXMarketplaceWidgetStore
local GetUIScaleFromTokensFunction = AvatarExperienceCatalogModule.Utils.getUIScaleFromTokens
local GetBreakpointFromRowWidthFunction = AvatarExperienceCatalogModule.Utils.getBreakpointFromRowWidth
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlagsModule.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXUseVirtualizedFeedInWidgetList = AvatarExperienceFlagsModule.FFlagAXUseVirtualizedFeedInWidgetList
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local VirtualizedFeed = AvatarExperienceUIKitModule.FeedComponents.VirtualizedFeed
local GetItemCountForRowFunction = AvatarExperienceUIKitModule.Utils.getItemCountForRow
local FFlagAXScrollingFramesShouldAnimateOnFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local FFlagAXLegacyIXPExposureLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXLegacyIXPExposureLogging
local AXSearchPayloadExperimentPortraitModeMobileThresholdRatio = game:DefineFastInt("AXSearchPayloadExperimentPortraitModeMobileThreshold", 210) / 100
local AXSearchPayloadExperimentPortraitModeTabletThresholdRatio = game:DefineFastInt("AXSearchPayloadExperimentPortraitModeTabletThreshold", 0) / 100
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local AXFixRowShiftInResultsList = game:DefineFastFlag("AXFixRowShiftInResultsList", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local WidgetListHorizontalMargin = ConstantsModule.WidgetListHorizontalMargin
local AXWidgetListScrollThrottleIntervalMsRatio = game:DefineFastInt("AXWidgetListScrollThrottleIntervalMs", 400) / 1000
local config = {
	MAX_TO_RENDER_PER_BATCH = 1,
	UPDATE_CELLS_BATCHING_PERIOD = 30,
	SCROLL_EVENT_THROTTLE = 0,
	WINDOW_SIZE = game:DefineFastInt("WidgetListWindowSize", 21),
	INITIAL_NUM_TO_RENDER = if game:DefineFastFlag("AXUseFIntForWidgetListInitialNumToRender", false) then game:DefineFastInt("WidgetListInitialNumToRender", 8) else 8
}
local ContentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 }
local Style = {
	Selectable = false,
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	LayoutOrder = 2,
	ClipsDescendants = false,
	BorderSizePixel = if AXFixRowShiftInResultsList then 0 else nil,
	ElasticBehavior = Enum.ElasticBehavior.Always,
	AutomaticCanvasSize = Enum.AutomaticSize.Y
}
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local UseAXAnimateScrollFrameFunction = AvatarExperienceCommonModule.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState

local function useCreatorNameTileFooterEnabledV2(SearchUuid)
	-- upvalues: GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), AvatarScreen (copy), WidgetConstants (copy), CatalogUtilsModule (copy), UtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	
	return UseSelectorFunction(ReactModule.useCallback(function(p1)
		-- upvalues: Name (copy), AvatarScreen (upval), WidgetConstants (upval), UseSignalStateResult (copy), CatalogUtilsModule (upval), UseSignalStateResult1 (copy), SearchUuid (copy), UtilsModule (upval)
		local Context = if Name == AvatarScreen.MySharedAvatars then WidgetConstants.ContextWidgets.MySharedAvatars.Context elseif UseSignalStateResult then CatalogUtilsModule.getContextForWidgetsById(Name, UseSignalStateResult, UseSignalStateResult1) else nil
		local SearchesParameter = p1.SearchesParameters[SearchUuid]
		local HasSearchKeyword: boolean = SearchesParameter and SearchesParameter.searchKeyword ~= nil
		local QueryStringForSearchWidgets = CatalogUtilsModule.getQueryStringForSearchWidgets(SearchesParameter)
		local SearchPageWidget = if HasSearchKeyword then p1.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[QueryStringForSearchWidgets] elseif Context then p1.AvatarExperience.Common.Widgets.ContextWidgetInfo[Context] else p1.AvatarExperience.Common.Widgets.WidgetInfo
		
		return if SearchPageWidget then UtilsModule.getCreatorNameTileFooterEnabled(SearchPageWidget.Configuration) else false
	end, {
		SearchUuid,
		Name,
		UseSignalStateResult,
		UseSignalStateResult1
	}), GetUseSelectorDeepEqualsFunction())
end

local function renderItem(p1)
	return p1.item.render(p1)
end

local function v52(p1)
	return p1.GlobalGuiInset and p1.GlobalGuiInset.bottom or 0
end

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

return function(Gui)
	-- upvalues: FFlagAXScrollingFramesShouldAnimateOnFocus (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), RoactGamepadModule (copy), ResponsiveModule (copy), AXSearchPayloadExperimentPortraitModeTabletThresholdRatio (copy), AXSearchPayloadExperimentPortraitModeMobileThresholdRatio (copy), FFlagAXMISEnableMultiShopping (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), v52 (copy), FFlagAXPassScreenSizeToWidgetApi (copy), GetAXMarketplaceWidgetStoreFunction (copy), UseTokensFunction (copy), GetUIScaleFromTokensFunction (copy), UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseTallTileV3Module (copy), UseTallTileV2Module (copy), UseAppPolicyFunction (copy), ConstantsModule (copy), GetFStringAXTallTilesThumbnailSizeModule (copy), AXHighResolutionTallTilesIXPModule (copy), IxpUtilsModule (copy), FFlagAXLegacyIXPExposureLogging (copy), GridMetrics (copy), WidgetListHorizontalMargin (copy), GetItemCountForRowFunction (copy), useCreatorNameTileFooterEnabledV2 (copy), GetItemSizeModule (copy), AXWidgetListScrollThrottleIntervalMsRatio (copy), UseRestoreYPositionOnDefocusEffectModule (copy), EndOfScrollModule (copy), LoadingBarWithThemeModule (copy), UseRenderInfoModule (copy), UseAXAnimateScrollFrameFunction (copy), GetBreakpointFromRowWidthFunction (copy), FFlagAXUseVirtualizedFeedInWidgetList (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), VirtualizedFeed (copy), renderItem (copy), FlatList (copy), config (copy), ContentContainerStyle (copy), Style (copy)
	local UseFocusGuiObjectResult = if FFlagAXScrollingFramesShouldAnimateOnFocus then UseFocusGuiObjectFunction() else nil
	local GridRef = Gui.gridRef or ReactModule.useRef(nil)
	local FlatListRef = Gui.flatListRef or ReactModule.useRef(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local IsUseOrientationResultMatch: boolean = ResponsiveModule.useResponsive() == ResponsiveModule.BreakpointConfig.Enum.Medium and UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Portrait
	local AXSearchPayloadExperimentPortraitModeTabletThresholdRatio1 = if IsUseOrientationResultMatch then AXSearchPayloadExperimentPortraitModeTabletThresholdRatio else AXSearchPayloadExperimentPortraitModeMobileThresholdRatio
	local BottomPadding: number? = nil
	
	if FFlagAXMISEnableMultiShopping then
		local UseSelectorResult = UseSelectorFunction(selectDeviceOrientation)
		local UseSelectorResult1: number = UseSelectorFunction(v52)
		
		if UseSelectorResult == ResponsiveModule.BreakpointConfig.Enum.Portrait then
			BottomPadding = UseSelectorResult1 * 1.5
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local SetScreenSizeFunction = nil
	local v1 = nil
	
	if FFlagAXPassScreenSizeToWidgetApi then
		SetScreenSizeFunction = GetAXMarketplaceWidgetStoreFunction(false).setScreenSize
		v1 = GetUIScaleFromTokensFunction((UseTokensFunction()))
	end
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseTallTileV3ModuleResult = nil
	UseTallTileV3ModuleResult = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then UseTallTileV3Module(Gui.fromSearch) else UseTallTileV2Module(Gui.fromSearch, Gui.searchUuid)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getEnableContinuousLoad()
	end)
	local ItemTileTallAspectRatio = if UseTallTileV3ModuleResult then ConstantsModule.ItemTileTallAspectRatio else nil
	local Crop = if UseTallTileV3ModuleResult then Enum.ScaleType.Crop else nil
	local _420x420 = if AXHighResolutionTallTilesIXPModule.isEnabled() and UseTallTileV3ModuleResult then if IxpUtilsModule.readTestVariable(AXHighResolutionTallTilesIXPModule.EnableHighResolutionTallTiles) then ConstantsModule.CatalogThumbnailTypeToSize.BundleThumbnail._420x420 else ConstantsModule.CatalogThumbnailTypeToSize.BundleThumbnail._150x150 elseif UseTallTileV3ModuleResult then GetFStringAXTallTilesThumbnailSizeModule() else nil
	
	if AXHighResolutionTallTilesIXPModule.isEnabled() then
		ReactModule.useEffect(function()
			-- upvalues: UseTallTileV3ModuleResult (ref), FFlagAXLegacyIXPExposureLogging (upval), AXHighResolutionTallTilesIXPModule (upval), IxpUtilsModule (upval)
			if UseTallTileV3ModuleResult then
				if not FFlagAXLegacyIXPExposureLogging then
					IxpUtilsModule.logExperimentExposure(AXHighResolutionTallTilesIXPModule)
				elseif AXHighResolutionTallTilesIXPModule.logExposureEnabled and AXHighResolutionTallTilesIXPModule.logExposureEnabled() then
					IxpUtilsModule.logExperimentExposure(AXHighResolutionTallTilesIXPModule)
					
					return
				end
			end
		end, { UseTallTileV3ModuleResult })
	end
	local SmallMetrics = GridMetrics.getSmallMetrics(math.max(UseStateResult - WidgetListHorizontalMargin * 2, 0), 10)
	local Largest = math.max(GetItemCountForRowFunction(UseStateResult - WidgetListHorizontalMargin * 2 + 10, SmallMetrics.itemWidth + 10), 1)
	local TallCatalogItemTile = if UseTallTileV3ModuleResult then ConstantsModule.ItemTileType.TallCatalogItemTile else ConstantsModule.ItemTileType.CatalogItemTile
	local UseCreatorNameTileFooterEnabledVResult = useCreatorNameTileFooterEnabledV2(Gui.searchUuid)
	local ItemSizeModule = if UseTallTileV3ModuleResult then GetItemSizeModule(UseStyleResult, SmallMetrics.itemWidth, TallCatalogItemTile, UseCreatorNameTileFooterEnabledVResult, UseTextSizeOffsetResult) else GetItemSizeModule(UseStyleResult, SmallMetrics.itemWidth, nil, UseCreatorNameTileFooterEnabledVResult, UseTextSizeOffsetResult)
	local Largest1: number = Largest
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), AXWidgetListScrollThrottleIntervalMsRatio (upval), Gui (copy), UseStateResult2_1 (copy)
		local ClockTime = os.clock()
		
		if ClockTime - UseRefResult.current < AXWidgetListScrollThrottleIntervalMsRatio then return end
		UseRefResult.current = ClockTime
		
		if not Gui.focusedWidget and Gui.loadMore then
			UseStateResult2_1(true)
			Gui.loadMore():andThen(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end, function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
		end
	end, { Gui.loadMore, Gui.focusedWidget })
	local UseResult1 = if UseAppPolicyResult or not Gui.hasMoreRows then nil else UseResult
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FlatListRef (copy)
		if FlatListRef.current ~= nil then
			local NativeScrollRef = FlatListRef.current:getNativeScrollRef()
			
			if NativeScrollRef ~= nil then
				return NativeScrollRef._nativeRef
			end
		end
		return nil
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FlatListRef (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (upval), Gui (copy), UseFocusGuiObjectResult (ref)
		if FlatListRef.current then
			FlatListRef.current:scrollToOffset({ offset = 0, animated = true })
			
			if FFlagAXScrollingFramesShouldAnimateOnFocus and Gui.NextSelectionUp then
				UseFocusGuiObjectResult(Gui.NextSelectionUp.current)
			end
		end
	end, if FFlagAXScrollingFramesShouldAnimateOnFocus then { Gui.NextSelectionUp, UseFocusGuiObjectResult } else {})
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult4 = ReactModule.useCallback(function(...)
		-- upvalues: UseResult2 (copy), UseRefResult1 (copy), Gui (copy)
		local UseResultResult = UseResult2()
		
		if UseResultResult and UseResultResult.current then
			UseRefResult1.current = UseResultResult.current.CanvasPosition.Y
		end
		if Gui.onWidgetFocusAcquired then
			Gui.onWidgetFocusAcquired(...)
		end
	end, { Gui.onWidgetFocusAcquired, UseResult2 })
	UseRestoreYPositionOnDefocusEffectModule(Gui.searchUuid, Gui.focusedWidget, UseResult2, UseRefResult1)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResultResult = UseResult2()
	ReactModule.useEffect(function()
		-- upvalues: UseResultResult (copy), UseStateResult2_2 (copy)
		local Connection = if UseResultResult and UseResultResult.current then UseResultResult.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
			-- upvalues: UseResultResult (upval), UseStateResult2_2 (upval)
			if UseResultResult ~= nil and UseResultResult.current ~= nil then
				UseStateResult2_2(UseResultResult.current.AbsoluteWindowSize.Y < UseResultResult.current.AbsoluteCanvasSize.Y)
				
				return
			end
		end) else nil
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseResultResult })
	local Element = if Gui.shouldCreateEndOfScrollElement then if UseStateResult3 then ReactModule.createElement(EndOfScrollModule, {
		backToTopCallback = UseResult3,
		bottomPadding = BottomPadding
	}) else nil elseif UseStateResult1 then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 56)
	}, {
		LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
	}) else nil
	local UseResult5 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: Gui (copy)
		if Gui.onScroll then
			Gui.onScroll(ScrollFrame.CanvasPosition.Y)
		end
	end, { Gui.onScroll })
	local UseRenderInfoModuleResult = UseRenderInfoModule(ItemSizeModule, Largest, Largest1, Gui.searchUuid, Gui.entries, Gui.showingEntries, Gui.numItemsExpected, Gui.fromSearch, Gui.topPanelHeight, Gui.bottomBarHeight, Gui.focusedWidget, UseResult4, Gui.onWidgetFocusReleased, Gui.hasMoreRows, Gui.itemDetailsPeekViewRefs, UseRefCacheResult, GridRef, Gui.onFocusGained, Gui.requestImpressionsSignal, UseResult2, ItemTileTallAspectRatio, Crop, _420x420, UseResult1, UseStateResult - WidgetListHorizontalMargin * 2, Gui.pillBarVisible)
	
	if FFlagAXScrollingFramesShouldAnimateOnFocus then
		UseAXAnimateScrollFrameFunction((UseResult2()))
	end
	local UseResult6 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy), FFlagAXPassScreenSizeToWidgetApi (upval), WidgetListHorizontalMargin (upval), GetBreakpointFromRowWidthFunction (upval), v1 (ref), SetScreenSizeFunction (ref)
		local X = Frame.AbsoluteSize.X
		UseStateResult2(X)
		
		if FFlagAXPassScreenSizeToWidgetApi then
			SetScreenSizeFunction((GetBreakpointFromRowWidthFunction(math.max(X - WidgetListHorizontalMargin * 2, 0), v1)))
		end
	end, {
		if FFlagAXPassScreenSizeToWidgetApi then SetScreenSizeFunction else nil,
		if FFlagAXPassScreenSizeToWidgetApi then UseStateResult2 else nil,
		if FFlagAXPassScreenSizeToWidgetApi then v1 else nil
	})
	local UseResult7 = if FFlagAXUseVirtualizedFeedInWidgetList then ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2 (copy), FFlagAXPassScreenSizeToWidgetApi (upval), WidgetListHorizontalMargin (upval), GetBreakpointFromRowWidthFunction (upval), v1 (ref), SetScreenSizeFunction (ref)
		UseStateResult2(p1)
		
		if FFlagAXPassScreenSizeToWidgetApi then
			SetScreenSizeFunction((GetBreakpointFromRowWidthFunction(math.max(p1 - WidgetListHorizontalMargin * 2, 0), v1)))
		end
	end, {
		if FFlagAXPassScreenSizeToWidgetApi then SetScreenSizeFunction else nil,
		if FFlagAXPassScreenSizeToWidgetApi then UseStateResult2 else nil,
		if FFlagAXPassScreenSizeToWidgetApi then v1 else nil
	}) else nil
	ReactModule.useEffect(function()
		-- upvalues: Gui (copy), Largest (ref)
		if Gui.onNumItemsPerRowChanged then
			Gui.onNumItemsPerRowChanged(Largest)
		end
	end, { Gui.onNumItemsPerRowChanged, Largest })
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return if FFlagAXUseVirtualizedFeedInWidgetList then ReactModule.createElement(VirtualizedFeed, {
		clipsDescendants = true,
		data = UseRenderInfoModuleResult,
		renderItem = renderItem,
		horizontalPadding = WidgetListHorizontalMargin,
		verticalPadding = if FFlagAXMigrateAllTabToSduiDev then 8 else nil,
		onScroll = Gui.onScroll,
		scrollEnabled = Gui.scrollingEnabled,
		onEndReached = if UseAppPolicyResult then UseResult else nil,
		onEndReachedThreshold = AXSearchPayloadExperimentPortraitModeTabletThresholdRatio1,
		ListHeaderComponent = Gui.listHeaderComponent,
		ListFooterComponent = Element,
		isLoading = UseStateResult1,
		isEndOfList = Gui.shouldCreateEndOfScrollElement,
		onContainerWidthChanged = UseResult7,
		backgroundColor = Theme.BackgroundDefault.Color,
		backgroundTransparency = Theme.BackgroundDefault.Transparency,
		flatListRef = FlatListRef,
		ref = GridRef
	}) else ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ClipsDescendants = true,
		[ReactModule.Change.AbsoluteSize] = UseResult6,
		ref = GridRef,
		defaultChild = if Gui.showingEntries then UseRefCacheResult[1] else nil,
		restorePreviousChildFocus = Gui.restorePreviousChildFocus,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionUp = Gui.NextSelectionUp
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, WidgetListHorizontalMargin),
			PaddingRight = UDim.new(0, WidgetListHorizontalMargin),
			PaddingBottom = UDim.new(0, if FFlagEnableLeftNavOnConsole then UseSignalStateResult.bottom else 0)
		}),
		WidgetFlatList = ReactModule.createElement(FlatList, {
			UNSTABLE_forceSiblingLayoutUpdate = true,
			showDefaultLoadingIndicators = true,
			data = UseRenderInfoModuleResult,
			renderItem = renderItem,
			windowSize = config.WINDOW_SIZE,
			initialNumToRender = config.INITIAL_NUM_TO_RENDER,
			maxToRenderPerBatch = config.MAX_TO_RENDER_PER_BATCH,
			updateCellsBatchingPeriod = config.UPDATE_CELLS_BATCHING_PERIOD,
			scrollEventThrottle = config.SCROLL_EVENT_THROTTLE,
			ref = FlatListRef,
			contentContainerStyle = ContentContainerStyle,
			style = Style,
			onScroll = UseResult5,
			onEndReachedThreshold = AXSearchPayloadExperimentPortraitModeTabletThresholdRatio1,
			onEndReached = if UseAppPolicyResult then UseResult else nil,
			ListHeaderComponent = Gui.listHeaderComponent,
			ListFooterComponent = Element,
			scrollEnabled = Gui.scrollingEnabled
		})
	})
end