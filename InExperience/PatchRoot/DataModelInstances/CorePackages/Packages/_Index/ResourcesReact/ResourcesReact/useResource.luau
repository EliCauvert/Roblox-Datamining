local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.Resources)

return function(p0) --[[ line: 6 | named "useResource" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(function() --[[ line: 7 ]]
		return nil
	end)
	reactModule.useLayoutEffect(function() --[[ line: 11 ]]
		-- upvalues: p0 (ref), var2 (ref)
		local var3, var4 = p0()
		var2(var4)
		
		return function() --[[ line: 14 ]]
			-- upvalues: var2 (copy), var3 (ref)
			var2(nil)
			var3()
		end
	end, { p0 })
	
	return var1
end