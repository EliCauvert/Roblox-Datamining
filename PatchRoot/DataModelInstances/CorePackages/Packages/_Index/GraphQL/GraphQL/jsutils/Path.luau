-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return {
	addPath = function(p0, p1, p2) --[[ line: 21 ]]
		return { prev = p0, key = p1, typename = p2 }
	end,
	pathToArray = function(p3) --[[ line: 29 ]]
		-- upvalues: array (ref)
		local t = {}
		local var1 = p3
		while var1 do
			table.insert(t, var1.key)
			var1 = var1.prev
		end
		return array.reverse(t)
	end
}