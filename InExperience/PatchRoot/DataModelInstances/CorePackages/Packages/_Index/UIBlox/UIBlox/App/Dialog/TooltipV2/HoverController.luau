local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local LuauPolyfillModule = require(Parent2.LuauPolyfill)
local _ = require(Parent.Types)
local ConstantsModule = require(Parent.Constants)
local TooltipControllerModule = require(Parent.TooltipController)
local ControlStateModule = require(Parent1.Core.Control.Enum.ControlState)
local UIBloxConfigModule = require(Parent1.UIBloxConfig)

return function(p1) --[[ Line: 17 | Named "HoverController" ]]
	-- upvalues: ReactModule (copy), UIBloxConfigModule (copy), ConstantsModule (copy), ControlStateModule (copy), LuauPolyfillModule (copy), TooltipControllerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(tick())
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 22 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = tick()
		end
	end, if UIBloxConfigModule.enableTooltipV2HoverControllerReRenderFix then {} else nil)
	local DelayTime = p1.delayTime or ConstantsModule.DEFAULT_DELAY_TIME
	local UseResult = ReactModule.useCallback(function(Hover, Hover1) --[[ Line: 30 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), ControlStateModule (upval), UseRefResult (copy), DelayTime (copy)
		if p1.disabled then
			UseStateResult2(false)
			
			return
		end
		if Hover1 == ControlStateModule.Hover or Hover1 == ControlStateModule.Selected then
			local Current = UseRefResult.current
			delay(DelayTime, function() --[[ Line: 37 ]]
				-- upvalues: UseRefResult (upval), Current (copy), UseStateResult2 (upval)
				if UseRefResult.current == Current then
					UseStateResult2(true)
				end
			end)
			
			return
		end
		if Hover == ControlStateModule.Hover or Hover == ControlStateModule.Selected then
			UseRefResult.current = tick()
			UseStateResult2(false)
		end
	end, { DelayTime })
	
	return ReactModule.createElement(TooltipControllerModule, (LuauPolyfillModule.Object.assign({}, p1, {
		delayTime = LuauPolyfillModule.Object.None,
		active = UseStateResult,
		renderTriggerPoint = function(p2) --[[ Line: 52 ]]
			-- upvalues: p1 (copy), UseResult (copy)
			return p1.renderTriggerPoint(p2, UseResult)
		end
	})))
end