local function _(List, Key, p1) --[[ Line: 1 | Named "addToMap" ]]
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	t[Key] = p1
	
	return t
end

local _ = function(List, p2) --[[ Line: 13 | Named "removeFromMap" ]]
	local t = {}
	
	for i, value in pairs(List) do
		if i ~= p2 then
			t[i] = value
		end
	end
	return t
end

return function() --[[ Line: 25 | Named "createSignal" ]]
	local t = {}
	
	return {
		subscribe = function(_, Callback) --[[ Line: 28 ]]
			-- upvalues: t (ref)
			assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
			local config = { callback = Callback }
			local t1 = {}
			
			for i, value in pairs(t) do
				t1[i] = value
			end
			t1[Callback] = config
			t = t1
			
			return function() --[[ Line: 37 | Named "disconnect" ]]
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
		fire = function(_, ...) --[[ Line: 47 ]]
			-- upvalues: t (ref)
			for i, value in pairs(t) do
				if not value.disconnected then
					i(...)
				end
			end
		end
	}
end