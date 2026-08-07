local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local orientationModule = require(foundation.Enums.Orientation)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local optionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)
local t = {
	Selectable = true,
	testId = "--foundation-option-selector-group",
	orientation = orientationModule.Vertical
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 33 | named "OptionSelectorGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), orientationModule (ref), flagsModule (ref), optionSelectorGroupContextModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10, var11 = reactModule.useState(var9.value)
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var9 (ref), var11 (ref)
		if var9.value ~= nil then
			var11(var9.value)
		end
	end, { var9.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var9, {
		tag = {
			["col size-full-0 auto-y"] = var9.orientation == orientationModule.Vertical,
			["row size-full-0 auto-y"] = flagsModule.FoundationOptionSelectorGroupFixes and var9.orientation == orientationModule.Horizontal,
			["row auto-x"] = not flagsModule.FoundationOptionSelectorGroupFixes and var9.orientation == orientationModule.Horizontal,
			["gap-small"] = true
		},
		ref = p1
	}), {
		OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
			value = {
				value = var10,
				onValueChanged = reactModule.useCallback(function(p2) --[[ line: 43 ]]
					-- upvalues: var11 (ref), var9 (ref)
					var11(p2)
					var9.onValueChanged(p2)
				end, { var11, var9.onValueChanged }),
				orientation = var9.orientation,
				Selectable = var9.Selectable,
				testId = var9.testId
			}
		}, var9.children)
	})
end))