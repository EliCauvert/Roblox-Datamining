local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local internalInputGroupModule = require(foundation.Components.InternalInputGroup)
local radioGroupContextModule = require(script.Parent.RadioGroupContext)
local flagsModule = require(foundation.Utility.Flags)
local t = {
	Selectable = true,
	testId = "--foundation-radio-group",
	size = require(foundation.Enums.InputSize).Medium,
	placement = require(foundation.Enums.InputPlacement).Start
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), internalInputGroupModule (ref), withCommonPropsModule (ref), radioGroupContextModule (ref), viewModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10, var11 = reactModule.useState(var9.value)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref)
		if var9.value ~= nil then
			var11(var9.value)
		end
	end, { var9.value })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref), var9 (ref)
		var11(p2)
		var9.onValueChanged(p2)
	end, { var11, var9.onValueChanged })
	local var13 = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
		-- upvalues: var10 (ref), var12 (ref), var9 (ref)
		return {
			value = var10,
			onValueChanged = var12,
			Selectable = var9.Selectable,
			testId = var9.testId
		}
	end, { var10, var12, var9.Selectable, var9.testId }) else nil
	
	return if flagsModule.FoundationInputGroup then reactModule.createElement(internalInputGroupModule, withCommonPropsModule(var9, {
		size = var9.size,
		placement = var9.placement,
		legend = var9.legend,
		ref = p1
	}), {
		RadioGroupContext = reactModule.createElement(radioGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var13 else {
				value = var10,
				onValueChanged = var12,
				Selectable = var9.Selectable,
				testId = var9.testId
			}
		}, var9.children)
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var9, { tag = "col gap-medium auto-xy", ref = p1 }), {
		RadioGroupContext = reactModule.createElement(radioGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var13 else {
				value = var10,
				onValueChanged = var12,
				Selectable = var9.Selectable,
				testId = var9.testId
			}
		}, var9.children)
	})
end))