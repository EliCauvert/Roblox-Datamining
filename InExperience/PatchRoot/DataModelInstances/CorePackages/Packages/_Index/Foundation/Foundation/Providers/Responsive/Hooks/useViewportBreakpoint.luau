local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.Breakpoint)
local FlagsModule = require(Foundation.Utility.Flags)
local ViewportBreakpointContextModule = require(Foundation.Providers.Overlay.ViewportBreakpointContext)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)

return function()
	-- upvalues: UseScreenModule (copy), FlagsModule (copy), ReactModule (copy), ViewportBreakpointContextModule (copy), UseResponsiveModule (copy), UseBreakpointModule (copy)
	local UseScreenModuleResult = UseScreenModule()
	
	if FlagsModule.FoundationSharedViewportBreakpoint then
		local UseContextResult = ReactModule.useContext(ViewportBreakpointContextModule)
		local Breakpoint = UseResponsiveModule().config.breakpoint
		local UseContextResult1 = if UseContextResult and UseContextResult.screen == UseScreenModuleResult and UseContextResult.breakpointConfig == Breakpoint then UseContextResult else nil
		local Register = if UseContextResult1 then UseContextResult1.register else nil
		ReactModule.useLayoutEffect(function()
			-- upvalues: Register (copy)
			return if Register then Register() else nil
		end, { Register })
		local UseBreakpointModuleResult = UseBreakpointModule(if UseContextResult1 then nil else UseScreenModuleResult)
		
		return if UseContextResult1 then UseContextResult1.breakpoint else UseBreakpointModuleResult
	else
		return (UseBreakpointModule(UseScreenModuleResult))
	end
end