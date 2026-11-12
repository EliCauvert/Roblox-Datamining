local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.Breakpoint)
local _ = require(script.Parent.ViewportBreakpointContext)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)

return function(Screen)
	-- upvalues: ReactModule (copy), UseResponsiveModule (copy), UseBreakpointModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(0)
	local Breakpoint = UseResponsiveModule().config.breakpoint
	local UseBreakpointModuleResult = UseBreakpointModule(if UseStateResult then Screen else nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current += 1
		UseStateResult2(true)
		
		return function()
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			UseRefResult.current -= 1
			
			if UseRefResult.current == 0 then
				UseStateResult2(false)
			end
		end
	end, {})
	
	return ReactModule.useMemo(function()
		-- upvalues: Screen (copy), Breakpoint (copy), UseBreakpointModuleResult (copy), UseResult (copy)
		return {
			screen = Screen,
			breakpointConfig = Breakpoint,
			breakpoint = UseBreakpointModuleResult,
			register = UseResult
		}
	end, { Screen, Breakpoint, UseBreakpointModuleResult, UseResult })
end