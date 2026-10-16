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

return function(p1) --[[ Line: 26 | Named "ResponsiveProvider" ]]
	-- upvalues: ReactModule (copy), WithDefaultsModule (copy), config (copy), ResponsiveContextModule (copy)
	return ReactModule.createElement(ResponsiveContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 27 ]]
			-- upvalues: WithDefaultsModule (upval), p1 (copy), config (upval)
			return {
				config = WithDefaultsModule(p1.config or {}, config.config)
			}
		end, { p1.config })
	}, p1.children)
end