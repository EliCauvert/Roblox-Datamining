-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

return function(value) --[[ line: 29 | named "createSignal" ]]
	local t = {}
	local t_1 = {}
	local var2 = value
	local var3 = false
	
	return {
		subscribe = function(_, p0) --[[ line: 36 ]]
			-- upvalues: var3 (write), t (ref), t_1 (ref)
			local t_2 = { unsubscribed = false, callback = p0 }
			
			if var3 and not t[p0] then
				t_1[p0] = t_2
			else
				t[p0] = t_2
			end
			return {
				unsubscribe = function(_) --[[ line: 50 ]]
					-- upvalues: t_2 (ref), t (copy), p0 (ref), t_1 (copy)
					t_2.unsubscribed = true
					t[p0] = nil
					t_1[p0] = nil
				end
			}
		end,
		getValue = function(_) --[[ line: 61 ]]
			-- upvalues: var2 (write)
			return var2
		end
	}, function(p1) --[[ line: 65 | named "fire" ]]
		-- upvalues: var2 (write), var3 (write), t (ref), t_1 (ref)
		var2 = p1
		var3 = true
		
		for i, v in t do
			if not v.unsubscribed and not t_1[i] then
				i(p1)
			end
		end
		var3 = false
		
		for i_1, v_1 in t_1 do
			t[i_1] = v_1
		end
		table.clear(t_1)
	end
end