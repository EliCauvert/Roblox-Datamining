local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ResponsiveContextModule = require(script.Parent.ResponsiveContext)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	config = {
		breakpoint = require(Foundation.Utility.Responsive.BreakpointConfig),
		grid = require(Foundation.Utility.Responsive.GridConfig)
	}
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ResponsiveContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ResponsiveContextModule.Provider, { value = WithDefaultsModuleResult }, WithDefaultsModuleResult.children)
end