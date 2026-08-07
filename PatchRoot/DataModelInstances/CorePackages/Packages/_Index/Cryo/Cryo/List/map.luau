-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 4 | named "map" ]]
	local t = {}
	
	for i = 1, #p0 do
		t[i] = p1(p0[i], i)
	end
	return t
end