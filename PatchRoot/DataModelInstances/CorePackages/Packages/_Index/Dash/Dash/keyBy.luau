-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local collectModule = require(script.Parent.collect)

return function(p0, p1) --[[ line: 15 | named "keyBy" ]]
	-- upvalues: collectModule (ref)
	return collectModule(p0, function(p2, p3) --[[ line: 16 ]]
		-- upvalues: p1 (ref)
		return if typeof(p1) == "function" then p1(p3, p2) else p3[p1], p3
	end)
end