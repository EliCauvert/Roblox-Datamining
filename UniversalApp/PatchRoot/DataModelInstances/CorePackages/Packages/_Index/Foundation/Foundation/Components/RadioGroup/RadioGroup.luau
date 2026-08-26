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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), internalInputGroupModule (ref), withCommonPropsModule (ref), radioGroupContextModule (ref), viewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(var1.value)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1.value ~= nil then
			var3(var1.value)
		end
	end, { var1.value })
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), var1 (ref)
		var3(p3)
		var1.onValueChanged(p3)
	end, { var3, var1.onValueChanged })
	local var5 = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var4 (ref), var1 (ref)
		return {
			value = var2,
			onValueChanged = var4,
			Selectable = var1.Selectable,
			testId = var1.testId
		}
	end, { var2, var4, var1.Selectable, var1.testId }) else nil
	
	return if flagsModule.FoundationInputGroup then reactModule.createElement(internalInputGroupModule, withCommonPropsModule(var1, {
		size = var1.size,
		placement = var1.placement,
		legend = var1.legend,
		ref = p2
	}), {
		RadioGroupContext = reactModule.createElement(radioGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var5 else {
				value = var2,
				onValueChanged = var4,
				Selectable = var1.Selectable,
				testId = var1.testId
			}
		}, var1.children)
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "col gap-medium auto-xy", ref = p2 }), {
		RadioGroupContext = reactModule.createElement(radioGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then var5 else {
				value = var2,
				onValueChanged = var4,
				Selectable = var1.Selectable,
				testId = var1.testId
			}
		}, var1.children)
	})
end))