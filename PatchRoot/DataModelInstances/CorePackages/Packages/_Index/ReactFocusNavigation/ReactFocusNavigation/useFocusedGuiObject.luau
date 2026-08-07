-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.React)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ line: 11 | named "useCurrentFocus" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var2 = reactModule.useContext(focusNavigationContextModule)
	local var3 = if var2 then var2.focusedGuiObject:getValue() else nil
	local var4, var5 = reactModule.useState(var3)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), var3 (ref), var5 (ref), var2 (ref)
		if var4 ~= var3 then
			var5(var3)
		end
		if var2 then
			local var6 = var2.focusedGuiObject:subscribe(var5)
			
			return function() --[[ line: 25 ]]
				-- upvalues: var6 (ref)
				var6:unsubscribe()
			end
		end
		return nil
	end, { var2 })
	
	return var4
end