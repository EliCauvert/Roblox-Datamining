local _ = require(script.Parent.types)

return function()
	local t = {}
	local t_1 = {}
	local var1 = false
	
	return {
		subscribe = function(_, p1)
			-- upvalues: var1 (write), t (ref), t_1 (ref)
			local t_2 = { unsubscribed = false, callback = p1 }
			
			if var1 and not t[p1] then
				t_1[p1] = t_2
			else
				t[p1] = t_2
			end
			return {
				unsubscribe = function(_)
					-- upvalues: t_2 (ref), t (copy), p1 (ref), t_1 (copy)
					t_2.unsubscribed = true
					t[p1] = nil
					t_1[p1] = nil
				end
			}
		end
	}, function(p1)
		-- upvalues: var1 (write), t (ref), t_1 (ref)
		var1 = true
		
		for i, v in t do
			if not v.unsubscribed and not t_1[i] then
				i(p1)
			end
		end
		var1 = false
		
		for i_1, v_1 in t_1 do
			t[i_1] = v_1
		end
		table.clear(t_1)
	end
end