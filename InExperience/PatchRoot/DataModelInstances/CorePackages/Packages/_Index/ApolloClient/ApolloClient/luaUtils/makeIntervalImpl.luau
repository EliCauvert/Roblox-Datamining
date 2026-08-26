local var1 = newproxy(false)

return function(p1)
	-- upvalues: var1 (ref)
	return {
		setInterval = function(value, p2, ...)
			-- upvalues: var1 (copy), p1 (ref)
			local list = { ... }
			local t = { [var1] = 1 }
			
			if p2 == nil then
				p2 = 0
			end
			local var2 = p2 / 1000
			local _ = nil
			
			local var3 = function()
				-- upvalues: p1 (copy), var2 (ref), t (ref), var1 (copy), value (ref), list (ref), var3 (write)
				p1(var2, function()
					-- upvalues: t (copy), var1 (copy), value (copy), list (copy), var3 (copy)
					if t[var1] == 1 then
						value(unpack(list))
						var3()
					end
				end)
			end
			
			var3()
			
			return t
		end,
		clearInterval = function(p2)
			-- upvalues: var1 (copy)
			if p2[var1] == 1 then
				p2[var1] = 3
			end
		end
	}
end