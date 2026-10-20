local _ = require(script.Parent.types)

return function()
	local t = {}
	local Tbl = {}
	local Flag = false
	
	return {
		subscribe = function(_, Callback)
			-- upvalues: Flag (ref), t (copy), Tbl (copy)
			local config = { unsubscribed = false, callback = Callback }
			
			if Flag and not t[Callback] then
				Tbl[Callback] = config
			else
				t[Callback] = config
			end
			return {
				unsubscribe = function(_)
					-- upvalues: config (copy), t (upval), Callback (copy), Tbl (upval)
					config.unsubscribed = true
					t[Callback] = nil
					Tbl[Callback] = nil
				end
			}
		end
	}, function(p1)
		-- upvalues: Flag (ref), t (copy), Tbl (copy)
		Flag = true
		
		for i, value in t do
			if not value.unsubscribed and not Tbl[i] then
				i(p1)
			end
		end
		Flag = false
		
		for i1, value1 in Tbl do
			t[i1] = value1
		end
		table.clear(Tbl)
	end
end