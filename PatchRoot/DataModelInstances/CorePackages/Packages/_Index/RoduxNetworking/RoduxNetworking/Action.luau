-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 51 ]]
	assert(type(p0) == "string", "A name must be provided to create an Action")
	assert(type(p1) == "function", "A function must be provided to create an Action")
	
	return setmetatable({ name = p0 }, {
		__call = function(_, ...) --[[ line: 58 ]]
			-- upvalues: p1 (ref), p0 (ref)
			local var0 = p1(...)
			assert(type(var0) == "table", "An action must return a table")
			var0.type = p0
			
			return var0
		end
	})
end