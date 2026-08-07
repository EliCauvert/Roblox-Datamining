-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "isScrollingFrameOverflowingY" ]]
	return p0.AbsoluteWindowSize.Y + (if p1 ~= nil then 1 else p1) < p0.AbsoluteCanvasSize.Y
end