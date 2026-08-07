-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	mapValueOrdered = function(p0, p1) --[[ line: 17 ]]
		-- upvalues: map (ref)
		local var0 = map.new()
		
		for i, v in p0 do
			local var1 = v[1]
			var0:set(var1, p1(v[2], var1))
		end
		return var0
	end
}