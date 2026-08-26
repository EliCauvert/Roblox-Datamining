local _ = require(script.Parent.Types)

return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		local var1 = p1[p2]
		assert(var1, "Invalid eventName used: " .. tostring(p2) .. " called")
		
		return var1
	end
end