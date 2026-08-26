return function(p1, p2)
	return p1.AbsoluteWindowSize.Y + (if p2 ~= nil then 1 else p2) < p1.AbsoluteCanvasSize.Y
end