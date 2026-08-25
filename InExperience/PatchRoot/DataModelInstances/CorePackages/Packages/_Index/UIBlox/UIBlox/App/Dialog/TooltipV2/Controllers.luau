local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local _ = require(parent.Types)
local tooltipControllerModule = require(parent.TooltipController)
local hoverControllerModule = require(parent.HoverController)

local function _(p0)
	-- upvalues: luauPolyfillModule (ref), reactModule (ref)
	return function(p1, p2, p3)
		-- upvalues: luauPolyfillModule (copy), reactModule (copy), p0 (ref)
		return reactModule.createElement(p0, luauPolyfillModule.Object.assign({}, p2, { tooltipProps = p1, renderTriggerPoint = p3 }))
	end
end

return {
	withTooltip = function(p4, p5, p6)
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), tooltipControllerModule (ref)
		return reactModule.createElement(tooltipControllerModule, luauPolyfillModule.Object.assign({}, p5, { tooltipProps = p4, renderTriggerPoint = p6 }))
	end,
	withHoverTooltip = function(p7, p8, p9)
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), hoverControllerModule (ref)
		return reactModule.createElement(hoverControllerModule, luauPolyfillModule.Object.assign({}, p8, { tooltipProps = p7, renderTriggerPoint = p9 }))
	end
}