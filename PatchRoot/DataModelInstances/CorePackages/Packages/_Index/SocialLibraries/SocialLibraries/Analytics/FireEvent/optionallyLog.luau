-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)

return function(p0, p1) --[[ line: 4 ]]
	return function(p2) --[[ line: 5 ]]
		-- upvalues: p0 (ref), p1 (ref)
		if p0 then
			p0:info(p1(p2))
		end
		return p2
	end
end