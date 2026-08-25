local appSplitView = script:FindFirstAncestor("AppSplitView")
local parent = appSplitView.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local appCompositionModule = require(parent.AppComposition)
local signalsModule = require(parent.Signals)
local displayModule = require(parent.Display)
local paneResizerModule = require(appSplitView.Components.PaneResizer)
local useSplitViewResizeModule = require(appSplitView.Hooks.useSplitViewResize)
local enumsModule = require(appSplitView.Common.Enums)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local compositionStyleSheet = appCompositionModule.CompositionStyleSheet
local compositionTags = appCompositionModule.CompositionTags
local getRegionOverrides = appCompositionModule.getRegionOverrides
local regionName = appCompositionModule.RegionName

local function _(p0)
	-- upvalues: displayModule (ref)
	local displayStore = displayModule.GetDisplayStore(p0)
	
	return if displayStore.getPlatformScale then displayStore.getPlatformScale(p0) else 1
end

local var10 = signalsModule.createComputed(function(p1)
	-- upvalues: getRegionOverrides (ref), regionName (ref), displayModule (ref)
	local var14 = if getRegionOverrides and regionName then getRegionOverrides(regionName.NavigationRegion) else nil
	local displayStore = displayModule.GetDisplayStore(p1)
	
	return (if var14 and var14.widthScale then var14.widthScale else 0) * (if displayStore.getPlatformScale then displayStore.getPlatformScale(p1) else 1)
end)
local var11 = signalsModule.createComputed(function(p2)
	-- upvalues: getRegionOverrides (ref), regionName (ref), displayModule (ref)
	local var16 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	
	return displayModule.GetDisplayStore(p2).getViewportSize(p2).X * (if var16 and var16.widthScale then var16.widthScale else 0)
end)
local t = { Transparency = 1 }

return reactModule.memo(function(p3)
	-- upvalues: signalsReactModule (ref), var10 (ref), var11 (ref), enumsModule (ref), useSplitViewResizeModule (ref), reactModule (ref), compositionTags (ref), compositionStyleSheet (ref), view (ref), t (ref), paneResizerModule (ref)
	local supportPosition, supportSize
	local var17 = signalsReactModule.useSignalState(var10)
	local var18 = signalsReactModule.useSignalState(var11)
	local variant = p3.variant or enumsModule.SplitVariant.SplitRight
	local var20 = if p3.navigationPane then if p3.navigationPane.width ~= nil then var17 else p3.navigationPane.width else 0
	local var21 = if p3.supportPane then if p3.supportPane.width ~= nil then var18 else p3.supportPane.width else 0
	local supportPaneMode = p3.supportPaneMode or enumsModule.SupportPaneMode.Normal
	local var23 = supportPaneMode == enumsModule.SupportPaneMode.Expanded
	local var24 = supportPaneMode == enumsModule.SupportPaneMode.Collapsed
	local var25 = supportPaneMode == enumsModule.SupportPaneMode.Collapsing
	local var23_1 = var23 or supportPaneMode == enumsModule.SupportPaneMode.Expanding
	local var27 = not var23
	local var28 = p3.supportPane ~= nil and (not var23_1 and (not var24 and not var25))
	local var29 = var28 and (p3.supportPane ~= nil and (p3.supportPane.resizable == enumsModule.PaneResizable.Horizontal and p3.onSupportPaneWidthChanged ~= nil))
	local var30 = useSplitViewResizeModule({
		navWidth = var20,
		supportWidth = var21,
		variant = variant,
		hasWidthOverride = p3.supportPane ~= nil and p3.supportPane.width ~= nil,
		onSupportPaneWidthChanged = p3.onSupportPaneWidthChanged
	})
	local var31 = reactModule.useCallback(function(p4)
		-- upvalues: var23_1 (ref), var30 (ref), p3 (ref)
		if not var23_1 then
			var30.onSupportAbsoluteSizeChanged(p4)
		end
		if p3.onSupportRegionRectChanged then
			p3.onSupportRegionRectChanged(p4)
		end
	end, {
		var23_1,
		var30.onSupportAbsoluteSizeChanged,
		p3.onSupportRegionRectChanged
	})
	local _ = nil
	local var32 = if var23 then compositionTags.ContentRegion.Root elseif var24 then compositionTags.SupportRegion.Collapsed or compositionTags.SupportRegion.Root else compositionTags.SupportRegion.Root
	local _ = nil
	local _ = nil
	
	if var23 then
		supportPosition = UDim2.fromScale(0, 0)
		supportSize = UDim2.fromScale(1, 1)
	else
		supportPosition = var30.supportPosition
		supportSize = var30.supportSize
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		CompositionStyleSheet = reactModule.createElement(compositionStyleSheet),
		NavigationPane = if p3.navigationPane then reactModule.createElement(view, {
			ZIndex = 1,
			tag = compositionTags.NavigationRegion.Root,
			Size = UDim2.new(0, var20, 1, 0),
			Interactable = var27,
			backgroundStyle = t
		}, { Slot = p3.navigationPane.element }) else nil,
		ContentPane = reactModule.createElement(view, {
			ZIndex = 1,
			tag = compositionTags.ContentRegion.Root,
			Position = var30.contentPosition,
			Size = var30.contentSize,
			Interactable = var27,
			backgroundStyle = t,
			onAbsoluteSizeChanged = p3.onContentRegionRectChanged,
			onAbsolutePositionChanged = p3.onContentRegionRectChanged
		}, p3.children),
		SupportPane = if p3.supportPane then reactModule.createElement(view, {
			tag = var32,
			Position = supportPosition,
			Size = supportSize,
			ZIndex = if var23 then 4 elseif var28 and not var29 then 3 else 1,
			backgroundStyle = t,
			onAbsoluteSizeChanged = var31,
			onAbsolutePositionChanged = p3.onSupportRegionRectChanged
		}, { Slot = p3.supportPane.element }) else nil,
		SupportResizer = if var28 then reactModule.createElement(paneResizerModule, {
			Name = "SupportResizer",
			interactive = var29,
			position = var30.resizerPosition,
			hitWidth = var30.resizerHitWidth,
			ZIndex = if var29 then 3 else 2,
			onDrag = if var29 then var30.onResizerDrag else nil,
			onDragEnd = if var29 then var30.onResizerDragEnd else nil
		}) else nil
	})
end)