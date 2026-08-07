-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Components").Parent.Parent
local inlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local inlineSpanElementModule = require(inlineLayoutElements.InlineSpanElement)
local hoverContextModule = require(inlineLayoutElements.HoverContext)
local _ = require(inlineLayoutElements.RenderableInlineElement)
local t = {
	new = function(p0, p1) --[[ line: 45 ]]
		-- upvalues: inlineSpanElementModule (ref)
		return inlineSpanElementModule.new(HoverContextWrapper, p1, p0)
	end
}

function HoverContextWrapper(p2) --[[ line: 25 ]]
	-- upvalues: hoverContextModule (ref), reactModule (ref), foundationModule (ref), useTokens (ref)
	local var6, var7 = hoverContextModule.useHoverContext(p2.id)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-0-0 auto-xy row",
		LayoutOrder = p2.LayoutOrder,
		onActivated = p2.onActivated,
		backgroundStyle = if var6 then useTokens().Color.State.Hover else nil,
		onStateChanged = reactModule.useCallback(function(p3) --[[ line: 27 ]]
			-- upvalues: var7 (ref), foundationModule (copy)
			var7(p3 == foundationModule.Enums.ControlState.Hover)
		end, { var7 }),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, p2.children)
end

return t