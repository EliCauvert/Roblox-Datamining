local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local _ = require(foundation.Components.Types)
local useBreakpointModule = require(script.Parent.useBreakpoint)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)

return function(p0, p1) --[[ line: 14 | named "useResponsiveValue" ]]
	-- upvalues: useBreakpointModule (ref), useResponsiveModule (ref)
	return p1[useResponsiveModule().config.breakpoint.shortNames[useBreakpointModule(p0)]]
end