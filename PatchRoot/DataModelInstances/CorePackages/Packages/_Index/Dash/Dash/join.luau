-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local _ = require(parent.Types)
local assignModule = require(parent.assign)

return function(...) --[[ line: 13 | named "join" ]]
	-- upvalues: assignModule (ref)
	return assignModule({}, ...)
end