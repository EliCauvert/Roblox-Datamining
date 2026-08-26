local parent = script.Parent.Parent
local reactModule = require(parent.React)
local mockableWarn = require(parent.FocusNavigationUtils).mockableWarn
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function()
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), mockableWarn (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	
	return reactModule.useCallback(function(p1, p2)
		-- upvalues: var1 (ref), mockableWarn (copy)
		if var1 then
			var1:focusGuiObject(p1, not not p2)
			
			return
		elseif _G.__DEV__ then
			mockableWarn("Could not capture focus with no FocusNavigationService.\n\nIntroduce a ReactFocusNavigation.FocusNavigationProvider above this component in the tree and provide it with a value returned from FocusNavigationService.new(...)")
		end
	end, { var1 })
end