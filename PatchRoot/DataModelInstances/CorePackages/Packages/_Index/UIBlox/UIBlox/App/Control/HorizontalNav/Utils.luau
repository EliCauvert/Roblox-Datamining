-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:52 2026 Pacific Standard Time.

return {
	shouldShowGradientsForScrollingFrame = function(p0) --[[ line: 11 ]]
		local x = p0.AbsoluteSize.X
		local offset = p0.CanvasSize.X.Offset
		local x_1 = p0.CanvasPosition.X
		
		return x < offset, x_1 > 20, x_1 + x < offset - 20
	end
}