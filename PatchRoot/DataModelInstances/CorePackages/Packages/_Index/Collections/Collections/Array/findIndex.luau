-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1) --[[ line: 22 ]]
	for i = 1, #p0 do
		if not p1(p0[i], i, p0) then
			continue
		end
		return i
	end
	return -1
end