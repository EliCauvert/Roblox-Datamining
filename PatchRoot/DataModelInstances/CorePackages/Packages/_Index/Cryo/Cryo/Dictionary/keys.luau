-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0) --[[ line: 4 | named "keys" ]]
	local t = {}
	local var1 = 1
	
	for i in pairs(p0) do
		t[var1] = i
		var1 += 1
	end
	return t
end