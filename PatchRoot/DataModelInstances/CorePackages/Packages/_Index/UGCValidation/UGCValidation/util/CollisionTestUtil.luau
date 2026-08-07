-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

return {
	pointInAxisAlignedBounds = function(p0, p1, p2) --[[ line: 7 ]]
		local var0 = p0 - p1
		
		return -p2.X / 2 <= var0.X and (var0.X <= p2.X / 2 and (-p2.Y / 2 <= var0.Y and (var0.Y <= p2.Y / 2 and (-p2.Z / 2 <= var0.Z and var0.Z <= p2.Z / 2))))
	end
}