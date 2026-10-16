local _ = require(script.Parent.Parent.Types)

return function(p1) --[[ Line: 3 ]]
	return function(p2, p3) --[[ Line: 4 ]]
		-- upvalues: p1 (copy)
		local v1 = p1[p2]
		assert(v1, "Invalid eventName used: " .. tostring(p2) .. " called")
		
		return v1, p3
	end
end