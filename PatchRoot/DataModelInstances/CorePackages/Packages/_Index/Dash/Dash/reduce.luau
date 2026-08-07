-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 14 | named "reduce" ]]
	local var0 = p2
	
	for i, v in p0 do
		var0 = p1(var0, v, i)
	end
	return var0
end