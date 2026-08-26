local getTextSizeModule = require(script.Parent.GetTextSize)

return function(p1, p2, p3, p4, p5)
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p1, p3, p2, Vector2.new(p4, math.min(10000, p5 or 10000))).Y
end