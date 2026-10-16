local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ Line: 16 | Named "useDispatchSyntheticEvent" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	
	return (ReactModule.useCallback(function(p1, Gui, p2) --[[ Line: 20 ]]
		-- upvalues: UseContextResult (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "Synthetic events must be dispatched on GuiObjects")
			
			return UseContextResult:dispatchSyntheticEvent(p1, Gui, p2)
		end
		if _G.__DEV__ then
			warn("useDispatchSyntheticEvent: No FocusNavigationService available in context")
		end
		return false
	end, { UseContextResult }))
end