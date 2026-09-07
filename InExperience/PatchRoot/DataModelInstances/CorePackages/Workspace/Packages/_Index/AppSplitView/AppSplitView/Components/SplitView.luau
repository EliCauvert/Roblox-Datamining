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

local function _(p1)
	-- upvalues: displayModule (ref)
	local displayStore = displayModule.GetDisplayStore(p1)
	
	return if displayStore.getPlatformScale then displayStore.getPlatformScale(p1) else 1
end

local var1 = signalsModule.createComputed(function(p1)
	-- upvalues: getRegionOverrides (ref), regionName (ref), displayModule (ref)
	local var2 = if getRegionOverrides and regionName then getRegionOverrides(regionName.NavigationRegion) else nil
	local displayStore = displayModule.GetDisplayStore(p1)
	
	return (if var2 and var2.widthScale then var2.widthScale else 0) * (if displayStore.getPlatformScale then displayStore.getPlatformScale(p1) else 1)
end)
local var2 = signalsModule.createComputed(function(p1)
	-- upvalues: getRegionOverrides (ref), regionName (ref), displayModule (ref)
	local var3 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	
	return displayModule.GetDisplayStore(p1).getViewportSize(p1).X * (if var3 and var3.widthScale then var3.widthScale else 0)
end)
local t = { Transparency = 1 }

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), var1 (ref), var2 (ref), enumsModule (ref), useSplitViewResizeModule (ref), reactModule (ref), compositionTags (ref), compositionStyleSheet (ref), view (ref), t (ref), paneResizerModule (ref)
	local supportPosition, supportSize
	local var3 = signalsReactModule.useSignalState(var1)
	local var4 = signalsReactModule.useSignalState(var2)
	local variant = p1.variant or enumsModule.SplitVariant.SplitRight
	local var5 = if p1.navigationPane then if p1.navigationPane.width ~= nil then var3 else p1.navigationPane.width else 0
	local var6 = if p1.supportPane then if p1.supportPane.width ~= nil then var4 else p1.supportPane.width else 0
	local supportPaneMode = p1.supportPaneMode or enumsModule.SupportPaneMode.Normal
	local var7 = supportPaneMode == enumsModule.SupportPaneMode.Expanded
	local var8 = supportPaneMode == enumsModule.SupportPaneMode.Collapsed
	local var9 = supportPaneMode == enumsModule.SupportPaneMode.Collapsing
	local var10 = var7 or supportPaneMode == enumsModule.SupportPaneMode.Expanding
	local var11 = not var7
	local var12 = p1.supportPane ~= nil and (not var10 and (not var8 and not var9))
	local var13 = var12 and (p1.supportPane ~= nil and (p1.supportPane.resizable == enumsModule.PaneResizable.Horizontal and p1.onSupportPaneWidthChanged ~= nil))
	local var14 = useSplitViewResizeModule({
		navWidth = var5,
		supportWidth = var6,
		variant = variant,
		hasWidthOverride = p1.supportPane ~= nil and p1.supportPane.width ~= nil,
		onSupportPaneWidthChanged = p1.onSupportPaneWidthChanged
	})
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var14 (ref), p1 (ref)
		if not var10 then
			var14.onSupportAbsoluteSizeChanged(p2)
		end
		if p1.onSupportRegionRectChanged then
			p1.onSupportRegionRectChanged(p2)
		end
	end, {
		var10,
		var14.onSupportAbsoluteSizeChanged,
		p1.onSupportRegionRectChanged
	})
	local _ = nil
	local var16 = if var7 then compositionTags.ContentRegion.Root elseif var8 then compositionTags.SupportRegion.Collapsed or compositionTags.SupportRegion.Root else compositionTags.SupportRegion.Root
	local _ = nil
	local _ = nil
	
	if var7 then
		supportPosition = UDim2.fromScale(0, 0)
		supportSize = UDim2.fromScale(1, 1)
	else
		supportPosition = var14.supportPosition
		supportSize = var14.supportSize
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		CompositionStyleSheet = reactModule.createElement(compositionStyleSheet),
		NavigationPane = if p1.navigationPane then reactModule.createElement(view, {
			ZIndex = 1,
			tag = compositionTags.NavigationRegion.Root,
			Size = UDim2.new(0, var5, 1, 0),
			Interactable = var11,
			backgroundStyle = t
		}, { Slot = p1.navigationPane.element }) else nil,
		ContentPane = reactModule.createElement(view, {
			ZIndex = 1,
			tag = compositionTags.ContentRegion.Root,
			Position = var14.contentPosition,
			Size = var14.contentSize,
			Interactable = var11,
			backgroundStyle = t,
			onAbsoluteSizeChanged = p1.onContentRegionRectChanged,
			onAbsolutePositionChanged = p1.onContentRegionRectChanged
		}, p1.children),
		SupportPane = if p1.supportPane then reactModule.createElement(view, {
			tag = var16,
			Position = supportPosition,
			Size = supportSize,
			ZIndex = if var7 then 4 elseif var12 and not var13 then 3 else 1,
			backgroundStyle = t,
			onAbsoluteSizeChanged = var15,
			onAbsolutePositionChanged = p1.onSupportRegionRectChanged
		}, { Slot = p1.supportPane.element }) else nil,
		SupportResizer = if var12 then reactModule.createElement(paneResizerModule, {
			Name = "SupportResizer",
			interactive = var13,
			position = var14.resizerPosition,
			hitWidth = var14.resizerHitWidth,
			ZIndex = if var13 then 3 else 2,
			onDrag = if var13 then var14.onResizerDrag else nil,
			onDragEnd = if var13 then var14.onResizerDragEnd else nil
		}) else nil
	})
end)