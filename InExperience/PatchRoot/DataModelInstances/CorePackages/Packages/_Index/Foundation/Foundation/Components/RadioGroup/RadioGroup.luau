local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InternalInputGroupModule = require(Foundation.Components.InternalInputGroup)
local RadioGroupContextModule = require(script.Parent.RadioGroupContext)
local config = {
	Selectable = true,
	testId = "--foundation-radio-group",
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), InternalInputGroupModule (copy), WithCommonPropsModule (copy), RadioGroupContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.value)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.value ~= nil then
			UseStateResult2(WithDefaultsModuleResult.value)
		end
	end, { WithDefaultsModuleResult.value })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(p2)
		WithDefaultsModuleResult.onValueChanged(p2)
	end, { UseStateResult2, WithDefaultsModuleResult.onValueChanged })
	
	return (ReactModule.createElement(InternalInputGroupModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		size = WithDefaultsModuleResult.size,
		placement = WithDefaultsModuleResult.placement,
		legend = WithDefaultsModuleResult.legend,
		ref = Ref
	}), {
		RadioGroupContext = ReactModule.createElement(RadioGroupContextModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: UseStateResult (copy), UseResult (copy), WithDefaultsModuleResult (copy)
				return {
					value = UseStateResult,
					onValueChanged = UseResult,
					Selectable = WithDefaultsModuleResult.Selectable,
					testId = WithDefaultsModuleResult.testId
				}
			end, {
				UseStateResult,
				UseResult,
				WithDefaultsModuleResult.Selectable,
				WithDefaultsModuleResult.testId
			})
		}, WithDefaultsModuleResult.children)
	}))
end))