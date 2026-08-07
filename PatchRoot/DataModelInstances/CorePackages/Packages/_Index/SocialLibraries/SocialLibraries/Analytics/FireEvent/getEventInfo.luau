-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)

return function(p0) --[[ line: 4 ]]
	return function(p1) --[[ line: 5 ]]
		-- upvalues: p0 (ref)
		local var0 = p0[p1]
		assert(var0, "Invalid eventName used: " .. tostring(p1) .. " called")
		
		return var0
	end
end