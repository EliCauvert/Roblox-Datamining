local GetTextSizeModule = require(script.Parent.GetTextSize)

return function(p1, p2, p3, X, p4)
	-- upvalues: GetTextSizeModule (copy)
	return GetTextSizeModule(p1, p3, p2, (Vector2.new(X, (math.min(10000, p4 or 10000))))).Y
end