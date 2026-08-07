-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:37 2026 Pacific Standard Time.

local floatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return function(p0) --[[ line: 9 | named "canBeNormalized" ]]
	-- upvalues: floatEqualsModule (ref)
	return not floatEqualsModule(p0.X, 0) or (not floatEqualsModule(p0.Y, 0) or not floatEqualsModule(p0.Z, 0))
end