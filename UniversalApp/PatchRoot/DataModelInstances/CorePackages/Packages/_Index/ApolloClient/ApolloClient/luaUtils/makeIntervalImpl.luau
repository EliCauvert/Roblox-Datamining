local Proxy = newproxy(false)

return function(Callback) --[[ Line: 17 ]]
	-- upvalues: Proxy (copy)
	return {
		setInterval = function(Callback1, p1: number, ...) --[[ Line: 18 ]]
			-- upvalues: Proxy (upval), Callback (copy)
			local list = { ... }
			local config = { [Proxy] = 1 }
			
			if p1 == nil then
				p1 = 0
			end
			local v1 = p1 / 1000
			local _ = nil
			
			local function v5() --[[ Line: 33 ]]
				-- upvalues: Callback (upval), v1 (copy), config (copy), Proxy (upval), Callback1 (copy), list (copy), v5 (ref)
				Callback(v1, function() --[[ Line: 34 ]]
					-- upvalues: config (upval), Proxy (upval), Callback1 (upval), list (upval), v5 (upval)
					if config[Proxy] == 1 then
						Callback1(unpack(list))
						v5()
					end
				end)
			end
			
			v5()
			
			return config
		end,
		clearInterval = function(p1) --[[ Line: 47 ]]
			-- upvalues: Proxy (upval)
			if p1[Proxy] == 1 then
				p1[Proxy] = 3
			end
		end
	}
end