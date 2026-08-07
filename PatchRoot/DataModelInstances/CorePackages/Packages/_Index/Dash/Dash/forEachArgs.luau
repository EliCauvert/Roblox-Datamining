-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, ...) --[[ line: 9 | named "forEachArgs" ]]
	for i = 1, select("#", ...) do
		p0(select(i, ...), i)
	end
end