local function fireConnections(p1, ...)
	for i, v in p1 do
		if not v.disconnected then
			i(...)
		end
	end
	return nil
end

return if require(script.Parent.Parent.Shared).ReactFeatureFlags.enableReentrantSafeSignals then function()
	-- upvalues: fireConnections (ref)
	local t = {}
	local t_1 = {}
	local var1 = 0
	
	return function(p2)
		-- upvalues: var1 (write), t (ref), t_1 (ref)
		assert(typeof(p2) == "function", "Can only subscribe to signals with a function.")
		local t_2 = { disconnected = false, callback = p2 }
		
		if var1 > 0 and t[p2] == nil then
			t_1[p2] = t_2
		else
			t[p2] = t_2
		end
		return function()
			-- upvalues: t_2 (ref), t (copy), p2 (ref), t_1 (copy)
			assert(not t_2.disconnected, "Listeners can only be disconnected once.")
			t_2.disconnected = true
			
			if t[p2] == t_2 then
				t[p2] = nil
			end
			if t_1[p2] == t_2 then
				t_1[p2] = nil
			end
		end
	end, function(...)
		-- upvalues: var1 (write), fireConnections (copy), t (ref), t_1 (ref)
		var1 += 1
		local ok, status = pcall(fireConnections, t, ...)
		var1 -= 1
		
		if var1 == 0 and next(t_1) ~= nil then
			for i, v in t_1 do
				t[i] = v
			end
			table.clear(t_1)
		end
		if not ok then
			error(status, 0)
		end
	end
end else function()
	local t = {}
	local t_1 = {}
	local var2 = false
	
	return function(p2)
		-- upvalues: var2 (write), t (ref), t_1 (ref)
		assert(typeof(p2) == "function", "Can only subscribe to signals with a function.")
		local t_2 = { disconnected = false, callback = p2 }
		
		if var2 and not t[p2] then
			t_1[p2] = t_2
		end
		t[p2] = t_2
		
		return function()
			-- upvalues: t_2 (ref), t (copy), p2 (ref), t_1 (copy)
			assert(not t_2.disconnected, "Listeners can only be disconnected once.")
			t_2.disconnected = true
			t[p2] = nil
			t_1[p2] = nil
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