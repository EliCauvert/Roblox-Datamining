return {
	shouldShowGradientsForScrollingFrame = function(p0)
		local x = p0.AbsoluteSize.X
		local offset = p0.CanvasSize.X.Offset
		local x_1 = p0.CanvasPosition.X
		
		return x < offset, x_1 > 20, x_1 + x < offset - 20
	end
}