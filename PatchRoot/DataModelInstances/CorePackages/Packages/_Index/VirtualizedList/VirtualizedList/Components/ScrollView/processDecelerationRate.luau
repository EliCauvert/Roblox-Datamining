-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

return function(p0) --[[ line: 16 | named "processDecelerationRate" ]]
	return if p0 == "normal" then 0.985 elseif p0 == "fast" then 0.9 else p0
end