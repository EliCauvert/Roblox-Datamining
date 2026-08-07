-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local toSetModule = require(script.Parent.Parent.List.toSet)

return function(p0, ...) --[[ line: 4 | named "removeValues" ]]
	-- upvalues: toSetModule (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = toSetModule({ ... })
	local t = {}
	
	for i, v in pairs(p0) do
		if not var2[v] then
			t[i] = v
		end
	end
	return t
end