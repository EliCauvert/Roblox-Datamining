return function() --[[ Line: 11 | Named "createSignal" ]]
	local t = {}
	local t1 = {}
	local Flag = false
	
	return {
		subscribe = function(_, Callback) --[[ Line: 16 ]]
			-- upvalues: Flag (ref), t (copy), t1 (copy)
			assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
			local config = { disconnected = false, callback = Callback }
			
			if Flag and not t[Callback] then
				t1[Callback] = config
			end
			t[Callback] = config
			
			return function() --[[ Line: 32 | Named "disconnect" ]]
				-- upvalues: config (copy), t (upval), Callback (copy), t1 (upval)
				assert(not config.disconnected, "Listeners can only be disconnected once.")
				config.disconnected = true
				t[Callback] = nil
				t1[Callback] = nil
			end
		end,
		fire = function(_, ...) --[[ Line: 43 ]]
			-- upvalues: Flag (ref), t (copy), t1 (copy)
			Flag = true
			
			for i, value in pairs(t) do
				if not value.disconnected and not t1[i] then
					i(...)
				end
			end
			Flag = false
			
			for i1, _ in pairs(t1) do
				t1[i1] = nil
			end
		end
	}
end