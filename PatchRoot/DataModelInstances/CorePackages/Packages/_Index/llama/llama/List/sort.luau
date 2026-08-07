-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local copyModule = require(script.Parent.copy)

return function(p0, p1) --[[ line: 4 | named "sort" ]]
	-- upvalues: copyModule (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = copyModule(p0)
	table.sort(var2, p1)
	
	return var2
end