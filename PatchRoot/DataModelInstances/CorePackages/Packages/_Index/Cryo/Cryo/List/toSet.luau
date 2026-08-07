-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(value) --[[ line: 6 | named "toSet" ]]
	local t = {}
	
	for i = 1, #value do
		t[value[i]] = true
	end
	return t
end