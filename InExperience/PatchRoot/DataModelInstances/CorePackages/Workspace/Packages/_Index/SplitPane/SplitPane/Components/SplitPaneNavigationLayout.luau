local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local appSplitViewModule = require(parent.AppSplitView)
local splitView = appSplitViewModule.SplitView
local enums = appSplitViewModule.Enums
local useSplitPaneRenderModule = require(script.Parent.Parent.Hooks.useSplitPaneRender)

return function(p1)
	-- upvalues: useSplitPaneRenderModule (ref), reactModule (ref), enums (ref), splitView (ref)
	local var1 = useSplitPaneRenderModule(p1.screens, p1.cards, p1.paneIndices, p1.isRouteActiveOnPane)
	
	if var1.isBreakpointEnabled then
		local supportPaneMode = var1.supportPaneMode
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			SplitView = reactModule.createElement(splitView, {
				supportPane = {
					width = var1.supportWidth,
					minWidth = var1.supportMinWidth,
					maxWidth = var1.supportMaxWidth,
					resizable = if supportPaneMode == enums.SupportPaneMode.Normal and var1.supportPaneResizable then enums.PaneResizable.Horizontal else enums.PaneResizable.None,
					element = if var1.renderSupportContent ~= nil then reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 1)
					}, var1.supportSlotChildren) else var1.renderSupportContent(var1.supportContentProps, var1.supportSlotChildren)
				},
				supportPaneMode = supportPaneMode,
				onSupportPaneWidthChanged = var1.onSupportPaneWidthChanged,
				onContentRegionRectChanged = var1.onContentRegionRectChanged
			}, var1.primarySlotChildren),
			Overlay = if next(var1.overlaySlotChildren) ~= nil then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 10,
				Size = UDim2.fromScale(1, 1)
			}, var1.overlaySlotChildren) else nil
		})
	end
	local cloned = table.clone(var1.primarySlotChildren)
	
	for i, v in var1.overlaySlotChildren do
		cloned[i] = v
	end
	return reactModule.createElement(reactModule.Fragment, nil, cloned)
end