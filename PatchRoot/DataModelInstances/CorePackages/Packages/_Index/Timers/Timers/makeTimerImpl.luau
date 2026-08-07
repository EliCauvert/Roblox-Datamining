-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:29 2026 Pacific Standard Time.

local var0 = newproxy(false)

return function(p0) --[[ line: 24 ]]
	-- upvalues: var0 (ref)
	return {
		setTimeout = function(value, p1, ...) --[[ line: 25 ]]
			-- upvalues: var0 (copy), p0 (ref)
			local list = { ... }
			local t = { [var0] = 1 }
			
			if p1 == nil then
				p1 = 0
			end
			p0(p1 / 1000, function() --[[ line: 38 ]]
				-- upvalues: t (ref), var0 (copy), value (ref), list (ref)
				if t[var0] == 1 then
					value(unpack(list))
					t[var0] = 2
				end
			end)
			
			return t
		end,
		clearTimeout = function(p2) --[[ line: 48 ]]
			-- upvalues: var0 (copy)
			if p2 == nil then return end
			if p2[var0] == 1 then
				p2[var0] = 3
			end
		end
	}
end