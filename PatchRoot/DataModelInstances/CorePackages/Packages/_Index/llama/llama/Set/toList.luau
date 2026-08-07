-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(p0) --[[ line: 2 | named "toList" ]]
	local t = {}
	local var1 = 1
	
	for i, v in pairs(p0) do
		t[var1] = i
		var1 += 1
	end
	return t
end