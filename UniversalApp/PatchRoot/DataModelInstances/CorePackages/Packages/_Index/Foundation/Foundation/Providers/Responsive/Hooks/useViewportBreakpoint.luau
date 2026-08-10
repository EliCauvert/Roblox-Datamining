local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function() --[[ line: 9 | named "useViewportBreakpoint" ]]
	-- upvalues: useScreenModule (ref), useBreakpointModule (ref)
	return useBreakpointModule(useScreenModule())
end