local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function()
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	
	return reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var1 (ref)
		if var1 then
			assert(p2:IsA("GuiObject"), "Synthetic events must be dispatched on GuiObjects")
			
			return var1:dispatchSyntheticEvent(p1, p2, p3)
		elseif _G.__DEV__ then
			warn("useDispatchSyntheticEvent: No FocusNavigationService available in context")
		end
		return false
	end, { var1 })
end