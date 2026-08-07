-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0) --[[ line: 5 | named "reverse" ]]
	local t = {}
	local p0Count = #p0
	local var2 = p0Count + 1
	
	for i = 1, p0Count do
		t[i] = p0[var2 - i]
	end
	return t
end