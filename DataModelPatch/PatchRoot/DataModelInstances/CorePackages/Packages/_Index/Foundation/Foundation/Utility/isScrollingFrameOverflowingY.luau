return function(ScrollFrame, p1): boolean
	return ScrollFrame.AbsoluteWindowSize.Y + (if p1 == nil then 1 else p1) < ScrollFrame.AbsoluteCanvasSize.Y
end