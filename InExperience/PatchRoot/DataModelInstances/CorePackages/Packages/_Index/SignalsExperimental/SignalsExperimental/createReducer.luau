local createComputed = require(script.Parent.Parent.Signals).createComputed

return function(p1, p2)
	-- upvalues: createComputed (ref)
	local var1 = false
	local var2 = nil
	
	local function _()
		-- upvalues: var1 (write), var2 (write), p2 (ref)
		if not var1 then
			var1 = true
			var2 = if typeof(p2) == "function" then p2() else p2
		end
	end
	
	return createComputed(function(p3)
		-- upvalues: var1 (write), var2 (write), p2 (ref), p1 (ref)
		if not var1 then
			var1 = true
			var2 = if typeof(p2) == "function" then p2() else p2
		end
		var2 = p1(p3, var2)
		
		return var2
	end)
end