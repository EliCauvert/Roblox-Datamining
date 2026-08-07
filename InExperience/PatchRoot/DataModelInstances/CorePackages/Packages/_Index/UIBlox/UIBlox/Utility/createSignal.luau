return function() --[[ line: 11 | named "createSignal" ]]
	local t = {}
	local t_1 = {}
	local var2 = false
	
	return {
		subscribe = function(_, p0) --[[ line: 16 ]]
			-- upvalues: var2 (write), t (ref), t_1 (ref)
			assert(typeof(p0) == "function", "Can only subscribe to signals with a function.")
			local t_2 = { disconnected = false, callback = p0 }
			
			if var2 and not t[p0] then
				t_1[p0] = t_2
			end
			t[p0] = t_2
			
			return function() --[[ line: 32 | named "disconnect" ]]
				-- upvalues: t_2 (ref), t (copy), p0 (ref), t_1 (copy)
				assert(not t_2.disconnected, "Listeners can only be disconnected once.")
				t_2.disconnected = true
				t[p0] = nil
				t_1[p0] = nil
			end
		end,
		fire = function(_, ...) --[[ line: 43 ]]
			-- upvalues: var2 (write), t (ref), t_1 (ref)
			var2 = true
			
			for i, v in pairs(t) do
				if not v.disconnected and not t_1[i] then
					i(...)
				end
			end
			var2 = false
			
			for i_1, v_1 in pairs(t_1) do
				t_1[i_1] = nil
			end
		end
	}
end