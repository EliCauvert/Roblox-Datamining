local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local orientationModule = require(foundation.Enums.Orientation)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 32 | named "OptionSelectorGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), orientationModule (ref), optionSelectorGroupContextModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9, var10 = reactModule.useState(var8.value)
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var8 (ref), var10 (ref)
		if var8.value ~= nil then
			var10(var8.value)
		end
	end, { var8.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var8, {
		tag = {
			["col size-full-0 auto-y"] = var8.orientation == orientationModule.Vertical,
			["row auto-x"] = var8.orientation == orientationModule.Horizontal,
			["gap-small"] = true
		},
		ref = p1
	}), {
		OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
			value = {
				value = var9,
				onValueChanged = reactModule.useCallback(function(p2) --[[ line: 42 ]]
					-- upvalues: var10 (ref), var8 (ref)
					var10(p2)
					var8.onValueChanged(p2)
				end, { var10, var8.onValueChanged }),
				orientation = var8.orientation,
				Selectable = var8.Selectable,
				testId = var8.testId
			}
		}, var8.children)
	})
end))