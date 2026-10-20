local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local MockableWarnFunction = require(Parent.FocusNavigationUtils).mockableWarn
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function()
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy), MockableWarnFunction (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	
	return ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseContextResult (copy), MockableWarnFunction (upval)
		if UseContextResult then
			UseContextResult:focusGuiObject(p1, not not p2)
			
			return
		end
		if _G.__DEV__ then
			MockableWarnFunction("Could not capture focus with no FocusNavigationService.\n\nIntroduce a ReactFocusNavigation.FocusNavigationProvider above this component in the tree and provide it with a value returned from FocusNavigationService.new(...)")
		end
	end, { UseContextResult })
end