local parent = script.Parent.Parent
local reactModule = require(parent.React)
local createEffect = require(parent.Signals).createEffect

return function(value) --[[ line: 9 | named "useSignalBinding" ]]
	-- upvalues: reactModule (ref), createEffect (ref)
	local var1, var2 = reactModule.useBinding(value(false))
	reactModule.useLayoutEffect(function() --[[ line: 12 ]]
		-- upvalues: var2 (ref), value (ref), createEffect (copy)
		var2(value(false))
		
		return createEffect(function(p0) --[[ line: 14 ]]
			-- upvalues: var2 (copy), value (copy)
			var2(value(p0))
		end)
	end, { value })
	
	return var1
end