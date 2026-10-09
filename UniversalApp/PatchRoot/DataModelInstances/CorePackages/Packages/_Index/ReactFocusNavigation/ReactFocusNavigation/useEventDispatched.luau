local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function(p1)
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	local var2 = reactModule.useRef(p1)
	var2.current = p1
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref)
		if var1 then
			local var3 = var1.eventDispatched:subscribe(function(p2)
				-- upvalues: var2 (copy)
				if p2 then
					var2.current(p2)
				end
			end)
			
			return function()
				-- upvalues: var3 (ref)
				var3:unsubscribe()
			end
		end
		return nil
	end, { var1 })
end