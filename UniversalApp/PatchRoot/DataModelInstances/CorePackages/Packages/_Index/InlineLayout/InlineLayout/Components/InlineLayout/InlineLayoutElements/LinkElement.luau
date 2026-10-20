local Parent = script:FindFirstAncestor("Components").Parent.Parent
local InlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineSpanElementModule = require(InlineLayoutElements.InlineSpanElement)
local HoverContextModule = require(InlineLayoutElements.HoverContext)
local _ = require(InlineLayoutElements.RenderableInlineElement)

function HoverContextWrapper(Frame)
	-- upvalues: HoverContextModule (copy), ReactModule (copy), FoundationModule (copy), UseTokensFunction (copy)
	local UseHoverContextResult, UseHoverContextResult2 = HoverContextModule.useHoverContext(Frame.id)
	local UseResult = ReactModule.useCallback(function(Hover)
		-- upvalues: UseHoverContextResult2 (copy), FoundationModule (upval)
		UseHoverContextResult2(Hover == FoundationModule.Enums.ControlState.Hover)
	end, { UseHoverContextResult2 })
	local Hover = UseTokensFunction().Color.State.Hover
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-0-0 auto-xy row",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		backgroundStyle = if UseHoverContextResult then Hover else nil,
		onStateChanged = UseResult,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, Frame.children)
end

return {
	new = function(p1, p2)
		-- upvalues: InlineSpanElementModule (copy)
		return InlineSpanElementModule.new(HoverContextWrapper, p2, p1)
	end
}