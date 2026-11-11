return function()
	local t = {}
	local Tbl = {}
	local Flag = false
	
	return function(Callback)
		-- upvalues: Flag (ref), t (copy), Tbl (copy)
		assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
		local config = { disconnected = false, callback = Callback }
		
		if Flag and not t[Callback] then
			Tbl[Callback] = config
		end
		t[Callback] = config
		
		return function()
			-- upvalues: config (copy), t (upval), Callback (copy), Tbl (upval)
			assert(not config.disconnected, "Listeners can only be disconnected once.")
			config.disconnected = true
			t[Callback] = nil
			Tbl[Callback] = nil
		end
	end, function(...)
		-- upvalues: Flag (ref), t (copy), Tbl (copy)
		Flag = true
		
		for i, value in t do
			if not value.disconnected and not Tbl[i] then
				i(...)
			end
		end
		Flag = false
		table.clear(Tbl)
	end
end