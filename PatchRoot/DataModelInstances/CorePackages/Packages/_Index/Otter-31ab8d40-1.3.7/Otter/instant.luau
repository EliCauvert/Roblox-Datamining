-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local _ = require(script.Parent.types)

return function(p0) --[[ line: 5 | named "instant" ]]
	return {
		step = function() --[[ line: 7 ]]
			-- upvalues: p0 (ref)
			return { complete = true, value = p0 }
		end,
		startingValue = p0
	}
end