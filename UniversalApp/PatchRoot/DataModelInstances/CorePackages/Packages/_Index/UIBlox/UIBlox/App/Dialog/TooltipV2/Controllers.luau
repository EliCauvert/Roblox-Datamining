local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local _ = require(parent.Types)
local tooltipControllerModule = require(parent.TooltipController)
local hoverControllerModule = require(parent.HoverController)

local function _(p1)
	-- upvalues: luauPolyfillModule (ref), reactModule (ref)
	return function(p2, p3, p4)
		-- upvalues: luauPolyfillModule (copy), reactModule (copy), p1 (ref)
		return reactModule.createElement(p1, luauPolyfillModule.Object.assign({}, p3, { tooltipProps = p2, renderTriggerPoint = p4 }))
	end
end

return {
	withTooltip = function(p1, p2, p3)
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), tooltipControllerModule (ref)
		return reactModule.createElement(tooltipControllerModule, luauPolyfillModule.Object.assign({}, p2, { tooltipProps = p1, renderTriggerPoint = p3 }))
	end,
	withHoverTooltip = function(p1, p2, p3)
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), hoverControllerModule (ref)
		return reactModule.createElement(hoverControllerModule, luauPolyfillModule.Object.assign({}, p2, { tooltipProps = p1, renderTriggerPoint = p3 }))
	end
}