local _ = require(script.Parent.Parent.Types)

return function(p0) --[[ line: 3 ]]
	return function(p1, p2) --[[ line: 4 ]]
		-- upvalues: p0 (ref)
		local var0 = p0[p1]
		assert(var0, "Invalid eventName used: " .. tostring(p1) .. " called")
		
		return var0, p2
	end
end