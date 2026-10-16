local AppSplitView = script:FindFirstAncestor("AppSplitView")
local Parent = AppSplitView.Parent
local ReactModule = require(Parent.React)
local AppCompositionModule = require(Parent.AppComposition)
local SignalsModule = require(Parent.Signals)
local DisplayModule = require(Parent.Display)
local PaneResizerModule = require(AppSplitView.Components.PaneResizer)
local UseSplitViewResizeModule = require(AppSplitView.Hooks.useSplitViewResize)
local EnumsModule = require(AppSplitView.Common.Enums)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local CompositionStyleSheet = AppCompositionModule.CompositionStyleSheet
local CompositionTags = AppCompositionModule.CompositionTags
local GetRegionOverridesFunction = AppCompositionModule.getRegionOverrides
local RegionName = AppCompositionModule.RegionName

local function _(p1) --[[ Line: 23 | Named "getPlatformScale" ]]
	-- upvalues: DisplayModule (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(p1)
	
	return if DisplayStore.getPlatformScale then DisplayStore.getPlatformScale(p1) else 1
end

local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 29 ]]
	-- upvalues: GetRegionOverridesFunction (copy), RegionName (copy), DisplayModule (copy)
	local RegionOverrides = if GetRegionOverridesFunction and RegionName then GetRegionOverridesFunction(RegionName.NavigationRegion) else nil
	local DisplayStore = DisplayModule.GetDisplayStore(p1)
	
	return (if RegionOverrides and RegionOverrides.widthScale then RegionOverrides.widthScale else 0) * (if DisplayStore.getPlatformScale then DisplayStore.getPlatformScale(p1) else 1)
end)
local Computed1 = SignalsModule.createComputed(function(p1) --[[ Line: 37 ]]
	-- upvalues: GetRegionOverridesFunction (copy), RegionName (copy), DisplayModule (copy)
	local RegionOverrides = if GetRegionOverridesFunction and RegionName then GetRegionOverridesFunction(RegionName.SupportRegion) else nil
	
	return DisplayModule.GetDisplayStore(p1).getViewportSize(p1).X * (if RegionOverrides and RegionOverrides.widthScale then RegionOverrides.widthScale else 0)
end)
local BackgroundStyle = { Transparency = 1 }

return ReactModule.memo(function(p1) --[[ Line: 76 | Named "SplitView" ]]
	-- upvalues: SignalsReactModule (copy), Computed (copy), Computed1 (copy), EnumsModule (copy), UseSplitViewResizeModule (copy), ReactModule (copy), CompositionTags (copy), CompositionStyleSheet (copy), View (copy), BackgroundStyle (copy), PaneResizerModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(Computed)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Computed1)
	local UseSignalStateResult2 = if p1.navigationPane then if p1.navigationPane.width == nil then UseSignalStateResult else p1.navigationPane.width else 0
	local SupportPaneMode = p1.supportPaneMode or EnumsModule.SupportPaneMode.Normal
	local IsSupportPaneModeMatch = SupportPaneMode == EnumsModule.SupportPaneMode.Expanded
	local IsSupportPaneModeMatch1 = SupportPaneMode == EnumsModule.SupportPaneMode.Collapsed
	local IsSupportPaneModeMatch2 = SupportPaneMode == EnumsModule.SupportPaneMode.Collapsing
	local IsSupportPaneModeMatch3: boolean = IsSupportPaneModeMatch or SupportPaneMode == EnumsModule.SupportPaneMode.Expanding
	local NoIsSupportPaneModeMatch = not IsSupportPaneModeMatch
	local NoIsSupportPaneModeMatch2: boolean = p1.supportPane ~= nil and (not IsSupportPaneModeMatch3 and (not IsSupportPaneModeMatch1 and not IsSupportPaneModeMatch2))
	local HasOnSupportPaneWidthChanged: boolean = NoIsSupportPaneModeMatch2 and (p1.supportPane ~= nil and (p1.supportPane.resizable == EnumsModule.PaneResizable.Horizontal and p1.onSupportPaneWidthChanged ~= nil))
	local UseSplitViewResizeModuleResult = UseSplitViewResizeModule({
		navWidth = UseSignalStateResult2,
		supportWidth = if p1.supportPane then if p1.supportPane.width == nil then UseSignalStateResult1 else p1.supportPane.width else 0,
		variant = p1.variant or EnumsModule.SplitVariant.SplitRight,
		hasWidthOverride = p1.supportPane ~= nil and p1.supportPane.width ~= nil,
		onSupportPaneWidthChanged = p1.onSupportPaneWidthChanged
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 115 ]]
		-- upvalues: IsSupportPaneModeMatch3 (copy), UseSplitViewResizeModuleResult (copy), p1 (copy)
		if not IsSupportPaneModeMatch3 then
			UseSplitViewResizeModuleResult.onSupportAbsoluteSizeChanged(p2)
		end
		if p1.onSupportRegionRectChanged then
			p1.onSupportRegionRectChanged(p2)
		end
	end, {
		IsSupportPaneModeMatch3,
		UseSplitViewResizeModuleResult.onSupportAbsoluteSizeChanged,
		p1.onSupportRegionRectChanged
	})
	local Root = if IsSupportPaneModeMatch then CompositionTags.ContentRegion.Root else IsSupportPaneModeMatch1 and CompositionTags.SupportRegion.Collapsed or CompositionTags.SupportRegion.Root
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if IsSupportPaneModeMatch then
		_UDim2 = UDim2.fromScale(0, 0)
		_UDim2_1 = UDim2.fromScale(1, 1)
	else
		_UDim2 = UseSplitViewResizeModuleResult.supportPosition
		_UDim2_1 = UseSplitViewResizeModuleResult.supportSize
	end
	local IsSupportResizerAbovePane = p1.supportResizerAbovePane == true
	local ZIndex: number = if IsSupportPaneModeMatch then 4 elseif NoIsSupportPaneModeMatch2 and not HasOnSupportPaneWidthChanged and not IsSupportResizerAbovePane then 3 else 1
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		CompositionStyleSheet = ReactModule.createElement(CompositionStyleSheet),
		NavigationPane = if p1.navigationPane then ReactModule.createElement(View, {
			ZIndex = 1,
			tag = CompositionTags.NavigationRegion.Root,
			Size = UDim2.new(0, UseSignalStateResult2, 1, 0),
			Interactable = NoIsSupportPaneModeMatch,
			backgroundStyle = BackgroundStyle
		}, { Slot = p1.navigationPane.element }) else nil,
		ContentPane = ReactModule.createElement(View, {
			ZIndex = 1,
			tag = CompositionTags.ContentRegion.Root,
			Position = UseSplitViewResizeModuleResult.contentPosition,
			Size = UseSplitViewResizeModuleResult.contentSize,
			Interactable = NoIsSupportPaneModeMatch,
			backgroundStyle = BackgroundStyle,
			onAbsoluteSizeChanged = p1.onContentRegionRectChanged,
			onAbsolutePositionChanged = p1.onContentRegionRectChanged
		}, p1.children),
		SupportPane = if p1.supportPane then ReactModule.createElement(View, {
			tag = Root,
			Position = _UDim2,
			Size = _UDim2_1,
			ZIndex = ZIndex,
			backgroundStyle = BackgroundStyle,
			onAbsoluteSizeChanged = UseResult,
			onAbsolutePositionChanged = p1.onSupportRegionRectChanged
		}, { Slot = p1.supportPane.element }) else nil,
		SupportResizer = if NoIsSupportPaneModeMatch2 then ReactModule.createElement(PaneResizerModule, {
			Name = "SupportResizer",
			interactive = HasOnSupportPaneWidthChanged,
			position = UseSplitViewResizeModuleResult.resizerPosition,
			hitWidth = UseSplitViewResizeModuleResult.resizerHitWidth,
			ZIndex = if HasOnSupportPaneWidthChanged or IsSupportResizerAbovePane then 3 else 2,
			onDrag = if HasOnSupportPaneWidthChanged then UseSplitViewResizeModuleResult.onResizerDrag else nil,
			onDragEnd = if HasOnSupportPaneWidthChanged then UseSplitViewResizeModuleResult.onResizerDragEnd else nil
		}) else nil
	})
end)