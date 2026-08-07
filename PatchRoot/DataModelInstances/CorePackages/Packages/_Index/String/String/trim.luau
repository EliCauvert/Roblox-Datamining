-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

local trimStartModule = require(script.Parent.trimStart)
local trimEndModule = require(script.Parent.trimEnd)

return function(p0) --[[ line: 20 ]]
	-- upvalues: trimStartModule (ref), trimEndModule (ref)
	return trimStartModule(trimEndModule(p0))
end