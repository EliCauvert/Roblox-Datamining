local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local gridConfigModule = require(foundation.Utility.Responsive.GridConfig)
local responsiveContextModule = require(parent.ResponsiveContext)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	config = {
		breakpoint = breakpointConfigModule,
		grid = gridConfigModule
	}
}

return function(p1)
	-- upvalues: reactModule (ref), withDefaultsModule (ref), t (ref), responsiveContextModule (ref)
	return reactModule.createElement(responsiveContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: withDefaultsModule (copy), p1 (ref), t (copy)
			return { config = withDefaultsModule(p1.config or {}, t.config) }
		end, { p1.config })
	}, p1.children)
end