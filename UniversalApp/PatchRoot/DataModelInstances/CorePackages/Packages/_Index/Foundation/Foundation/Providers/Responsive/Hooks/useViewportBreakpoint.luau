local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: UseScreenModule (copy), UseBreakpointModule (copy)
	return (UseBreakpointModule((UseScreenModule())))
end