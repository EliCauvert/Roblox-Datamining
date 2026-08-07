-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:06 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return function(p0, p1, p2, p3) --[[ line: 6 | named "joinAndMapBindings" ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p1, p2, p3 }):map(function(p4) --[[ line: 12 ]]
		-- upvalues: p0 (ref)
		return p0(unpack(p4))
	end)
end