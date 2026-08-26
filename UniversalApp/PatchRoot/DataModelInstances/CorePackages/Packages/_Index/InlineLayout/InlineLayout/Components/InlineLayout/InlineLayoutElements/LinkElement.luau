local parent = script:FindFirstAncestor("Components").Parent.Parent
local inlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local inlineSpanElementModule = require(inlineLayoutElements.InlineSpanElement)
local hoverContextModule = require(inlineLayoutElements.HoverContext)
local _ = require(inlineLayoutElements.RenderableInlineElement)
local t = {
	new = function(p1, p2)
		-- upvalues: inlineSpanElementModule (ref)
		return inlineSpanElementModule.new(HoverContextWrapper, p2, p1)
	end
}

function HoverContextWrapper(p1)
	-- upvalues: hoverContextModule (ref), reactModule (ref), foundationModule (ref), useTokens (ref)
	local var1, var2 = hoverContextModule.useHoverContext(p1.id)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-0-0 auto-xy row",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		backgroundStyle = if var1 then useTokens().Color.State.Hover else nil,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), foundationModule (copy)
			var2(p2 == foundationModule.Enums.ControlState.Hover)
		end, { var2 }),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, p1.children)
end

return t