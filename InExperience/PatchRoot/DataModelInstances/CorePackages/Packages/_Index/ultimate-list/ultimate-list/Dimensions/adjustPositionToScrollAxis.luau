local ExhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return function(Vector, p1, p2) --[[ Line: 5 | Named "adjustPositionToScrollAxis" ]]
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p2 == "x" then UDim2.new(0, Vector.X.Offset - p1, Vector.Y.Scale, Vector.Y.Offset) elseif p2 == "y" then UDim2.new(Vector.X.Scale, Vector.X.Offset, 0, Vector.Y.Offset - p1) else ExhaustiveMatchModule(p2)
end