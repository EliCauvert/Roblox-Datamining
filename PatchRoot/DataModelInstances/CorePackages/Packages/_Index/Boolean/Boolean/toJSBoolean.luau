-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local numberModule = require(script.Parent.Parent.Number)

return function(p0) --[[ line: 20 ]]
	-- upvalues: numberModule (ref)
	return not not p0 and (p0 ~= 0 and (p0 ~= "" and not numberModule.isNaN(p0)))
end