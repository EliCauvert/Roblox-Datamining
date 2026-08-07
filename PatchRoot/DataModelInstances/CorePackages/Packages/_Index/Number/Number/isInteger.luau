-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

return function(p0) --[[ line: 17 ]]
	return type(p0) == "number" and (p0 ~= 1e999 and p0 == math.floor(p0))
end