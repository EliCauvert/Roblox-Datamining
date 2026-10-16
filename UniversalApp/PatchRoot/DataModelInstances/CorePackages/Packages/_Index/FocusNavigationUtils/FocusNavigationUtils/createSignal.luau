return function(p1) --[[ Line: 29 | Named "createSignal" ]]
	local t = {}
	local Tbl = {}
	local v1 = p1
	local Flag = false
	
	return {
		subscribe = function(_, Callback) --[[ Line: 36 ]]
			-- upvalues: Flag (ref), t (copy), Tbl (copy)
			local config = { unsubscribed = false, callback = Callback }
			
			if Flag and not t[Callback] then
				Tbl[Callback] = config
			else
				t[Callback] = config
			end
			return {
				unsubscribe = function(_) --[[ Line: 50 ]]
					-- upvalues: config (copy), t (upval), Callback (copy), Tbl (upval)
					config.unsubscribed = true
					t[Callback] = nil
					Tbl[Callback] = nil
				end
			}
		end,
		getValue = function(_) --[[ Line: 61 ]]
			-- upvalues: v1 (ref)
			return v1
		end
	}, function(p2) --[[ Line: 65 | Named "fire" ]]
		-- upvalues: v1 (ref), Flag (ref), t (copy), Tbl (copy)
		v1 = p2
		Flag = true
		
		for i, value in t do
			if not value.unsubscribed and not Tbl[i] then
				i(p2)
			end
		end
		Flag = false
		
		for i1, value1 in Tbl do
			t[i1] = value1
		end
		table.clear(Tbl)
	end
end