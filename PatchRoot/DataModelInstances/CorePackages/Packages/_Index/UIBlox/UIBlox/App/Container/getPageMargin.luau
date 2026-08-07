-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:52 2026 Pacific Standard Time.

local tModule = require(script.Parent.Parent.Parent.Parent.t)

return function(p0) --[[ line: 8 ]]
	-- upvalues: tModule (ref)
	assert(tModule.number(p0))
	
	return if p0 < 360 then 12 elseif p0 < 600 then 24 else 48
end