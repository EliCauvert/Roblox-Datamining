-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 25 ]]
	local _ = {}
	
	if not p1 then
		return table.clone(p0)
	end
	local p0Count = #p0
	local list = table.create(p0Count)
	
	for i = 1, p0Count do
		if p2 == nil then
			list[i] = p1(p0[i], i)
		else
			list[i] = p1(p2, p0[i], i)
		end
	end
	return list
end