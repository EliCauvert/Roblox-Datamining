local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local internalInputGroupModule = require(foundation.Components.InternalInputGroup)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-toggle-group" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 17 | named "ToggleGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), internalInputGroupModule (ref), withCommonPropsModule (ref)
	local var6 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(internalInputGroupModule, withCommonPropsModule(var6, {
		legend = var6.legend,
		size = var6.size,
		placement = var6.placement,
		ref = p1
	}), var6.children)
end))