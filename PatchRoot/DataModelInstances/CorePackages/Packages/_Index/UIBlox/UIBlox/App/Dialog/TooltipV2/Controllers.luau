-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local _ = require(parent.Types)
local tooltipControllerModule = require(parent.TooltipController)
local hoverControllerModule = require(parent.HoverController)

local function _(p0) --[[ line: 14 | named "createControllerFunction" ]]
	-- upvalues: luauPolyfillModule (ref), reactModule (ref)
	return function(p1, p2, p3) --[[ line: 15 ]]
		-- upvalues: luauPolyfillModule (copy), reactModule (copy), p0 (ref)
		return reactModule.createElement(p0, luauPolyfillModule.Object.assign({}, p2, { tooltipProps = p1, renderTriggerPoint = p3 }))
	end
end

return {
	withTooltip = function(p4, p5, p6) --[[ line: 15 ]]
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), tooltipControllerModule (ref)
		return reactModule.createElement(tooltipControllerModule, luauPolyfillModule.Object.assign({}, p5, { tooltipProps = p4, renderTriggerPoint = p6 }))
	end,
	withHoverTooltip = function(p7, p8, p9) --[[ line: 15 ]]
		-- upvalues: luauPolyfillModule (ref), reactModule (ref), hoverControllerModule (ref)
		return reactModule.createElement(hoverControllerModule, luauPolyfillModule.Object.assign({}, p8, { tooltipProps = p7, renderTriggerPoint = p9 }))
	end
}