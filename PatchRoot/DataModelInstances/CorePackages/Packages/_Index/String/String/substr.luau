-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 16 ]]
	return if p2 and p2 <= 0 then "" else string.sub(p0, p1, if p2 then p1 + p2 - 1 else nil)
end