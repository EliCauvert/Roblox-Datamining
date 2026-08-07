-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local toArrayContainsModule = require(script.Parent.toArrayContains)

return function(p0, p1) --[[ line: 17 | named "toBeOneOf" ]]
	-- upvalues: toArrayContainsModule (ref)
	return toArrayContainsModule(p1, p0)
end