local exhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return function(p1, p2, p3)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p3 == "x" then UDim2.new(0, p1.X.Offset - p2, p1.Y.Scale, p1.Y.Offset) elseif p3 == "y" then UDim2.new(p1.X.Scale, p1.X.Offset, 0, p1.Y.Offset - p2) else exhaustiveMatchModule(p3)
end