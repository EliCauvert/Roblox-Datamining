local getTextSizeModule = require(script.Parent.GetTextSize)

return function(p0, p1, p2, p3, p4)
	-- upvalues: getTextSizeModule (ref)
	return string.rep(" ", math.ceil((p3 + p4) / (getTextSizeModule("  ", p1, p2, Vector2.new(0, 0)) - getTextSizeModule(" ", p1, p2, Vector2.new(0, 0))).X)) .. p0
end