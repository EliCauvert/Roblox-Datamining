return function(p0, p1) --[[ line: 1 | named "isScrollingFrameOverflowingY" ]]
	return p0.AbsoluteWindowSize.Y + (if p1 ~= nil then 1 else p1) < p0.AbsoluteCanvasSize.Y
end