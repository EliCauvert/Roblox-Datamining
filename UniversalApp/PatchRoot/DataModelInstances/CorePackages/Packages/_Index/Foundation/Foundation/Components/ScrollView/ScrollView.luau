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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), reactModule (ref), controlStateModule (ref), viewModule (ref), scrollingFrameModule (ref)
	local children
	local var1 = withDefaultsModule(p1, t)
	local var2 = useStyleTagsModule(useDefaultTagsModule(var1.tag, "gui-object-defaults"))
	local var3, var4 = reactModule.useState(controlStateModule.Initialize)
	local cloned = table.clone(var1)
	
	function cloned.onStateChanged(p3)
		-- upvalues: var4 (ref), var1 (ref)
		var4(p3)
		
		if var1.onStateChanged ~= nil then
			var1.onStateChanged(p3)
		end
	end
	
	cloned.stateLayer = if var1.onStateChanged or var1.onActivated then var1.stateLayer else { affordance = "None" }
	cloned.selection = { Selectable = false }
	cloned.ref = p2
	cloned[reactModule.Tag] = var2
	cloned.scroll = nil
	cloned.layout = nil
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = var1.layout.FillDirection,
			ItemLineAlignment = var1.layout.ItemLineAlignment,
			HorizontalAlignment = var1.layout.HorizontalAlignment,
			HorizontalFlex = var1.layout.HorizontalFlex,
			VerticalAlignment = var1.layout.VerticalAlignment,
			VerticalFlex = var1.layout.VerticalFlex,
			Padding = var1.layout.Padding,
			SortOrder = var1.layout.SortOrder,
			Wraps = var1.layout.Wraps
		})
	}
	local _ = nil
	
	if var1.children and typeof(var1.children) == "table" and (var1.layout ~= nil and var1.layout.FillDirection ~= nil) then
		children = t_1
		
		for i, v in var1.children do
			children[i] = v
		end
	else
		children = var1.children
	end
	return reactModule.createElement(viewModule, cloned, {
		ScrollingFrame = reactModule.createElement(scrollingFrameModule, {
			ClipsDescendants = false,
			controlState = var3,
			selection = var1.selection,
			scrollBarVisibility = var1.scroll.scrollBarVisibility,
			onCanvasPositionChanged = var1.onCanvasPositionChanged,
			onAbsoluteCanvasSizeChanged = var1.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = var1.onAbsoluteWindowSizeChanged,
			AutomaticSize = var1.scroll.AutomaticSize,
			AutomaticCanvasSize = var1.scroll.AutomaticCanvasSize,
			CanvasSize = var1.scroll.CanvasSize,
			ScrollingDirection = var1.scroll.ScrollingDirection,
			ScrollingEnabled = var1.scroll.ScrollingEnabled,
			VerticalScrollBarInset = var1.scroll.VerticalScrollBarInset,
			HorizontalScrollBarInset = var1.scroll.HorizontalScrollBarInset,
			ref = var1.scrollingFrameRef
		}, children)
	})
end))