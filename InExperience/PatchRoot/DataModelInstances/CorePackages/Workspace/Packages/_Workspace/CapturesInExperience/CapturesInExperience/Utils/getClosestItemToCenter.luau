return function(Vector, Frame)
	local CanvasPosition = Frame.CanvasPosition
	local NewFloored = math.floor((CanvasPosition.X + Frame.AbsoluteSize.X / 2) / Vector.X) + 1
	
	return NewFloored, (math.abs(CanvasPosition.X - (NewFloored - 1) * Vector.X))
end