-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "getFormatTime" ]]
	return string.format("%01d:%02d", math.floor(p0 / 60), math.floor(p0 % 60))
end