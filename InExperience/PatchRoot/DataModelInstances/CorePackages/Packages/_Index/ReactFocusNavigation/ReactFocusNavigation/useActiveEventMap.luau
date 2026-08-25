local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function()
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var2 = reactModule.useContext(focusNavigationContextModule)
	local var3 = if var2 then var2.activeEventMap:getValue() else {}
	local var4, var5 = reactModule.useState(var3)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), var5 (ref), var2 (ref)
		if var4 ~= var3 then
			var5(var3)
		end
		if var2 then
			local var6 = var2.activeEventMap:subscribe(var5)
			
			return function()
				-- upvalues: var6 (ref)
				var6:unsubscribe()
			end
		end
		return nil
	end, { var2 })
	
	return var4
end