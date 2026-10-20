local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local RadioGroupContextModule = require(script.Parent.RadioGroupContext)
local config = { Selectable = true, testId = "--foundation-radio-group" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), RadioGroupContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.value)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.value ~= nil then
			UseStateResult2(WithDefaultsModuleResult.value)
		end
	end, { WithDefaultsModuleResult.value })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "col gap-medium auto-xy", ref = Ref }), {
		RadioGroupContext = ReactModule.createElement(RadioGroupContextModule.Provider, {
			value = {
				value = UseStateResult,
				onValueChanged = ReactModule.useCallback(function(p2)
					-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
					UseStateResult2(p2)
					WithDefaultsModuleResult.onValueChanged(p2)
				end, { UseStateResult2, WithDefaultsModuleResult.onValueChanged }),
				Selectable = WithDefaultsModuleResult.Selectable,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children)
	})
end))