local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local gridConfigModule = require(foundation.Utility.Responsive.GridConfig)
local responsiveContextModule = require(parent.ResponsiveContext)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	config = {
		breakpoint = breakpointConfigModule,
		grid = gridConfigModule
	}
}

return function(p1)
	-- upvalues: flagsModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), responsiveContextModule (ref)
	local var1 = if flagsModule.FoundationStableContextValues then nil else withDefaultsModule(p1, t)
	
	return reactModule.createElement(responsiveContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: withDefaultsModule (copy), p1 (ref), t (copy)
			return { config = withDefaultsModule(p1.config or {}, t.config) }
		end, { p1.config }) else nil else var1
	}, if flagsModule.FoundationStableContextValues then p1.children else var1.children)
end