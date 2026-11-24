return function()
	local t = {}
	
	return {
		Connect = function(_, p1)
			-- upvalues: t (copy)
			local config = { Connected = true }
			t[config] = p1
			
			function config.Disconnect()
				-- upvalues: config (copy), t (upval)
				config.Connected = false
				t[config] = nil
			end
			
			return config
		end,
		Fire = function(_, ...)
			-- upvalues: t (copy)
			local t1 = {}
			
			for i, value in t do
				t1[i] = value
			end
			for i1, value1 in t1 do
				if i1.Connected then
					value1(...)
				end
			end
		end,
		getListenerCount = function(_): number
			-- upvalues: t (copy)
			local Count = 0
			
			for _ in t do
				Count += 1
			end
			return Count
		end
	}
end