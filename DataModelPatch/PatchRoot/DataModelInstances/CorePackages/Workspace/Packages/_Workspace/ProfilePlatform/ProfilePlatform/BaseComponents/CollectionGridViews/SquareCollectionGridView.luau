local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionGrid = CollectionViewsModule.CollectionGrid
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ProfileCollectionGridConfigModule = require(script.Parent.ProfileCollectionGridConfig)
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions

return function(p1)
	-- upvalues: ReactModule (copy), FFlagProfilePlatformEnableImpressions (copy), UseProfileAnalyticsContextModule (copy), UseCollectionImpressionsSignalFunction (copy), ProfileCollectionGridConfigModule (copy), UseDynamicSizeMarginModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), CollectionGrid (copy), ScreenSizeImpressionsTracker (copy), AppPage (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = if FFlagProfilePlatformEnableImpressions then ReactModule.useRef(nil) else nil
	local UseProfileAnalyticsContextModuleResult = if FFlagProfilePlatformEnableImpressions then UseProfileAnalyticsContextModule() else nil
	local ScrollViewPositionChangedSignal = nil
	local Callback = nil
	
	if FFlagProfilePlatformEnableImpressions then
		ScrollViewPositionChangedSignal, Callback = UseCollectionImpressionsSignalFunction(UseProfileAnalyticsContextModuleResult.scrollViewPositionChangedSignal)
	end
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), FFlagProfilePlatformEnableImpressions (upval), UseRefResult (copy)
		if p1.setForwardRef then
			p1.setForwardRef(UseStateResult)
		end
		if FFlagProfilePlatformEnableImpressions then
			UseRefResult.current = UseStateResult
		end
	end, { UseStateResult })
	local MaxNumRows = p1.maxNumRows or ProfileCollectionGridConfigModule.Constants.DEFAULT_MAX_NUM_ROWS
	local config = { sideMargin = 0 }
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.Small, UseStateResult, false, config)
	local UseResult = if FFlagProfilePlatformEnableImpressions then ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), Callback (ref)
		if p1.onContainerSizeChanged then
			p1.onContainerSizeChanged(p2)
		end
		Callback()
	end, { p1.onContainerSizeChanged, Callback }) else nil
	local UseResult1 = if FFlagProfilePlatformEnableImpressions then ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy), Callback (ref)
		if p1.onViewableItemsChanged then
			p1.onViewableItemsChanged(p2, p3)
		end
		Callback()
	end, { p1.onViewableItemsChanged, Callback }) else nil
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		CollectionGrid = ReactModule.createElement(CollectionGrid, {
			columnGap = UseCollectionLayoutParamsResult.columnGap,
			containerRef = UseStateResult2,
			getItemHeight = p1.getItemHeight,
			headerButtonText = p1.headerButtonText,
			hideHeaderButton = p1.hideHeaderButton,
			items = p1.items,
			LayoutOrder = p1.layoutOrder,
			maxNumRows = MaxNumRows,
			numColumns = p1.overrides and p1.overrides.numColumns or UseCollectionLayoutParamsResult.numColumns,
			onActivateHeader = p1.onActivateHeader,
			onActivateInfoIcon = p1.onActivateInfoIcon,
			onContainerSizeChanged = if FFlagProfilePlatformEnableImpressions then UseResult else p1.onContainerSizeChanged,
			onViewableItemsChanged = if FFlagProfilePlatformEnableImpressions then UseResult1 else p1.onViewableItemsChanged,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			renderItem = p1.renderItem,
			sideMargin = UseDynamicSizeMarginModuleResult,
			subtitle = p1.subtitle,
			title = p1.title,
			tooltipInfoText = p1.tooltipInfoText,
			verticalPadding = UseCollectionLayoutParamsResult.verticalPadding
		}),
		ScreenSizeImpressionsTracker = if FFlagProfilePlatformEnableImpressions and p1.impressionsTag and p1.sendImpressions then ReactModule.createElement(ScreenSizeImpressionsTracker, {
			pageContext = AppPage.ProfilePlatform,
			parentRef = UseRefResult,
			impressionsTag = p1.impressionsTag,
			scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
			sendImpressions = p1.sendImpressions
		}) else nil
	})
end