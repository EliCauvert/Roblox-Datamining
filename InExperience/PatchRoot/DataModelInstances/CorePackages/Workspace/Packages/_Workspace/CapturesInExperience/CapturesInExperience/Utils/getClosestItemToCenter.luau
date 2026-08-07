return function(p0, p1) --[[ line: 1 | named "getClosestItemToCenter" ]]
	local canvasPosition = p1.CanvasPosition
	local var0 = math.floor((canvasPosition.X + p1.AbsoluteSize.X / 2) / p0.X) + 1
	
	return var0, math.abs(canvasPosition.X - (var0 - 1) * p0.X)
end