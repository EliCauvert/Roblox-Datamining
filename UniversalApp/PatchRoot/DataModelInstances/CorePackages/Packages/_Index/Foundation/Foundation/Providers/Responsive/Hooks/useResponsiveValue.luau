local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local _ = require(foundation.Components.Types)
local useBreakpointModule = require(script.Parent.useBreakpoint)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)

return function(p1, p2)
	-- upvalues: useBreakpointModule (ref), useResponsiveModule (ref)
	return p2[useResponsiveModule().config.breakpoint.shortNames[useBreakpointModule(p1)]]
end