return function(p0, p1)
	return p0.AbsoluteWindowSize.Y + (if p1 ~= nil then 1 else p1) < p0.AbsoluteCanvasSize.Y
end