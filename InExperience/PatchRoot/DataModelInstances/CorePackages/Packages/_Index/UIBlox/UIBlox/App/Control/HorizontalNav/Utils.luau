return {
	shouldShowGradientsForScrollingFrame = function(ScrollFrame) --[[ Line: 11 ]]
		local X: number = ScrollFrame.AbsoluteSize.X
		local Offset: number = ScrollFrame.CanvasSize.X.Offset
		local X1: number = ScrollFrame.CanvasPosition.X
		
		return X < Offset, X1 > 20, X1 + X < Offset - 20
	end
}