-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

return function(value, ...) --[[ line: 1 | named "assign" ]]
	for i_1 = 1, select("#", ...) do
		for i, v in pairs(select(i_1, ...)) do
			value[i] = v
		end
	end
	return value
end