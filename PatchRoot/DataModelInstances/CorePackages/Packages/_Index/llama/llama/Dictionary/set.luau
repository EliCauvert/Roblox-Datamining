-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local copyModule = require(script.Parent.copy)

return function(value, p0, p1) --[[ line: 4 | named "set" ]]
	-- upvalues: copyModule (ref)
	local var1 = type(value)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	assert(p0 ~= nil, "expected second argument to be anything but nil, got nil")
	local var2 = copyModule(value)
	var2[p0] = p1
	
	return var2
end