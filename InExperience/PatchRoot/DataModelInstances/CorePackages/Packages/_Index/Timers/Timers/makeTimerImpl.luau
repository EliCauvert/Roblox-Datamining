local var0 = newproxy(false)

return function(p0)
	-- upvalues: var0 (ref)
	return {
		setTimeout = function(value, p1, ...)
			-- upvalues: var0 (copy), p0 (ref)
			local list = { ... }
			local t = { [var0] = 1 }
			
			if p1 == nil then
				p1 = 0
			end
			p0(p1 / 1000, function()
				-- upvalues: t (ref), var0 (copy), value (ref), list (ref)
				if t[var0] == 1 then
					value(unpack(list))
					t[var0] = 2
				end
			end)
			
			return t
		end,
		clearTimeout = function(p2)
			-- upvalues: var0 (copy)
			if p2 == nil then return end
			if p2[var0] == 1 then
				p2[var0] = 3
			end
		end
	}
end