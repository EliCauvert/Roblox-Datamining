local var0 = newproxy(false)

return function(p0)
	-- upvalues: var0 (ref)
	return {
		setInterval = function(value, p1, ...)
			-- upvalues: var0 (copy), p0 (ref)
			local list = { ... }
			local t = { [var0] = 1 }
			
			if p1 == nil then
				p1 = 0
			end
			local var3 = p1 / 1000
			local _ = nil
			
			local var4 = function()
				-- upvalues: p0 (copy), var3 (ref), t (ref), var0 (copy), value (ref), list (ref), var4 (write)
				p0(var3, function()
					-- upvalues: t (copy), var0 (copy), value (copy), list (copy), var4 (copy)
					if t[var0] == 1 then
						value(unpack(list))
						var4()
					end
				end)
			end
			
			var4()
			
			return t
		end,
		clearInterval = function(p2)
			-- upvalues: var0 (copy)
			if p2[var0] == 1 then
				p2[var0] = 3
			end
		end
	}
end