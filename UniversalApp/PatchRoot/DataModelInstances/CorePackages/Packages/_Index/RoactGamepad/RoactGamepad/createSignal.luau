local function _(List, Key, p1)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	t[Key] = p1
	
	return t
end

local _ = function(List, p2)
	local t = {}
	
	for i, value in pairs(List) do
		if i ~= p2 then
			t[i] = value
		end
	end
	return t
end

return function()
	local t = {}
	
	return {
		subscribe = function(_, Callback)
			-- upvalues: t (ref)
			assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
			local config = { disconnected = false, callback = Callback }
			local t1 = {}
			
			for i, value in pairs(t) do
				t1[i] = value
			end
			t1[Callback] = config
			t = t1
			
			return function()
				-- upvalues: config (copy), t (upval), Callback (copy)
				assert(not config.disconnected, "Listeners can only be disconnected once.")
				config.disconnected = true
				local t2 = {}
				
				for i, value in pairs(t) do
					if i ~= Callback then
						t2[i] = value
					end
				end
				t = t2
			end
		end,
		fire = function(_, ...)
			-- upvalues: t (ref)
			for i, value in pairs(t) do
				if not value.disconnected then
					i(...)
				end
			end
		end
	}
end