-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(value, p0, p1) --[[ line: 13 | named "getOrSet" ]]
	if value[p0] == nil then
		value[p0] = p1(value, p0)
	end
	return value[p0]
end