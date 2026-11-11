local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ScrollingFrameModule = require(script.Parent.ScrollingFrame)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseDefaultTagsModule = require(Foundation.Utility.useDefaultTags)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local ControlStateModule = require(Foundation.Enums.ControlState)
local config = {
	AutoLocalize = false,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	isDisabled = false,
	testId = "--foundation-scroll-view",
	layout = { SortOrder = Enum.SortOrder.LayoutOrder },
	scroll = {
		scrollBarVisibility = require(Foundation.Enums.Visibility).Auto
	}
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDefaultTagsModule (copy), UseStyleTagsModule (copy), ReactModule (copy), ControlStateModule (copy), ViewModule (copy), ScrollingFrameModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStyleTagsModuleResult = UseStyleTagsModule((UseDefaultTagsModule(WithDefaultsModuleResult.tag, "gui-object-defaults")))
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local Copy = table.clone(WithDefaultsModuleResult)
	
	function Copy.onStateChanged(p2)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(p2)
		
		if WithDefaultsModuleResult.onStateChanged ~= nil then
			WithDefaultsModuleResult.onStateChanged(p2)
		end
	end
	
	Copy.stateLayer = if WithDefaultsModuleResult.onStateChanged or WithDefaultsModuleResult.onActivated then WithDefaultsModuleResult.stateLayer else { affordance = "None" }
	Copy.selection = { Selectable = false }
	Copy.ref = Ref
	Copy[ReactModule.Tag] = UseStyleTagsModuleResult
	Copy.scroll = nil
	Copy.layout = nil
	local config1 = {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = WithDefaultsModuleResult.layout.FillDirection,
			ItemLineAlignment = WithDefaultsModuleResult.layout.ItemLineAlignment,
			HorizontalAlignment = WithDefaultsModuleResult.layout.HorizontalAlignment,
			HorizontalFlex = WithDefaultsModuleResult.layout.HorizontalFlex,
			VerticalAlignment = WithDefaultsModuleResult.layout.VerticalAlignment,
			VerticalFlex = WithDefaultsModuleResult.layout.VerticalFlex,
			Padding = WithDefaultsModuleResult.layout.Padding,
			SortOrder = WithDefaultsModuleResult.layout.SortOrder,
			Wraps = WithDefaultsModuleResult.layout.Wraps
		})
	}
	local Children = nil
	
	if WithDefaultsModuleResult.children and typeof(WithDefaultsModuleResult.children) == "table" and WithDefaultsModuleResult.layout ~= nil and WithDefaultsModuleResult.layout.FillDirection ~= nil then
		Children = config1
		
		for i, child in WithDefaultsModuleResult.children do
			Children[i] = child
		end
	else
		Children = WithDefaultsModuleResult.children
	end
	return ReactModule.createElement(ViewModule, Copy, {
		ScrollingFrame = ReactModule.createElement(ScrollingFrameModule, {
			ClipsDescendants = false,
			controlState = UseStateResult,
			selection = WithDefaultsModuleResult.selection,
			scrollBarVisibility = WithDefaultsModuleResult.scroll.scrollBarVisibility,
			onCanvasPositionChanged = WithDefaultsModuleResult.onCanvasPositionChanged,
			onAbsoluteCanvasSizeChanged = WithDefaultsModuleResult.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = WithDefaultsModuleResult.onAbsoluteWindowSizeChanged,
			AutomaticSize = WithDefaultsModuleResult.scroll.AutomaticSize,
			AutomaticCanvasSize = WithDefaultsModuleResult.scroll.AutomaticCanvasSize,
			CanvasSize = WithDefaultsModuleResult.scroll.CanvasSize,
			ScrollingDirection = WithDefaultsModuleResult.scroll.ScrollingDirection,
			ScrollingEnabled = WithDefaultsModuleResult.scroll.ScrollingEnabled,
			VerticalScrollBarInset = WithDefaultsModuleResult.scroll.VerticalScrollBarInset,
			HorizontalScrollBarInset = WithDefaultsModuleResult.scroll.HorizontalScrollBarInset,
			ref = WithDefaultsModuleResult.scrollingFrameRef
		}, Children)
	})
end))