local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local appSplitViewModule = require(parent.AppSplitView)
local splitView = appSplitViewModule.SplitView
local enums = appSplitViewModule.Enums
local useSplitPaneRenderModule = require(script.Parent.Parent.Hooks.useSplitPaneRender)

return function(p0)
	-- upvalues: useSplitPaneRenderModule (ref), reactModule (ref), enums (ref), splitView (ref)
	local var3 = useSplitPaneRenderModule(p0.screens, p0.cards, p0.paneIndices, p0.isRouteActiveOnPane)
	
	if var3.isBreakpointEnabled then
		local supportPaneMode = var3.supportPaneMode
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			SplitView = reactModule.createElement(splitView, {
				supportPane = {
					width = var3.supportWidth,
					minWidth = var3.supportMinWidth,
					maxWidth = var3.supportMaxWidth,
					resizable = if supportPaneMode == enums.SupportPaneMode.Normal and var3.supportPaneResizable then enums.PaneResizable.Horizontal else enums.PaneResizable.None,
					element = if var3.renderSupportContent ~= nil then reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 1)
					}, var3.supportSlotChildren) else var3.renderSupportContent(var3.supportContentProps, var3.supportSlotChildren)
				},
				supportPaneMode = supportPaneMode,
				onSupportPaneWidthChanged = var3.onSupportPaneWidthChanged,
				onContentRegionRectChanged = var3.onContentRegionRectChanged
			}, var3.primarySlotChildren),
			Overlay = if next(var3.overlaySlotChildren) ~= nil then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 10,
				Size = UDim2.fromScale(1, 1)
			}, var3.overlaySlotChildren) else nil
		})
	end
	local cloned = table.clone(var3.primarySlotChildren)
	
	for i, v in var3.overlaySlotChildren do
		cloned[i] = v
	end
	return reactModule.createElement(reactModule.Fragment, nil, cloned)
end