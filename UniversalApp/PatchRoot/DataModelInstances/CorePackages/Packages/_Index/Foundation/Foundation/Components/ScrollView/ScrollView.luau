local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local scrollingFrameModule = require(script.Parent.ScrollingFrame)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useDefaultTagsModule = require(foundation.Utility.useDefaultTags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local controlStateModule = require(foundation.Enums.ControlState)
local t = {
	AutoLocalize = false,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	isDisabled = false,
	testId = "--foundation-scroll-view",
	layout = { SortOrder = Enum.SortOrder.LayoutOrder },
	scroll = {
		scrollBarVisibility = require(foundation.Enums.Visibility).Auto
	}
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), reactModule (ref), controlStateModule (ref), viewModule (ref), scrollingFrameModule (ref)
	local children
	local var9 = withDefaultsModule(p0, t)
	local var10 = useStyleTagsModule(useDefaultTagsModule(var9.tag, "gui-object-defaults"))
	local var11, var12 = reactModule.useState(controlStateModule.Initialize)
	local cloned = table.clone(var9)
	
	function cloned.onStateChanged(p2)
		-- upvalues: var12 (ref), var9 (ref)
		var12(p2)
		
		if var9.onStateChanged ~= nil then
			var9.onStateChanged(p2)
		end
	end
	
	cloned.stateLayer = if var9.onStateChanged or var9.onActivated then var9.stateLayer else { affordance = "None" }
	cloned.selection = { Selectable = false }
	cloned.ref = p1
	cloned[reactModule.Tag] = var10
	cloned.scroll = nil
	cloned.layout = nil
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = var9.layout.FillDirection,
			ItemLineAlignment = var9.layout.ItemLineAlignment,
			HorizontalAlignment = var9.layout.HorizontalAlignment,
			HorizontalFlex = var9.layout.HorizontalFlex,
			VerticalAlignment = var9.layout.VerticalAlignment,
			VerticalFlex = var9.layout.VerticalFlex,
			Padding = var9.layout.Padding,
			SortOrder = var9.layout.SortOrder,
			Wraps = var9.layout.Wraps
		})
	}
	local _ = nil
	
	if var9.children and typeof(var9.children) == "table" and (var9.layout ~= nil and var9.layout.FillDirection ~= nil) then
		children = t_1
		
		for i, v in var9.children do
			children[i] = v
		end
	else
		children = var9.children
	end
	return reactModule.createElement(viewModule, cloned, {
		ScrollingFrame = reactModule.createElement(scrollingFrameModule, {
			ClipsDescendants = false,
			controlState = var11,
			selection = var9.selection,
			scrollBarVisibility = var9.scroll.scrollBarVisibility,
			onCanvasPositionChanged = var9.onCanvasPositionChanged,
			onAbsoluteCanvasSizeChanged = var9.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = var9.onAbsoluteWindowSizeChanged,
			AutomaticSize = var9.scroll.AutomaticSize,
			AutomaticCanvasSize = var9.scroll.AutomaticCanvasSize,
			CanvasSize = var9.scroll.CanvasSize,
			ScrollingDirection = var9.scroll.ScrollingDirection,
			ScrollingEnabled = var9.scroll.ScrollingEnabled,
			VerticalScrollBarInset = var9.scroll.VerticalScrollBarInset,
			HorizontalScrollBarInset = var9.scroll.HorizontalScrollBarInset,
			ref = var9.scrollingFrameRef
		}, children)
	})
end))