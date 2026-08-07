local exhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return function(p0, p1, p2) --[[ line: 5 | named "adjustPositionToScrollAxis" ]]
	-- upvalues: exhaustiveMatchModule (ref)
	return if p2 == "x" then UDim2.new(0, p0.X.Offset - p1, p0.Y.Scale, p0.Y.Offset) elseif p2 == "y" then UDim2.new(p0.X.Scale, p0.X.Offset, 0, p0.Y.Offset - p1) else exhaustiveMatchModule(p2)
end