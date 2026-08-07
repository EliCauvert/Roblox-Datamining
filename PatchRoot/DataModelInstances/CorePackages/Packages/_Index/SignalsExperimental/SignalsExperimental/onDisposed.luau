-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:21 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Signals)

return function(p0, p1) --[[ line: 7 | named "onDisposed" ]]
	p0(function(_, p2) --[[ line: 8 | named "source" ]]
		-- upvalues: p1 (ref)
		if p2 then
			p1()
		end
		return 0
	end)
end