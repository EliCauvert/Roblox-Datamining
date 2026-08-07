-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 4 | named "foldRight" ]]
	local var0 = p2
	
	for i = #p0, 1, -1 do
		var0 = p1(var0, p0[i], i)
	end
	return var0
end