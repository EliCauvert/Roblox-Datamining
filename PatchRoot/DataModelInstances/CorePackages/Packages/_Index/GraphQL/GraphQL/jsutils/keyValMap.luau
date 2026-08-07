-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyValMap = function(p0, p1, p2) --[[ line: 32 ]]
		-- upvalues: map (ref)
		local var0 = map.new()
		
		for i, v in ipairs(p0) do
			var0:set(p1(v), p2(v))
		end
		return var0
	end
}