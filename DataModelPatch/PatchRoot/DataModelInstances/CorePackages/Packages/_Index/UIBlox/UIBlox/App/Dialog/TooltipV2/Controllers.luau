local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local _ = require(Parent.Types)
local TooltipControllerModule = require(Parent.TooltipController)
local HoverControllerModule = require(Parent.HoverController)

local function _(p1)
	-- upvalues: LuauPolyfillModule (copy), ReactModule (copy)
	return function(TooltipProps, p2, RenderTriggerPoint)
		-- upvalues: LuauPolyfillModule (upval), ReactModule (upval), p1 (copy)
		return ReactModule.createElement(p1, (LuauPolyfillModule.Object.assign({}, p2, {
			tooltipProps = TooltipProps,
			renderTriggerPoint = RenderTriggerPoint
		})))
	end
end

return {
	withTooltip = function(TooltipProps, p1, RenderTriggerPoint)
		-- upvalues: LuauPolyfillModule (copy), ReactModule (copy), TooltipControllerModule (copy)
		return ReactModule.createElement(TooltipControllerModule, (LuauPolyfillModule.Object.assign({}, p1, {
			tooltipProps = TooltipProps,
			renderTriggerPoint = RenderTriggerPoint
		})))
	end,
	withHoverTooltip = function(TooltipProps, p1, RenderTriggerPoint)
		-- upvalues: LuauPolyfillModule (copy), ReactModule (copy), HoverControllerModule (copy)
		return ReactModule.createElement(HoverControllerModule, (LuauPolyfillModule.Object.assign({}, p1, {
			tooltipProps = TooltipProps,
			renderTriggerPoint = RenderTriggerPoint
		})))
	end
}