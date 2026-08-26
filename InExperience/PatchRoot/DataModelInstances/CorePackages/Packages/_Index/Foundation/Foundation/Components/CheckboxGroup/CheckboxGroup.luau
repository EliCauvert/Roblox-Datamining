local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local internalInputGroupModule = require(foundation.Components.InternalInputGroup)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-checkbox-group" }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), internalInputGroupModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(internalInputGroupModule, withCommonPropsModule(var1, {
		legend = var1.legend,
		size = var1.size,
		placement = var1.placement,
		ref = p2
	}), var1.children)
end))