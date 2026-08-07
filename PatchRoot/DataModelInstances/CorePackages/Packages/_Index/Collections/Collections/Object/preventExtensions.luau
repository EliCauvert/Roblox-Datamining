-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0) --[[ line: 26 | named "preventExtensions" ]]
	local var0 = tostring(p0)
	
	return setmetatable(p0, {
		__metatable = false,
		__newindex = function(_, p1, _) --[[ line: 31 ]]
			-- upvalues: var0 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p1), typeof(p1), var0), 2)
		end
	})
end