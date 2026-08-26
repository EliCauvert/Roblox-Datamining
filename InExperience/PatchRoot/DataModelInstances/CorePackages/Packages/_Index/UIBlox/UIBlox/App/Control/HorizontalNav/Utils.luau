return {
	shouldShowGradientsForScrollingFrame = function(p1)
		local x = p1.AbsoluteSize.X
		local offset = p1.CanvasSize.X.Offset
		local x_1 = p1.CanvasPosition.X
		
		return x < offset, x_1 > 20, x_1 + x < offset - 20
	end
}