return function()
	local t = {}
	local t_1 = {}
	local var2 = false
	
	return function(p0)
		-- upvalues: var2 (write), t (ref), t_1 (ref)
		assert(typeof(p0) == "function", "Can only subscribe to signals with a function.")
		local t_2 = { disconnected = false, callback = p0 }
		
		if var2 and not t[p0] then
			t_1[p0] = t_2
		end
		t[p0] = t_2
		
		return function()
			-- upvalues: t_2 (ref), t (copy), p0 (ref), t_1 (copy)
			assert(not t_2.disconnected, "Listeners can only be disconnected once.")
			t_2.disconnected = true
			t[p0] = nil
			t_1[p0] = nil
		end
	end, function(...)
		-- upvalues: var2 (write), t (ref), t_1 (ref)
		var2 = true
		
		for i, v in t do
			if not v.disconnected and not t_1[i] then
				i(...)
			end
		end
		var2 = false
		table.clear(t_1)
	end
end