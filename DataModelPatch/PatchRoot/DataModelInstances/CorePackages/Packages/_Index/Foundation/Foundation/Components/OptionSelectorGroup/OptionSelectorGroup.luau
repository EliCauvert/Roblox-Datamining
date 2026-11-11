local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local OrientationModule = require(Foundation.Enums.Orientation)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local OptionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)
local config = {
	Selectable = true,
	testId = "--foundation-option-selector-group",
	orientation = OrientationModule.Vertical
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), OrientationModule (copy), OptionSelectorGroupContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.value)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.value ~= nil then
			UseStateResult2(WithDefaultsModuleResult.value)
		end
	end, { WithDefaultsModuleResult.value })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["col size-full-0 auto-y"] = WithDefaultsModuleResult.orientation == OrientationModule.Vertical,
			["row auto-x"] = WithDefaultsModuleResult.orientation == OrientationModule.Horizontal,
			["gap-small"] = true
		},
		ref = Ref
	}), {
		OptionSelectorGroupContext = ReactModule.createElement(OptionSelectorGroupContextModule.Provider, {
			value = {
				value = UseStateResult,
				onValueChanged = ReactModule.useCallback(function(p2)
					-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
					UseStateResult2(p2)
					WithDefaultsModuleResult.onValueChanged(p2)
				end, { UseStateResult2, WithDefaultsModuleResult.onValueChanged }),
				orientation = WithDefaultsModuleResult.orientation,
				Selectable = WithDefaultsModuleResult.Selectable,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children)
	})
end))