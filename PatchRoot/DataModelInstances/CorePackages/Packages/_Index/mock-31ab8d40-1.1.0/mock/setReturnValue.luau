-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	getmetatable(p0)[symbolsModule.ReturnValue] = { p1 }
end