local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local appSplitViewModule = require(parent.AppSplitView)
local constants = require(parent.NavigationRodux).Constants
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local splitView = appSplitViewModule.SplitView
local enums = appSplitViewModule.Enums
local useSplitPaneRenderModule = require(script.Parent.Parent.Hooks.useSplitPaneRender)
local useSplitPaneFocusNavBridgeModule = require(script.Parent.Parent.Hooks.useSplitPaneFocusNavBridge)
local fFlagSplitPaneEducationalTour = sharedFlagsModule.FFlagSplitPaneEducationalTour
local var1 = if fFlagSplitPaneEducationalTour then require(script.Parent.SplitPaneEducationalTour) else nil
local t = { [constants.TempRnSwitchNavigatorName] = true }

if constants.HomeContainerName ~= nil then
	t[constants.HomeContainerName] = true
end
local function getActiveRouteName(p1)
	-- upvalues: t (ref)
	local var2 = p1
	while var2 ~= nil and (t[var2.routeName] and var2.routes ~= nil) and var2.index ~= nil do
		var2 = var2.routes[var2.index]
	end
	return if var2 == nil then nil else var2.routeName
end

local function isHomeActive(p2)
	-- upvalues: getActiveRouteName (ref), robloxAppEnumsModule (ref), enums (ref)
	local var3 = p2[1]
	
	if getActiveRouteName(if var3 == nil or var3.descriptor == nil then nil else var3.descriptor.state) ~= robloxAppEnumsModule.AppPage.Home then
		return false
	end
	for i = 2, #p2 do
		local var4 = if p2[i].descriptor ~= nil then nil else p2[i].descriptor.options
		
		if var4 ~= nil and var4.splitPaneEligibility == enums.SplitPaneSlot.Support then
			continue
		end
		return false
	end
	return true
end

local function useSupportPaneAnchorRef()
	-- upvalues: reactModule (ref)
	local var5 = reactModule.useRef(nil)
	
	return var5, reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref)
		var5.current = p3
	end, {})
end

return function(p3)
	-- upvalues: useSplitPaneRenderModule (ref), reactModule (ref), useSplitPaneFocusNavBridgeModule (ref), fFlagSplitPaneEducationalTour (ref), useSupportPaneAnchorRef (ref), isHomeActive (ref), enums (ref), splitView (ref), var1 (ref)
	local var5 = useSplitPaneRenderModule(p3.screens, p3.cards, p3.paneIndices, p3.isRouteActiveOnPane)
	local var6 = reactModule.useRef(nil)
	useSplitPaneFocusNavBridgeModule(var6)
	local isRootAppStack = fFlagSplitPaneEducationalTour and var5.isRootAppStack
	local var7 = nil
	local var8 = nil
	
	if fFlagSplitPaneEducationalTour then
		local var9, var10 = useSupportPaneAnchorRef()
		var7 = var9
		var8 = var10
	end
	if var5.isBreakpointEnabled then
		local supportPaneMode = var5.supportPaneMode
		local var11 = isRootAppStack and (var5.supportContentProps.paneCount == 0 and (not var5.supportContentProps.hasDetailOnTop and isHomeActive(p3.screens)))
		local var12 = if var5.renderSupportContent ~= nil then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, var5.supportSlotChildren) else var5.renderSupportContent(var5.supportContentProps, var5.supportSlotChildren)
		
		if isRootAppStack and var8 ~= nil then
			var12 = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = var8,
				Size = UDim2.fromScale(1, 1)
			}, { SupportContent = var12 })
		end
		return reactModule.createElement(reactModule.Fragment, nil, {
			SplitView = reactModule.createElement(splitView, {
				supportPane = {
					width = var5.supportWidth,
					minWidth = var5.supportMinWidth,
					maxWidth = var5.supportMaxWidth,
					resizable = if supportPaneMode == enums.SupportPaneMode.Normal and var5.supportPaneResizable then enums.PaneResizable.Horizontal else enums.PaneResizable.None,
					element = var12
				},
				supportPaneMode = supportPaneMode,
				supportResizerAbovePane = var5.supportResizerAbovePane,
				onSupportPaneWidthChanged = var5.onSupportPaneWidthChanged,
				onContentRegionRectChanged = var5.onContentRegionRectChanged
			}, {
				ContentPaneSurface = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					ref = var6
				}, var5.primarySlotChildren)
			}),
			EducationalTour = if isRootAppStack then reactModule.createElement(var1, {
				supportPaneRef = var7,
				supportPaneMode = supportPaneMode,
				isSupportSurfaceEligible = var11
			}) else nil,
			Overlay = if next(var5.overlaySlotChildren) ~= nil then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 10,
				Size = UDim2.fromScale(1, 1)
			}, var5.overlaySlotChildren) else nil
		})
	else
		local cloned = table.clone(var5.primarySlotChildren)
		
		for i, v in var5.overlaySlotChildren do
			cloned[i] = v
		end
		return reactModule.createElement(reactModule.Fragment, nil, cloned)
	end
end