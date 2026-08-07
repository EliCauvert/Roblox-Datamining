-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local mockableWarn = require(parent.FocusNavigationUtils).mockableWarn
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ line: 10 | named "useFocusGuiObject" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), mockableWarn (ref)
	local var2 = reactModule.useContext(focusNavigationContextModule)
	
	return reactModule.useCallback(function(p0, p1) --[[ line: 13 ]]
		-- upvalues: var2 (ref), mockableWarn (copy)
		if var2 then
			var2:focusGuiObject(p0, not not p1)
			
			return
		elseif _G.__DEV__ then
			mockableWarn("Could not capture focus with no FocusNavigationService.\n\nIntroduce a ReactFocusNavigation.FocusNavigationProvider above this component in the tree and provide it with a value returned from FocusNavigationService.new(...)")
		end
	end, { var2 })
end