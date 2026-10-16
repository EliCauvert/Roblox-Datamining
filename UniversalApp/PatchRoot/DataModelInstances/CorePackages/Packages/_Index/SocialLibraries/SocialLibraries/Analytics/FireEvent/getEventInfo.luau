local _ = require(script.Parent.Types)

return function(p1) --[[ Line: 4 ]]
	return function(p2) --[[ Line: 5 ]]
		-- upvalues: p1 (copy)
		local v1 = p1[p2]
		assert(v1, "Invalid eventName used: " .. tostring(p2) .. " called")
		
		return v1
	end
end