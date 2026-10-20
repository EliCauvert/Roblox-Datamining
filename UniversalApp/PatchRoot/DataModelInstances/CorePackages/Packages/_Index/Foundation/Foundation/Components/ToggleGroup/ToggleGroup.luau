local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local InternalInputGroupModule = require(Foundation.Components.InternalInputGroup)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-toggle-group" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), InternalInputGroupModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(InternalInputGroupModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		legend = WithDefaultsModuleResult.legend,
		size = WithDefaultsModuleResult.size,
		placement = WithDefaultsModuleResult.placement,
		ref = Ref
	}), WithDefaultsModuleResult.children)
end))