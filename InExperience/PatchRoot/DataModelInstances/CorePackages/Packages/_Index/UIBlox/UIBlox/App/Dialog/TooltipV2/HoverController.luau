local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local luauPolyfillModule = require(parent_2.LuauPolyfill)
local _ = require(parent.Types)
local constantsModule = require(parent.Constants)
local tooltipControllerModule = require(parent.TooltipController)
local controlStateModule = require(parent_1.Core.Control.Enum.ControlState)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)

return function(p1)
	-- upvalues: reactModule (ref), UIBloxConfigModule (ref), constantsModule (ref), controlStateModule (ref), luauPolyfillModule (ref), tooltipControllerModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(tick())
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			var3.current = tick()
		end
	end, if UIBloxConfigModule.enableTooltipV2HoverControllerReRenderFix then {} else nil)
	local delayTime = p1.delayTime or constantsModule.DEFAULT_DELAY_TIME
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref), var2 (ref), controlStateModule (copy), var3 (ref), delayTime (ref)
		if p1.disabled then
			var2(false)
			
			return
		elseif p3 == controlStateModule.Hover or p3 == controlStateModule.Selected then
			local current = var3.current
			delay(delayTime, function()
				-- upvalues: var3 (copy), current (ref), var2 (copy)
				if var3.current == current then
					var2(true)
				end
			end)
			
			return
		elseif p2 == controlStateModule.Hover or p2 == controlStateModule.Selected then
			var3.current = tick()
			var2(false)
		end
	end, { delayTime })
	
	return reactModule.createElement(tooltipControllerModule, luauPolyfillModule.Object.assign({}, p1, {
		delayTime = luauPolyfillModule.Object.None,
		active = var1,
		renderTriggerPoint = function(p2)
			-- upvalues: p1 (ref), var4 (ref)
			return p1.renderTriggerPoint(p2, var4)
		end
	}))
end