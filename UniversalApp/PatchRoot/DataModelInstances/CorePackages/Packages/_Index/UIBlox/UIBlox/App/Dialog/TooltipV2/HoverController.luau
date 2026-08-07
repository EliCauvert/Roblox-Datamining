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

return function(p0) --[[ line: 17 | named "HoverController" ]]
	-- upvalues: reactModule (ref), UIBloxConfigModule (ref), constantsModule (ref), controlStateModule (ref), luauPolyfillModule (ref), tooltipControllerModule (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(tick())
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: var8 (ref)
		return function() --[[ line: 22 ]]
			-- upvalues: var8 (copy)
			var8.current = tick()
		end
	end, if UIBloxConfigModule.enableTooltipV2HoverControllerReRenderFix then {} else nil)
	local delayTime = p0.delayTime or constantsModule.DEFAULT_DELAY_TIME
	local var10 = reactModule.useCallback(function(p1, p2) --[[ line: 30 ]]
		-- upvalues: p0 (ref), var7 (ref), controlStateModule (copy), var8 (ref), delayTime (ref)
		if p0.disabled then
			var7(false)
			
			return
		elseif p2 == controlStateModule.Hover or p2 == controlStateModule.Selected then
			local current = var8.current
			delay(delayTime, function() --[[ line: 37 ]]
				-- upvalues: var8 (copy), current (ref), var7 (copy)
				if var8.current == current then
					var7(true)
				end
			end)
			
			return
		elseif p1 == controlStateModule.Hover or p1 == controlStateModule.Selected then
			var8.current = tick()
			var7(false)
		end
	end, { delayTime })
	
	return reactModule.createElement(tooltipControllerModule, luauPolyfillModule.Object.assign({}, p0, {
		delayTime = luauPolyfillModule.Object.None,
		active = var6,
		renderTriggerPoint = function(p3) --[[ line: 52 ]]
			-- upvalues: p0 (ref), var10 (ref)
			return p0.renderTriggerPoint(p3, var10)
		end
	}))
end