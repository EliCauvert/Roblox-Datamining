local Proxy = newproxy(false)

return function(Callback)
	-- upvalues: Proxy (copy)
	return {
		setTimeout = function(Callback1, p1: number, ...)
			-- upvalues: Proxy (upval), Callback (copy)
			local list = { ... }
			local config = { [Proxy] = 1 }
			
			if p1 == nil then
				p1 = 0
			end
			Callback(p1 / 1000, function()
				-- upvalues: config (copy), Proxy (upval), Callback1 (copy), list (copy)
				if config[Proxy] == 1 then
					Callback1(unpack(list))
					config[Proxy] = 2
				end
			end)
			
			return config
		end,
		clearTimeout = function(p1)
			-- upvalues: Proxy (upval)
			if p1 == nil then return end
			if p1[Proxy] == 1 then
				p1[Proxy] = 3
			end
		end
	}
end