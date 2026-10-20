local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local _ = require(Foundation.Components.Types)
local UseBreakpointModule = require(script.Parent.useBreakpoint)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)

return function(p1, p2)
	-- upvalues: UseBreakpointModule (copy), UseResponsiveModule (copy)
	return p2[UseResponsiveModule().config.breakpoint.shortNames[UseBreakpointModule(p1)]]
end