-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local isIntegerModule = require(script.Parent.isInteger)
local MAX_SAFE_INTEGERModule = require(script.Parent.MAX_SAFE_INTEGER)

return function(p0) --[[ line: 20 ]]
	-- upvalues: isIntegerModule (ref), MAX_SAFE_INTEGERModule (ref)
	return isIntegerModule(p0) and math.abs(p0) <= MAX_SAFE_INTEGERModule
end