-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local reduceModule = require(script.Parent.reduce)

return function(p0) --[[ line: 16 | named "product" ]]
	-- upvalues: reduceModule (ref)
	return reduceModule(p0, function(p1, p2) --[[ line: 17 ]]
		return p1 * p2
	end, 1)
end