local getTextSizeModule = require(script.Parent.GetTextSize)

return function(p0, p1, p2, p3, p4) --[[ line: 6 | named "getTextHeight" ]]
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p0, p2, p1, Vector2.new(p3, math.min(10000, p4 or 10000))).Y
end