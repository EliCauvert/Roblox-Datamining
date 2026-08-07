-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return {
	byState = function(p0, p1) --[[ line: 20 ]]
		return { type = "byState", callback = p0, config = p1 or {} }
	end,
	byBinding = function(p2) --[[ line: 28 ]]
		return { type = "byBinding", callback = p2 }
	end
}