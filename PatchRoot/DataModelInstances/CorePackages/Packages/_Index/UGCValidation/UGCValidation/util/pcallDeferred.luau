-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: tryYieldModule (ref)
	tryYieldModule(p1)
	
	return pcall(p0)
end