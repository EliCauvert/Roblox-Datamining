-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local toSetModule = require(script.Parent.Parent.List.toSet)

return function(p0, ...) --[[ line: 4 | named "removeValue" ]]
	-- upvalues: toSetModule (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = toSetModule({ ... })
	local t = {}
	local var4 = 1
	
	for i = 1, #p0 do
		if not var2[p0[i]] then
			t[var4] = p0[i]
			var4 += 1
		end
	end
	return t
end