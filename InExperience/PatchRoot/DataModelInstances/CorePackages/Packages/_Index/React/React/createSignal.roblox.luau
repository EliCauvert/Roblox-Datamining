return function()
	local t = {}
	local t_1 = {}
	local var1 = false
	
	return function(p1)
		-- upvalues: var1 (write), t (ref), t_1 (ref)
		assert(typeof(p1) == "function", "Can only subscribe to signals with a function.")
		local t_2 = { disconnected = false, callback = p1 }
		
		if var1 and not t[p1] then
			t_1[p1] = t_2
		end
		t[p1] = t_2
		
		return function()
			-- upvalues: t_2 (ref), t (copy), p1 (ref), t_1 (copy)
			assert(not t_2.disconnected, "Listeners can only be disconnected once.")
			t_2.disconnected = true
			t[p1] = nil
			t_1[p1] = nil
		end
	end, function(...)
		-- upvalues: var1 (write), t (ref), t_1 (ref)
		var1 = true
		
		for i, v in t do
			if not v.disconnected and not t_1[i] then
				i(...)
			end
		end
		var1 = false
		table.clear(t_1)
	end
end