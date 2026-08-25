local createComputed = require(script.Parent.Parent.Signals).createComputed

return function(p0, p1)
	-- upvalues: createComputed (ref)
	local var0 = false
	local var1 = nil
	
	local function _()
		-- upvalues: var0 (write), var1 (write), p1 (ref)
		if not var0 then
			var0 = true
			var1 = if typeof(p1) == "function" then p1() else p1
		end
	end
	
	return createComputed(function(p2)
		-- upvalues: var0 (write), var1 (write), p1 (ref), p0 (ref)
		if not var0 then
			var0 = true
			var1 = if typeof(p1) == "function" then p1() else p1
		end
		var1 = p0(p2, var1)
		
		return var1
	end)
end