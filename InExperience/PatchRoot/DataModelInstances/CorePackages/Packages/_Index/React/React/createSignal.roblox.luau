local function createSignal() --[[ Line: 36 ]]
	local t = {}
	local Tbl = {}
	local Flag = false
	
	return function(Callback) --[[ Line: 41 | Named "subscribe" ]]
		-- upvalues: Flag (ref), t (copy), Tbl (copy)
		assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
		local config = { disconnected = false, callback = Callback }
		
		if Flag and not t[Callback] then
			Tbl[Callback] = config
		end
		t[Callback] = config
		
		return function() --[[ Line: 60 | Named "disconnect" ]]
			-- upvalues: config (copy), t (upval), Callback (copy), Tbl (upval)
			assert(not config.disconnected, "Listeners can only be disconnected once.")
			config.disconnected = true
			t[Callback] = nil
			Tbl[Callback] = nil
		end
	end, function(...) --[[ Line: 74 | Named "fire" ]]
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

local function fireConnections(List, ...) --[[ Line: 91 ]]
	for i, value in List do
		if not value.disconnected then
			i(...)
		end
	end
	return nil
end

local function createReentrantSafeSignal() --[[ Line: 104 ]]
	-- upvalues: fireConnections (copy)
	local t = {}
	local Tbl = {}
	local Count = 0
	
	return function(Callback) --[[ Line: 109 | Named "subscribe" ]]
		-- upvalues: Count (ref), t (copy), Tbl (copy)
		assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
		local config = { disconnected = false, callback = Callback }
		
		if Count > 0 and t[Callback] == nil then
			Tbl[Callback] = config
		else
			t[Callback] = config
		end
		return function() --[[ Line: 127 | Named "disconnect" ]]
			-- upvalues: config (copy), t (upval), Callback (copy), Tbl (upval)
			assert(not config.disconnected, "Listeners can only be disconnected once.")
			config.disconnected = true
			
			if t[Callback] == config then
				t[Callback] = nil
			end
			if Tbl[Callback] == config then
				Tbl[Callback] = nil
			end
		end
	end, function(...) --[[ Line: 145 | Named "fire" ]]
		-- upvalues: Count (ref), fireConnections (upval), t (copy), Tbl (copy)
		Count += 1
		local Success, Result = pcall(fireConnections, t, ...)
		Count -= 1
		
		if Count == 0 and next(Tbl) ~= nil then
			for i, value in Tbl do
				t[i] = value
			end
			table.clear(Tbl)
		end
		if not Success then
			error(Result, 0)
		end
	end
end

return if require(script.Parent.Parent.Shared).ReactFeatureFlags.enableReentrantSafeSignals then createReentrantSafeSignal else createSignal