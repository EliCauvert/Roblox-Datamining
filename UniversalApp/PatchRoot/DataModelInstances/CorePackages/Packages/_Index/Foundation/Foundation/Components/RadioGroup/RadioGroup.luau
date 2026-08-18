local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local radioGroupContextModule = require(script.Parent.RadioGroupContext)
local t = { Selectable = true, testId = "--foundation-radio-group" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 26 | named "RadioGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), radioGroupContextModule (ref)
	local var7 = withDefaultsModule(p0, t)
	local var8, var9 = reactModule.useState(var7.value)
	reactModule.useEffect(function() --[[ line: 30 ]]
		-- upvalues: var7 (ref), var9 (ref)
		if var7.value ~= nil then
			var9(var7.value)
		end
	end, { var7.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var7, { tag = "col gap-medium auto-xy", ref = p1 }), {
		RadioGroupContext = reactModule.createElement(radioGroupContextModule.Provider, {
			value = {
				value = var8,
				onValueChanged = reactModule.useCallback(function(p2) --[[ line: 36 ]]
					-- upvalues: var9 (ref), var7 (ref)
					var9(p2)
					var7.onValueChanged(p2)
				end, { var9, var7.onValueChanged }),
				Selectable = var7.Selectable,
				testId = var7.testId
			}
		}, var7.children)
	})
end))