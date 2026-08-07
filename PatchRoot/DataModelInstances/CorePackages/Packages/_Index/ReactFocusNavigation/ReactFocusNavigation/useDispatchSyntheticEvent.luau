-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ line: 16 | named "useDispatchSyntheticEvent" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var2 = reactModule.useContext(focusNavigationContextModule)
	
	return reactModule.useCallback(function(p0, p1, p2) --[[ line: 20 ]]
		-- upvalues: var2 (ref)
		if var2 then
			assert(p1:IsA("GuiObject"), "Synthetic events must be dispatched on GuiObjects")
			
			return var2:dispatchSyntheticEvent(p0, p1, p2)
		elseif _G.__DEV__ then
			warn("useDispatchSyntheticEvent: No FocusNavigationService available in context")
		end
		return false
	end, { var2 })
end