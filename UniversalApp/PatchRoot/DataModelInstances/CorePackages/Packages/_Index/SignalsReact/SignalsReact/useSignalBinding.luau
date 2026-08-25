local parent = script.Parent.Parent
local reactModule = require(parent.React)
local createEffect = require(parent.Signals).createEffect

return function(value)
	-- upvalues: reactModule (ref), createEffect (ref)
	local var1, var2 = reactModule.useBinding(value(false))
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), value (ref), createEffect (copy)
		var2(value(false))
		
		return createEffect(function(p0)
			-- upvalues: var2 (copy), value (copy)
			var2(value(p0))
		end)
	end, { value })
	
	return var1
end