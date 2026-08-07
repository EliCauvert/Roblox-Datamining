local _ = require(script.Parent.types)

return function() --[[ line: 25 | named "createSignal" ]]
	local t = {}
	local t_1 = {}
	local var2 = false
	
	return {
		subscribe = function(_, p0) --[[ line: 31 ]]
			-- upvalues: var2 (write), t (ref), t_1 (ref)
			local t_2 = { unsubscribed = false, callback = p0 }
			
			if var2 and not t[p0] then
				t_1[p0] = t_2
			else
				t[p0] = t_2
			end
			return {
				unsubscribe = function(_) --[[ line: 45 ]]
					-- upvalues: t_2 (ref), t (copy), p0 (ref), t_1 (copy)
					t_2.unsubscribed = true
					t[p0] = nil
					t_1[p0] = nil
				end
			}
		end
	}, function(p1) --[[ line: 56 | named "fire" ]]
		-- upvalues: var2 (write), t (ref), t_1 (ref)
		var2 = true
		
		for i, v in t do
			if not v.unsubscribed and not t_1[i] then
				i(p1)
			end
		end
		var2 = false
		
		for i_1, v_1 in t_1 do
			t[i_1] = v_1
		end
		table.clear(t_1)
	end
end