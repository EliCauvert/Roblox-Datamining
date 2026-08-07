-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 3 | named "getDiffBetweenOrientations" ]]
	local _, var0 = (p0 * p1:Inverse()):ToAxisAngle()
	
	return math.deg(var0)
end