local _ = require(script.Parent.Parent.Types)

return function(p0)
	return function(p1, p2)
		-- upvalues: p0 (ref)
		local var0 = p0[p1]
		assert(var0, "Invalid eventName used: " .. tostring(p1) .. " called")
		
		return var0, p2
	end
end