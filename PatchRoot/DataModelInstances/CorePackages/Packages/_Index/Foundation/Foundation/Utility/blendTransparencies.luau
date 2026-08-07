-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "blendTransparencies" ]]
	return if p0 == nil then p1 or 0 elseif p1 == nil then p0 or 0 else 1 - (1 - p0) * (1 - p1)
end