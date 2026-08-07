-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(...) --[[ line: 2 | named "union" ]]
	local t = {}
	
	for i_1 = 1, select("#", ...) do
		for i, v in pairs(select(i_1, ...)) do
			t[i] = true
		end
	end
	return t
end