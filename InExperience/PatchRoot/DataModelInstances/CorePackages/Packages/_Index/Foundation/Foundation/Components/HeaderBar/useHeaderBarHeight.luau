local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UseViewportBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useViewportBreakpoint)

return function()
	-- upvalues: UseTokensModule (copy), UseViewportBreakpointModule (copy), ConstantsModule (copy)
	return UseTokensModule().Size[`Size_{ConstantsModule.SIZE_BY_BREAKPOINT[UseViewportBreakpointModule()]}`]
end