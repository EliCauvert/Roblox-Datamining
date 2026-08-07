-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

return function(p0) --[[ line: 5 | named "processSoftBreaks" ]]
	return p0:gsub("%s*[\r\n]%s*", " ")
end