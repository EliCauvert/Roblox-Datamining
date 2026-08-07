-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local useLazyRefModule = require(script.Parent.useLazyRef)

return function(p0) --[[ line: 11 | named "useInitializedValue" ]]
	-- upvalues: useLazyRefModule (ref)
	return useLazyRefModule(p0).current
end