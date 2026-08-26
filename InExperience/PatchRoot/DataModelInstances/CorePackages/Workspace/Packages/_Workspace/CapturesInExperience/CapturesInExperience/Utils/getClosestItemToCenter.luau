return function(p1, p2)
	local canvasPosition = p2.CanvasPosition
	local var1 = math.floor((canvasPosition.X + p2.AbsoluteSize.X / 2) / p1.X) + 1
	
	return var1, math.abs(canvasPosition.X - (var1 - 1) * p1.X)
end