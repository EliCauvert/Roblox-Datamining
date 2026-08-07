-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

return function(p0) --[[ line: 3 ]]
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = #v
	end
	return t
end