local getTextSizeModule = require(script.Parent.GetTextSize)

return function(p1, p2, p3, p4, p5)
	-- upvalues: getTextSizeModule (ref)
	return string.rep(" ", math.ceil((p4 + p5) / (getTextSizeModule("  ", p2, p3, Vector2.new(0, 0)) - getTextSizeModule(" ", p2, p3, Vector2.new(0, 0))).X)) .. p0
end