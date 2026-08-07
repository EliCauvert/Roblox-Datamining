-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyMapOrdered = function(p0, p1) --[[ line: 37 ]]
		-- upvalues: map (ref)
		local var0 = map.new()
		
		for i = 1, #p0 do
			local var1 = p0[i]
			var0:set(p1(var1), var1)
		end
		return var0
	end
}