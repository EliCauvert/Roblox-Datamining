local var1 = newproxy(false)

return function(p1)
	-- upvalues: var1 (ref)
	return {
		setTimeout = function(value, p2, ...)
			-- upvalues: var1 (copy), p1 (ref)
			local list = { ... }
			local t = { [var1] = 1 }
			
			if p2 == nil then
				p2 = 0
			end
			p1(p2 / 1000, function()
				-- upvalues: t (ref), var1 (copy), value (ref), list (ref)
				if t[var1] == 1 then
					value(unpack(list))
					t[var1] = 2
				end
			end)
			
			return t
		end,
		clearTimeout = function(p2)
			-- upvalues: var1 (copy)
			if p2 == nil then return end
			if p2[var1] == 1 then
				p2[var1] = 3
			end
		end
	}
end