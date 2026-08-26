local reactModule = require(script.Parent.Parent.React)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function()
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	local var2 = if var1 then var1.focusedGuiObject:getValue() else nil
	local var3, var4 = reactModule.useState(var2)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), var4 (ref), var1 (ref)
		if var3 ~= var2 then
			var4(var2)
		end
		if var1 then
			local var5 = var1.focusedGuiObject:subscribe(var4)
			
			return function()
				-- upvalues: var5 (ref)
				var5:unsubscribe()
			end
		end
		return nil
	end, { var1 })
	
	return var3
end